# SNOWLeo SDR

A low cost SDR platform with MATLAB and GNU Radio support, that is based on the SNOWLeo and Myriad-RF 1 modules. 

For further details see the [project page](http://myriadrf.org/snowleo-sdr/).

## Structure

      docs/ - documentation
      firmware/ - FPGA RTL, FSBL, U-boot, Linux and Zing application
          bin/ - binaries
          src/ - sources
              fpga/      - FPGA RTL
              linux/     - Linux kernel tree
              u-boot/    - U-boot bootloader
              zing/      - Zing application
      hardware/ - SDR adapter hardware design
          Allegro/       - EDA design files
          BOM/           - Bill of materials
          Manufacturing/ - Fabrication files
          PDF/           - PDF design files
      host/ - host application support
          GNURadio/      - GNU Radio integration
          Matlab/        - Matlab examples

## Licensing

See the COPYING files.
