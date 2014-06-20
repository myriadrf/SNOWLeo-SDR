/*
 * (C) Copyright 2013 V3best
 *
 * Configuration settings for the V3best Snowleo boards
 * See zynq_common.h for Zynq common configs
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#ifndef __CONFIG_ZYNQ_SNOWLEO_H
#define __CONFIG_ZYNQ_SNOWLEO_H

#define PHYS_SDRAM_1_SIZE (512 * 1024 * 1024)

#define CONFIG_ZYNQ_SERIAL_UART0
#define CONFIG_PHY_ADDR	7

#define CONFIG_ZYNQ_GEM_OLD
#define CONFIG_XGMAC_PHY_ADDR CONFIG_PHY_ADDR
#define CONFIG_SYS_ENET

#define CONFIG_ENV_IS_NOWHERE
#define CONFIG_SYS_NO_FLASH

#define CONFIG_MMC

#include <configs/zynq_common.h>

#endif /* __CONFIG_ZYNQ_SNOWLEO_H */
