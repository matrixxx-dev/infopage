---
defaults: website
title: blog [matrixxx]
toc: false
lang: de
cut-extension: true
---
<!-- *********************************************************************** -->

********************************************************************************
## Release Notes:
<date>**todo**</date>

<!-- ![](../svg/todo.svg){ alt="[matrixxx] TODO" width="100" } -->
<img src="../svg/todo.svg" alt="[matrixxx] TODO" width="100" />

********************************************************************************
## Hintergründe zur Motivation

<date>**12.12.2024**</date>

Liebe Linux-Freunde,

ich habe vor mein D.I.Y. Linux Live System mit dem Namen „matrixxx“ der
Allgemeinheit zur Verfügung stellen.
(Bitte in den Namen nicht zu viel hinein interpretieren - meine User nenne ich
zu meist „xxx“, wie eine namenlose Unterschrift und matrix ist im weitesten
Sinne die Organisation des Systems in „Layern“ des verwendeten
Overlay-Dateisystem)

Ich war und bin ein seit vielen Jahren begeisterter Nutzer von KNOPPIX.
Dieses System von Prof. Klaus Knopper hat mich zu Linux gebracht.
Dabei habe ich aber schon immer das System an meine Vorstellungen angepasst.
Zunächst noch mit den vorgesehenen Remastering Mitteln und später auch mit
eigenen Shell Skripten und tiefer gehenden Eingriffen. Ich spreche hier von
einigen Jahren in denen sich eine Menge Skripten angesammelt haben.
Das daraus entstandene System ist tatsächlich zu meinem vorrangigen
Arbeitssystem geworden (um einfach mal etwas auszuprobieren ist das System
einfach super).

Knoppix ist an sich ein 32bit System, wobei der der Kernel wahlweise 32 oder
64 bit ist.
Leider ist es so, dass immer mehr Programme nur noch als 64bit Variante
ausgeliefert werden, auch jene die ich schon lange und gerne benütze.

Also, so war der Gedanke, warum Knoppix nicht mit Skripten nachbauen,
ich hatte ja schon einiges (so dachte ich). Davon war Einiges nach meinen
Vorstellungen recht sauber ausgeführt anderes dann aber doch eher
'quick and dirty'. Nach einiges mehr als eineinhalb Jahren kann mein Respekt
für Klaus Knopper kaum größer werden.

Nun habe ich eine Skript-Sammlung zum Erzeugen eines Systems nach meinen
eigenen Bedürfnissen und Vorstellungen. Dies hier zu bemerken ist mir wichtig,
da ich nicht weiß, ob überhaupt jemand außer mir Interesse an einer
solchen Skript-Sammlung hat. Nichts desto trotz werde ich noch Zeit in eine
bessere Strukturierung und in die Tests stecken.

Die drei Skript Pakete sind dann gedacht:

- für die Erzeugung eigener System spezifischer Kernel und dem zugehörigen
  Module Paket in Form eines SquashFS Containers und zusätzlich passender
  aufs-tools (Tools des von mir bevorzugten Overlay-Dateisystem)
- für das Erstellen bootfähiger Medien (USB-Flash Medien oder Festplatten)
  als Live System mit integriertem System spezifischen Kernel und mini „initramfs“
- für die Erzeugung eines auf Debian basierenden „Betriebssystem“ in Form
  mehrerer SquashFS Containern

Das Betriebssystem wird während des primären „init“ Vorganges des "initramfs“
als Overlay-Dateisystem der SquashFS Containern mit beschreibbaren obersten
Layer aufgesetzt.

Einiges was in Knoppix möglich war ist allerdings momentan nicht enthalten
bzw. auch nicht vorgesehenen.

- momentan besteht das Betriebssystem nur aus reinen 32bit bzw. 64bit Versionen
  (die 32bit Variante soll im Weiteren mit beiden Kernel Varianten lauffähig sein)
- die Nutzung von „cloop“ Containern mit den neueren Kernel kann ich zu Zeit
  nicht anbieten
- die Nutzung eines externen Speichermediums für den persistenten Speicher ist
  noch nicht umgesetzt
- das Betriebssystem hat nur die Desktop-Umgebung LXDE integriert
- Compiz ist noch nicht ausreichend getestet, soll aber wieder einfach nutzbar
  werden
- ADRIANE (Audio Desktop Reference Implementation and Networking Environment)
  von Klaus Knopper ist momentan nicht integriert
- die Terminalserver und „Bootfrom“ Funktionalität ist momentan ausgebaut
- eine echte Installation wird nicht vorgesehenen (das geht anders leichter)

Die Skripten, Daten und die zugehörigen Beschreibungen werde ich auf
„github“ zur Verfügung stellen.

So der Plan, mit der Hoffnung, das dies auch für andere von Interesse sein wird.

Mit freundlichen Grüßen

Holger Schwarz

********************************************************************************


