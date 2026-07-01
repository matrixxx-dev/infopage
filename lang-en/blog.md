---
defaults: website_en
title: blog [matrixxx]
toc: false
lang: en
cut-extension: true
---
<!-- *********************************************************************** -->

********************************************************************************
## Background information on motivation

<date>**12.12.2024**</date>

Dear Linux friends,

I plan to make my D.I.Y. Linux Live System named "matrixxx" available to the
public.
(Please don't read too much into the name - I usually call my users "xxx",
like an anonymous signature, and matrix is, in the broadest sense, the
organization of the system in "layers" of the used overlay filesystem)

I have been an enthusiastic user of KNOPPIX for many years.
This system by Prof. Klaus Knopper introduced me to Linux.
However, I have always adapted the system to my own ideas.
Initially using the designated remastering tools, and later also using custom
shell scripts and more in-depth interventions. I'm talking about a few years
during which a lot of scripts have accumulated.
The system that emerged from it has actually become my primary work system
(for simply trying something out, the system is just great).

Knoppix is essentially a 32-bit system, although the kernel can be either 32
or 64-bit.
Unfortunately, it is the case that more and more programs are only being
delivered in a 64-bit version, including those that I have been using and
enjoying for a long time.

So, that was the idea, why not recreate Knoppix with scripts, I already had
some (or so I thought). Some of it was executed quite cleanly according to my
ideas, while other parts were rather 'quick and dirty'. After more than a
year and a half, my respect for Klaus Knopper can hardly grow any larger.

Now I have a collection of scripts to create a system according to my own
needs and ideas. It is important to me to note this here, as I do not know
if anyone other than myself is interested in such a script collection.
Nevertheless, I will still invest time in better structuring and testing.

The three script packages are then planned as follows:

- for the creation of custom system-specific kernels and the associated module
  package in the form of a SquashFS container and additionally suitable
  aufs-tools (tools of my preferred overlay filesystem)
- for creating bootable media (USB flash media or hard drives) as a live
  system with an integrated system-specific kernel and mini "initramfs"
- for the creation of a Debian-based "operating system" in the form of multiple
  SquashFS containers

The operating system is set up during the primary "init" process of the
"initramfs" as an overlay filesystem of the SquashFS containers with a
writable top layer.

Some things that were possible in Knoppix are currently not included or planned.

- Currently, the operating system consists only of pure 32-bit or 64-bit
  versions (the 32-bit version is supposed to be compatible with both
  kernel variants)
- the use of "cloop" containers with the newer kernels is not currently
  available
- the use of an external storage medium for persistent storage has not yet
  been implemented
- the operating system only includes the LXDE desktop environment
- Compiz has not yet been sufficiently tested, but it should become easy to
  use again
- ADRIANE (Audio Desktop Reference Implementation and Networking Environment)
  by Klaus Knopper is currently not integrated
- the terminal server and "Bootfrom" functionality are currently removed
- a real installation is not planned (there's an easier way to do this)

The scripts, data, and associated descriptions will be made available on
"github."

So that is the plan - in the hope that this will also be of interest to others.

Best regards

Holger Schwarz
