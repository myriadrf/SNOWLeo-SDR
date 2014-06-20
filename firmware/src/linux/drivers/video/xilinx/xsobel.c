
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/cdev.h>
#include <linux/slab.h>
#include <linux/fcntl.h>
#include <linux/sysctl.h>
#include <linux/fs.h>
#include <linux/interrupt.h>
#include <linux/workqueue.h>
#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/of_platform.h>
#include <linux/of_irq.h>
#include <asm/io.h>
#include <asm/uaccess.h>

/**
	debug code
**/
#define __DEBUG_PRINT__
#undef __DEBUG_PRINT__		//comment this line to start debugging

/* Driver Related Macros */
#define XSOBEL_MAJOR	10
#define XSOBEL_MINOR	235
#define DRIVER_NAME	"xsobel"

#define XFILTER_IOCTL_BASE					'S'
#define XFILTER_INIT						_IO(XFILTER_IOCTL_BASE, 0)
#define XFILTER_START						_IO(XFILTER_IOCTL_BASE, 1)
#define XFILTER_STOP						_IO(XFILTER_IOCTL_BASE, 2)
#define XFILTER_WAIT_FOR_COMPLETION			_IO(XFILTER_IOCTL_BASE, 3)

enum filter_mode
{
	E_xFilterContinousRunning,	// runs continuously. Need to issue stop to stop the execution.
	E_xFilterOnDemandRunning		// runs on demand, each start call corresponds to single frame transfer. Automatically stops after each frame transfer.
};

struct xFilterConfig
{
	u32 height;
	u32 width;
	enum filter_mode mode;
};

// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/SC)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        others - reserved
// 0x10 : reserved
// 0x14 : Data signal of rows
//        bit 31~0 - rows[31:0] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of cols
//        bit 31~0 - cols[31:0] (Read/Write)
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XFILTER_REG_AP_CTRL        0x00
#define XFILTER_REG_GIE            0x04
#define XFILTER_REG_IER            0x08
#define XFILTER_REG_ISR            0x0c
#define XFILTER_REG_ROWS	       0x14
#define XFILTER_REG_COLS    	   0x1c


#define XFILTER_WR(addr, offset, val) \
			(iowrite32((val), (addr)+(offset)))
#define XFILTER_RD(addr, offset) \
			(ioread32((addr) + (offset)))


struct xFilter_drvdata {
	resource_size_t mem_start;	// just for bookmarking
	resource_size_t mem_end;	// just for bookmarking
	resource_size_t mem_size;

	int irq;
	void __iomem *base_address;		/* virt. address of the control registers */

	int init_done;
	enum filter_mode mode;

	spinlock_t lock;

	struct tasklet_struct tasklet;
	struct completion *frm_filter_done;

	struct device *dev;
	struct cdev cdev;				/* Char device structure */
	dev_t devt;
};

static int xfilter_dev_id;

int xfilter_isDone(struct xFilter_drvdata *drvdata) // returns 0 if not done
{
	return ((XFILTER_RD(drvdata->base_address,XFILTER_REG_AP_CTRL) >> 1 ) & 1);
}

int xfilter_isIdle(struct xFilter_drvdata *drvdata) // returns 0 if busy
{
	return ((XFILTER_RD(drvdata->base_address,XFILTER_REG_AP_CTRL) >> 2 ) & 1);
}

void xfilter_init_ioctl(struct xFilter_drvdata *drvdata, struct xFilterConfig *data)
{
	unsigned long flags;
	spin_lock_irqsave(&drvdata->lock, flags);

	if (!xfilter_isIdle(drvdata))
	{
		spin_unlock_irqrestore(&drvdata->lock, flags);
		printk("xFilter Error : Init without stopping !! Please stop the filter first\n");
		return;
	}

	drvdata->mode = data->mode;
	XFILTER_WR(drvdata->base_address,XFILTER_REG_ROWS, data->height);
	XFILTER_WR(drvdata->base_address,XFILTER_REG_COLS, data->width);
	drvdata->init_done = 1;

	//enable the interrupt global
	XFILTER_WR(drvdata->base_address,XFILTER_REG_GIE, 1);

	spin_unlock_irqrestore(&drvdata->lock, flags);
}

