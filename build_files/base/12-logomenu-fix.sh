#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -xeou pipefail

wget "https://extensions.gnome.org/extension-data/logomenuaryan_k.v36.shell-extension.zip" -O /usr/share/ublue-os/logomenu.zip
rm -f /usr/share/gnome-shell/extensions/logomenu@aryan_k
mkdir -p /usr/share/gnome-shell/extensions/logomenu@aryan_k
unzip /usr/share/ublue-os/logomenu.zip -d /usr/share/gnome-shell/extensions/logomenu@aryan_k
rm -f /usr/share/ublue-os/logomenu.zip
glib-compile-schemas /usr/share/gnome-shell/extensions/logomenu@aryan_k/schemas/
chmod -R 755 /usr/share/gnome-shell/extensions/logomenu@aryan_k
chown -R root:root /usr/share/gnome-shell/extensions/logomenu@aryan_k

echo "::endgroup::"