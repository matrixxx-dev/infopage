---
defaults: website_en
title: Introduction [matrixxx]
toc: false
lang: en
cut-extension: true
---
<!-- *********************************************************************** -->

********************************************************************************
<!-- ![](../svg/todo.svg){ alt="[matrixxx] TODO" width="100" } -->
<img src="../svg/todo.svg" alt="[matrixxx] TODO" width="100" />

# System description of the Matrixxx project (an introduction)
- A Linux live system for you to build yourself – based on shell scripts.
- Primarily for use on USB sticks (or similar).
- The integrated hardware detection allows you to boot your own, customized
  operating system from the USB stick with a large number of x86
  systems (currently focusing on 64-bit systems).
- A system that behaves the same on a wide variety of computers and fits
  in your pocket.
- Only a few script calls are necessary to create my own system -
  and customization is simple.

## What does matrixxx stand for?
For a collection of scripts for generating:

- an initramfs (busybox based) including a custom kernel
- a Debian based system packaged in multiple squashfs files

### Boot medium (structure)
- The boot medium is a USB stick (or similar)
- Extlinux/Syslinux is used as the bootloader
  - Legacy boot and UEFI
- The custom kernel is started by the bootloader, which in turn starts a
  custom initramfs. Controlled by the bootloader configuration file.
- The custom initramfs mounts the read-only operating system images
  as an union mount file system, including a writable layer, and starts
  the operating system init process.

### Kernel-Build:
- Create a customized kernel
  - Contains "aufs" (Advanced Multi Layered Unification Filesystem)
  - Contains drivers for booting from USB sticks (or similar devices)

### Initramfs-Build:
- Create a customized initramfs
  - Contains a customized busybox based on version v1.37.0
  - Contains an init script that
    - is provided with the earliest possible 'hook' (exit point), i.e.,
      as soon as the actual boot medium is mounted
      (makes customizations to the initramfs easier)
    - Enables various cheat codes via kernel parameters (bootloader)
- *Note: The read-only images of the operating system are of the
  "squashfs" type*

### System-Build:
- Create a Debian-based system, packaged in multiple "squashfs" image files
  - Possible software packages: stable, testing, unstable, and experimental
    (configurable)
  - Possible software categories: main, contrib, non-free, and non-free firmware
    (configurable)
- Due to the file size limitation of < 4GB (with vfat), multiple image files
  (layers) can be created, which are then mounted in a union mount file system.
  (This allows for a very large selection of software)

### Build-System:
- With the 'Standard' software selection, a complete Debian-based operating
  system can be assembled in just a few steps (script calls)

#### Links:
- Homepage von [debian.org][debian]
- Homepage von [kernel.org][kernel]
- Homepage von [aufs][]
- Homepage von [busybox][]
- Homepage des [Syslinux Project][]

********************************************************************************

<!-- *********************************************************************** -->
[debian]: https://www.debian.org
[busybox]: https://www.busybox.net/
[kernel]: https://kernel.org/
[aufs]: https://aufs.sourceforge.net/
[Syslinux Project]: https://wiki.syslinux.org

