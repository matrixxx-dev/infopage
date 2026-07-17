---
defaults: website-index
title: matrixxx - ein Linux Live System
toc: false
lang: de
cut-extension: true
---
<!-- *********************************************************************** -->

********************************************************************************
# "matrixxx" - ein D.I.Y Linux Live System
**matrixxx** ist zunächst eine Sammlung von bash Skripten, mit deren Hilfe man
sich sein eigenes Linux Live System erzeugen kann. (Zumindest erzeuge ich damit
mein eigenes System - und diese Möglichkeit möchte ich in diesem Zuge der
Allgemeinheit zur Verfügung stellen).

Hiermit lassen sich:

- ein für diese Zwecke angepassten modernen Kernel erzeugen
- ein einfaches von USB Flash Laufwerken startbares Boot System aufbauen
- und ein auf Debian basierendes modulares Betriebssystem zusammenstellen

Zusammen gebaut entsteht daraus ein System, welches
direkt von einem USB Flash Laufwerk produktiv genutzt werden kann, ohne dieses
zuvor installiert haben zu müssen. Ein System also für die Hosentasche, dass
auf verschiedenster x86-Hardware in gleicher gewohnter Art und Weise startet,
nutzbar und bedienbar ist.

- [Systembeschreibung](lang-de/introduction.html) (eine Einführung)
- [Blog](lang-de/blog.html) (Stand der Dinge)
- [Download](lang-de/download.html)

********************************************************************************
## Das Basissystem
Um den Einstieg zu erleichtern, stelle ich in den zugehörigen Repositories ein
vorkonfiguriertes Basissystem bereit.
Gebrauchsfertige Systemkomponenten sind im „Releases“-Bereich der
Skript-Repositories verfügbar.

Für die Einrichtung des Basissystems empfehle ich folgende Schritte:

- Besorgen Sie sich einen USB-Stick mit einer Kapazität von mindestens 32 GB
  (so haben Sie ausreichend Platz zum Experimentieren). **Hinweis:**
  Das reine Basissystem hat lediglich eine Gesamtgröße von 3,7 GB
- Lesen Sie die [Anleitung](https://github.com/matrixxx-dev/matrixxx-boot-device-content/blob/main/readme-HowTo.md)
  und befolgen Sie die dortigen Anweisungen.
  - Dieses Dokument enthält Anleitungen sowohl auf Englisch als auch auf Deutsch.
  - Über die Links in der Tabelle können Sie die Systemkomponenten direkt
  herunterladen.

Sobald das Basissystem gestartet ist, ermöglicht die darin enthaltene Software
die Nutzung der Skriptsammlung ohne weitere Anpassungen.
Alle von Ihnen erstellten Systemkomponenten können anschließend wieder in
das Basissystem integriert werden und Sie haben Ihr eigenes System.

#### Konfigurationshinweise (matrixxx-remaster)
- das System ist so konzipiert, dass es **ohne systemd** funktioniert
- die verwendete **/etc/inittab** folgt den **busybox**-Konventionen und
  startet die notwendigen Konfigurationsskripte
- die grafische Benutzeroberfläche basiert auf dem **X Window System**
- wenig Systemresourcen zu benötigen ist und bleibt ein Ziel

Viel Spaß beim Ausprobieren!


********************************************************************************