void xfilter_start_ioctl(struct xFilter_drvdata *drvdata)
{
	unsigned long flags;
	spin_lock_irqsave(&drvdata->lock, flags);

	if (!drvdata->init_done)
	{
		spin_unlock_irqrestore(&drvdata->lock, flags);
		printk("xFilter Error : called start without doing init !!");
		return;
	}

	// do following assertions
	if (!xfilter_isIdle(drvdata))
	{
		spin_unlock_irqrestore(&drvdata->lock, flags);
		printk("xFilter Error : called start when filter is not idle\n");
		return;
	}

	if (drvdata->frm_filter_done)
	{
		spin_unlock_irqrestore(&drvdata->lock, flags);
		printk("xFilter Error : frm_filter_done not NULL .. Shouldn't happen !!");
		return;
	}

	// enable the interrupt
	XFILTER_WR(drvdata->base_address,XFILTER_REG_IER, 1);

	// start the filter
	XFILTER_WR(drvdata->base_address,XFILTER_REG_AP_CTRL, 1);

	spin_unlock_irqrestore(&drvdata->lock, flags);

}


// reset the stat of xfilter and stop the filter.
// need to redo the init after the stop call.
void xfilter_stop_ioctl(struct xFilter_drvdata *drvdata)
{
	unsigned long flags;

	spin_lock_irqsave(&drvdata->lock, flags);

	drvdata->init_done = 0;
	drvdata->mode = E_xFilterOnDemandRunning;

	spin_unlock_irqrestore(&drvdata->lock, flags);

	// leave the spin lock to make sure isr gets the chance.

	spin_lock_irqsave(&drvdata->lock, flags);
	//disable the global interrupt for xfilter
	//TODO: make sure we disable this only after ip intr is cleared and disabled.
	XFILTER_WR(drvdata->base_address,XFILTER_REG_GIE, 0);
	spin_unlock_irqrestore(&drvdata->lock, flags);

	//TODO: Assert for frm_filter_done == NULL
	//TODO: wait for the idle

}

void xfilter_wait_ioctl(struct xFilter_drvdata *drvdata)
{
	unsigned long flags;
	static struct completion cmp;
	unsigned long tmo = msecs_to_jiffies(100);

	// assert tmo for +ve values

	spin_lock_irqsave(&drvdata->lock, flags);

	if (!drvdata->init_done)
	{
		spin_unlock_irqrestore(&drvdata->lock, flags);
		printk("xFilter Error : called wait without doing init !!");
		return;
	}

	if (xfilter_isDone(drvdata))
	{
		// if the frame is already transfer than return immediately
		spin_unlock_irqrestore(&drvdata->lock, flags);
		return;
	}

	init_completion(&cmp);
	drvdata->frm_filter_done = &cmp;

	spin_unlock_irqrestore(&drvdata->lock, flags);

	tmo = wait_for_completion_timeout(drvdata->frm_filter_done, tmo);
	if(0 == tmo )
		printk("xFilter Error : Timeout while waiting !!");

	spin_lock_irqsave(&drvdata->lock, flags);
	drvdata->frm_filter_done = NULL;
	spin_unlock_irqrestore(&drvdata->lock, flags);
}

static int xsobel_open(struct inode *inode, struct file *file)
{
	//printk("Opening Sobel Filter IP driver from %s \n", __func__);
	return 0;
}

static int xsobel_release(struct inode *inode, struct file *file)
{//TODO: clean up
	return 0;
}

