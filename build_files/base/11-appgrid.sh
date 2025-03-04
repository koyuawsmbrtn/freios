#!/usr/bin/bash

wget https://github.com/stuarthayhurst/alphabetical-grid-extension/releases/latest/download/AlphabeticalAppGrid@stuarthayhurst.shell-extension.zip -O /usr/share/freios/appgrid.zip
mkdir -p /usr/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst
unzip /usr/share/freios/appgrid.zip -d /usr/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst
rm -f /usr/share/freios/appgrid.zip
glib-compile-schemas /usr/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst/schemas/