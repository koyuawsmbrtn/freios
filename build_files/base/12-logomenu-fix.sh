#!/usr/bin/bash

wget "https://extensions.gnome.org/extension-data/logomenuaryan_k.v36.shell-extension.zip" -O /usr/share/ublue-os/logomenu.zip
rm -f /usr/share/gnome-shell/extensions/logomenu@aryan_k
mkdir -p /usr/share/gnome-shell/extensions/logomenu@aryan_k
unzip /usr/share/ublue-os/logomenu.zip -d /usr/share/gnome-shell/extensions/logomenu@aryan_k
rm -f /usr/share/ublue-os/logomenu.zip
glib-compile-schemas /usr/share/gnome-shell/extensions/logomenu@aryan_k/schemas/