static long xsobel_ioctl(struct file *file,
                        unsigned int cmd, unsigned long arg)
{
	struct inode *inode = file->f_dentry->d_inode;
	struct xFilter_drvdata *drvdata = container_of(inode->i_cdev, struct xFilter_drvdata, cdev);

	struct xFilterConfig data;


	switch (cmd) {
	case XFILTER_INIT:
		if (copy_from_user(&data, (void *)arg,
				sizeof(data)))
			return -EFAULT;

		xfilter_init_ioctl(drvdata, &data);
		break;

	case XFILTER_START:
		xfilter_start_ioctl(drvdata);
		break;

	case XFILTER_STOP:
		xfilter_stop_ioctl(drvdata);
		break;

	case XFILTER_WAIT_FOR_COMPLETION:
		xfilter_wait_ioctl(drvdata);
		break;

	default:
		break;
	}

	return 0;
}

static void xfilter_do_tasklet(unsigned long data)
{
	struct xFilter_drvdata *drvdata = (struct xFilter_drvdata *)data;
	unsigned long flags;

	spin_lock_irqsave(&drvdata->lock, flags);

	if(drvdata->mode == E_xFilterOnDemandRunning)
	{
		// Do the sanity check
		if (!xfilter_isDone(drvdata))
		{
			spin_unlock_irqrestore(&drvdata->lock, flags);
			printk("xFilter Error : In tasklet without ap_done !!");
			return;
		}

		// mark the completion here
		if (drvdata->frm_filter_done)
		{
			spin_unlock_irqrestore(&drvdata->lock, flags);
			complete(drvdata->frm_filter_done);
			return;
		}
	}
	else
	{
		//printk("xFilter Error : In tasklet without E_xFilterOnDemandRunning flag !! Should get here !!");
	}
	spin_unlock_irqrestore(&drvdata->lock, flags);
}

static irqreturn_t filter_intr_handler(int irq, void *data)
{
	struct xFilter_drvdata *drvdata = data;
	u32 stat;
	unsigned long flags;

	spin_lock_irqsave(&drvdata->lock, flags);

	// Disable the interrupt
	XFILTER_WR(drvdata->base_address, XFILTER_REG_IER, 0);

	// check which interrupt
	stat = XFILTER_RD(drvdata->base_address, XFILTER_REG_ISR);

	if(stat == 1) 		// Do the sanity check
	{
		// Clear & Ack the interrupts
		XFILTER_WR(drvdata->base_address, XFILTER_REG_ISR,1);

		// restart frame processing or set completed status
		if (drvdata->mode == E_xFilterContinousRunning)
		{
			spin_unlock_irqrestore(&drvdata->lock, flags);
			xfilter_start_ioctl(data);
		}
		else
		{
			spin_unlock_irqrestore(&drvdata->lock, flags);
			tasklet_schedule(&drvdata->tasklet);
		}

		return IRQ_HANDLED;
	}
	else
	{
		// Assert failed
		printk("xFilter Error : In ISR without ap done !!");
	}
	spin_unlock_irqrestore(&drvdata->lock, flags);
	return IRQ_HANDLED;
}


static const struct file_operations xsobel_fops = {
	.owner = THIS_MODULE,
	.open = xsobel_open,
	.unlocked_ioctl = xsobel_ioctl,
	.release = xsobel_release,
};

