---
defaults: website
title: Einführung [matrixxx]
toc: false
lang: de
---

<!-- *********************************************************************** -->
<!-- ![](../svg/todo.svg){ alt="[matrixxx] TODO" width="100" } -->
<img src="../svg/todo.svg" alt="[matrixxx] TODO" width="100" />

# Systembeschreibung des Matrixxx-Projekt (eine Einführung)
- Ein Linux Live-System zum Selberbauen - basierend auf Shell-Skripten.
- In erster Linie für die Nutzung auf USB-Sticks (oder Ähnlichem).
- Wobei die integrierte Hardwareerkennung ermöglicht das eigene, für sich
  selbst zugeschnittene Betriebssystem vom USB-Stick mit einer großen Anzahl von
  x86 Systemen zu starten
  (wobei momentan der Fokus auf 64-bit Systemen liegt).
- Also ein System das sich auf verschiedensten Rechnern gleich verhält
  und in die Hosentasche passt.
- Für die Erzeugung meines eigenen Systems sind nur wenige Skriptaufrufe
  notwendig - und eine Anpassung ist auch nicht sonderlich aufwendig.

## Wofür steht matrixxx?
Eine Sammlung von Skripten zur Generierung von:

- einem Initramfs (Busybox basiert) inklusive einem benutzerdefinierten Kernel
- einem auf Debian basierten System, verpackt in mehrere squashfs - Dateien

### Verwendetes Bootmedium (Struktur)
- Das Bootmedium ist ein USB-Stick (o. Ä.) oder eine Festplatte
- Extlinux/Syslinux wird als Bootloader verwendet
  - Legacy-Boot und UEFI
- Der benutzerdefinierte Kernel wird vom Bootloader gestartet, der wiederum
  ein benutzerdefiniertes Initramfs startet. Gesteuert durch die
  Bootloader-Konfigurationsdatei.
- Das benutzerdefinierte Initramfs mountet die schreibgeschützten
  Betriebssystem-Images als 'Union-Mount-Dateisystem' inklusive einem
  beschreibbaren Layers und startet den Betriebssystem-Init-Prozess.

### Kernel-Build:
- Erstellen eines angepassten Kernels
  - Enthält "aufs" (Advanced Multi Layered Unification Filesystem)
  - Enthält Treiber zum Booten des USB-Sticks (oder ähnlicher Geräte)

### Initramfs-Build:
- Erstellen eines angepassten Initramfs
  - Enthält eine angepasste Busybox basierend auf Version v1.37.0
  - Enthält ein Init-Skript, das
    - mit einem frühest möglichen 'Hook' (Aussprungspunkt) versehen ist,
      also sobald das eigentliche Boot Medium gemountet ist
      (lässt Anpassungen am Initramfs einfacher umsetzen)
    - Ermöglicht verschiedene CHEATCODES über Kernel-Parameter (Bootloader)
- *Hinweis: Die schreibgeschützten Images des Betriebssystems sind vom Typ
  "squashfs"*

### System-Build:
- Erstellen eines Debian-basierten Systems, verpackt in mehrere
  Image-Dateien vom Typ "squashfs"
  - Mögliche Softwarepakete aus stable, testing, unstable, experimental
    (konfigurierbar)
  - Mögliche Softwarekategorien: main, contrib, non-free, non-free-firmware
    (konfigurierbar)
- Aufgrund der Limitierung der Dateigröße auf < 4GB (bei vfat) können mehrere
  Image Dateien (Layer) erzeugt werden, welche bei der Erstellung in ein
  'Union-Mount-Dateisystem' eingebunden sind. (Dadurch ist eine sehr große
  Softwareauswahl möglich)

### Build-System:
- Mit der 'Standard' - Softwareauswahl lässt sich in nur wenigen Schritten
  (Skript-Aufrufen) ein komplettes Debian basiertes Betriebssystem
  zusammenstellen

#### Links:
- Homepage von [debian.org][debian]
- Homepage von [kernel.org][kernel]
- Homepage von [aufs][]
- Homepage von [busybox][]
- Homepage des [Syslinux Project][]

<!-- *********************************************************************** -->
[debian]: https://www.debian.org
[busybox]: https://www.busybox.net/
[kernel]: https://kernel.org/
[aufs]: https://aufs.sourceforge.net/
[Syslinux Project]: https://wiki.syslinux.org

