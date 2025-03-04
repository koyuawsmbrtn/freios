#!/usr/bin/bash

wget "https://extensions.gnome.org/extension-data/logomenuaryan_k.v36.shell-extension.zip" -O /usr/share/freios/logomenu.zip
rm -f /usr/share/gnome-shell/extensions/logomenu@aryan_k
mkdir -p /usr/share/gnome-shell/extensions/logomenu@aryan_k
unzip /usr/share/freios/logomenu.zip -d /usr/share/gnome-shell/extensions/logomenu@aryan_k
rm -f /usr/share/freios/logomenu.zip