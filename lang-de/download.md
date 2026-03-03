---
defaults: website
title: Download [matrixxx]
toc: false
lang: de
---
<!-- *********************************************************************** -->

********************************************************************************
# Download Möglichkeiten

<!-- ![](../svg/todo.svg){ alt="[matrixxx] TODO" width="100" } -->
<img src="../svg/todo.svg" alt="[matrixxx] TODO" width="100" />

- **git repository:** <https://github.com/matrixxx-dev>

#### Kurzanleitung (ohne Anpassungen)
  - **matrixxx-boot-device-content**:
    - USB-Stick formatieren mit "vfat" bzw. "fat32" oder ext4 formatieren
    - Download als zip (<> Code) und auf dem USB-Stick auspacken
    - Das Skript /boot/scripts/script-bootinstall.sh auf dem USB-Stick ausführen
  - **matrixxx-os-build**: (ToDo: too big! ~20GB Software - in SquashFS ~9GB per arch.)
    - Repository lokal clonen
    - xx-build.sh ausführen (erzeugt jeweils 3 SquashFS Layer für x86 32-bit
      und 64-bit) - ca. 3 Std. Laufzeit mit den aktuellen Einstellungen
    - matrixxx_00/amd64/LAYER* in das Verzeichnis SYSTEM_amd64 des USB-Stick kopieren
    - matrixxx_00/i386/LAYER* in das Verzeichnis SYSTEM_i386 des USB-Stick kopieren
  - **matrixxx-remaster**: (ToDo: fehlende Teile)
    - Repository lokal clonen
    - PROCESS.sh ausführen (erzeugt 4 SquashFS Layer, welche das OS konfigurieren)
    - LAYER15, LAYER17, LAYER19 in das Verzeichnis SYSTEM des USB-Stick kopieren
    - LAYER64 in das Verzeichnis SYSTEM_amd64 des USB-Stick kopieren
    - LAYER32 in das Verzeichnis SYSTEM_i386 des USB-Stick kopieren
- der USB-Stick sollte nun 'matrixxx live system' enthalten und bootfähig sein

(GNU General Public License Version 2, June 1991)

********************************************************************************