static int __devinit
xsobel_of_probe(struct platform_device *op)
{
	dev_t devt;
	struct xFilter_drvdata *drvdata = NULL;
	struct device *dev = &op->dev;
	struct resource r_mem;
	int retval;
	devt = MKDEV(XSOBEL_MAJOR, XSOBEL_MINOR + xfilter_dev_id);

	drvdata = kzalloc(sizeof(struct xFilter_drvdata), GFP_KERNEL);
	if (!drvdata) {
		dev_err(dev, "Couldn't allocate device private record\n");
		retval = -ENOMEM;
		goto failed0;
	}
	dev_set_drvdata(dev, (void *)drvdata);

	/* Get the Sobel IP controller reg space virtual address */
	retval = of_address_to_resource(dev->of_node, 0, &r_mem);		/* 0x400D0000 ...SOBEL_BASE */
	if (retval) {
		dev_warn(dev, "Invalid Address\n");
		goto failed1;
	}

	drvdata->dev = dev;
	drvdata->devt = devt;
	drvdata->mem_start = r_mem.start;
	drvdata->mem_end = r_mem.end;
	drvdata->mem_size = r_mem.end - r_mem.start + 1;

	if (!request_mem_region(drvdata->mem_start,
				drvdata->mem_size, DRIVER_NAME)) {
		dev_err(dev, "Couldn't lock memory region at %Lx\n",
			(unsigned long long) drvdata->mem_start);
		retval = -EBUSY;
		goto failed1;
	}
	drvdata->base_address = ioremap(drvdata->mem_start,
					drvdata->mem_size);
	if (!drvdata->base_address) {
		dev_err(dev, "ioremap() failed\n");
		goto failed2;
	}

	/* find the IRQ line, if it exists in the device tree */
	drvdata->irq = irq_of_parse_and_map(dev->of_node, 0);
	retval = request_irq(drvdata->irq, filter_intr_handler, IRQF_SHARED,
				"Xilinx-filter-controller", drvdata);
	if (retval) {
		dev_err(dev, "unable to request IRQ\n");
		goto failed2;
	}

#ifdef	__DEBUG_PRINT__
	printk("PBJ: Sobel driver Interrupt number is %d \n", drvdata->irq);
#endif

	cdev_init(&drvdata->cdev, &xsobel_fops);
	drvdata->cdev.owner = THIS_MODULE;
	retval = cdev_add(&drvdata->cdev, devt, 1);
	if (retval) {
		dev_err(dev, "cdev_add() failed\n");
		goto failed2;
	}

	dev_info(dev,
		"Xilinx Sobel at 0x%08X mapped to 0x%08X",
		(unsigned int __force)r_mem.start,
		(unsigned int __force)drvdata->base_address);

	tasklet_init(&drvdata->tasklet, xfilter_do_tasklet, (unsigned long)drvdata);

	drvdata->frm_filter_done = NULL;

	drvdata->init_done = 0;
	drvdata->mode = E_xFilterOnDemandRunning;

	xfilter_dev_id++;
	return 0;

failed2:
	release_mem_region(drvdata->mem_start, drvdata->mem_size);
failed1:
	kfree(drvdata);
failed0:
	return retval;
}

static int __devexit xsobel_of_remove(struct platform_device *op)
{
	//TODO: check this part.
	struct xFilter_drvdata *drvdata;
	struct device *dev = &op->dev;

	drvdata = (struct xFilter_drvdata *)dev_get_drvdata(dev);
	if (!drvdata)
		return 0;

	cdev_del(&drvdata->cdev);
	iounmap(drvdata->base_address);
	release_mem_region(drvdata->mem_start, drvdata->mem_size);
	kfree(drvdata);
	dev_set_drvdata(dev, NULL);

	xfilter_dev_id--;

	return 0;
}

static const struct of_device_id __devinitconst xsobel_of_match[] = {
	{ .compatible = "xlnx,axi-sobel-1.00.a", },
	{},
};
MODULE_DEVICE_TABLE(of, xsobel_of_match);

static struct platform_driver xsobel_of_driver = {
	.probe = xsobel_of_probe,
	.remove = __devexit_p(xsobel_of_remove),
	.driver = {
		.name = DRIVER_NAME,
		.owner = THIS_MODULE,
		.of_match_table = xsobel_of_match,
	},
};

static int __init xsobel_module_init(void)
{
	return platform_driver_register(&xsobel_of_driver);
}

static void __exit xsobel_module_cleanup(void)
{
	platform_driver_unregister(&xsobel_of_driver);
}

module_init(xsobel_module_init);
module_exit(xsobel_module_cleanup);

MODULE_AUTHOR("Xilinx, Inc. <source@xilinx.com>");
MODULE_DESCRIPTION("Xilinx 2D Sobel  Filter Driver");
MODULE_LICENSE("GPL");
