# matrixxx
- a D.I.Y live system based on shell scripts
- primarily for use on a USB stick (or similar)
- [home page](https://matrixxx.dev/)

## What does matrixxx stand for?
1. an initramfs system for starting various unionfs-based systems
   (busybox-based) with a specially adapted kernel
2. a union mount file operating system based on Debian

### kernel
- is started by ldlinux (part of extlinux/syslinux) and starts the initramfs
  itself
- contains "aufs" (advanced multi layered unification filesystem)
- contains drivers to boot the USB stick (or similar)

### initramfs
- the used busybox version is v1.37.0
- the union mount file system used can be of type "aufs" or "OverlayFS"
  and can be selected via kernel parameter (default:"aufs")
- the read-only images (for union mount) of the operating system are of type
  "squashfs" ("cloop" integration is planned)
- the init script has an exit ("hook") as early as possible to easily try out
  adjustments

### system
- debian based system
  - used suites: stable testing unstable (testing='Trixie')
  - used software categories: main contrib non-free-firmware
