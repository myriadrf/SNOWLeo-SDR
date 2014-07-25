##############################################################################
## Filename:          J:\zing_pro\zing_pldma_v144\pldma.srcs\sources_1\edk\cpu0/drivers/pldma_v2_00_a/data/pldma_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Jan 22 10:14:00 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "pldma" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
