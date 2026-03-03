---
defaults: website_en
title: Download [matrixxx]
toc: false
lang: en
---
<!-- *********************************************************************** -->

********************************************************************************
# Download options

<!-- ![](../svg/todo.svg){ alt="[matrixxx] TODO" width="100" } -->
<img src="../svg/todo.svg" alt="[matrixxx] TODO" width="100" />

- **git repository:** <https://github.com/matrixxx-dev>

#### Quick guide (without adjustments)
  - **matrixxx-boot-device-content**:
    - Format USB stick with "vfat" or "fat32" or format ext4
    - Download as zip (<> code) and unpack on the USB stick
    - Run the script /boot/scripts/script-bootinstall.sh on the USB stick
  - **matrixxx-os-build**: (ToDo: too big! ~20GB Software - in SquashFS ~9GB per arch.)
    - Clone repository locally
    - Run xx-build.sh (creates 3 SquashFS layers each for x86 32-bit
      and 64-bit) - approx. 3 hours running time with the current settings
      - Copy matrixxx_00/amd64/LAYER* into the SYSTEM_amd64 directory on the USB stick
      - Copy matrixxx_00/i386/LAYER* into the SYSTEM_i386 directory on the USB stick
  - **matrixxx-remaster**: (ToDo: missing parts)
    - Clone repository locally
    - Run PROCESS.sh (creates 4 SquashFS layers that configure the OS)
      - Copy LAYER15, LAYER17, LAYER19 into the SYSTEM directory of the USB stick
      - Copy LAYER64 into the SYSTEM_amd64 directory on the USB stick
      - Copy LAYER32 into the SYSTEM_i386 directory of the USB stick
- now the USB stick should contain 'matrixxx live system' and should be bootable

(GNU General Public License Version 2, June 1991)

********************************************************************************
