#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -xeou pipefail

wget https://extensions.gnome.org/extension-data/no-overviewfthx.v18.shell-extension.zip -O /usr/share/ublue-os/no-overviewfthx.zip
mkdir -p /usr/share/gnome-shell/extensions/no-overview@fthx
unzip /usr/share/ublue-os/no-overviewfthx.zip -d /usr/share/gnome-shell/extensions/no-overview@fthx
rm -f /usr/share/ublue-os/no-overviewfthx.zip
chown -R root:root /usr/share/gnome-shell/extensions/no-overview@fthx
chmod -R 755 /usr/share/gnome-shell/extensions/no-overview@fthx

wget https://extensions.gnome.org/extension-data/windowIsReady_Removernunofarrucagmail.com.v24.shell-extension.zip -O /usr/share/ublue-os/windowIsReady_Remover.zip
mkdir -p /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com
unzip /usr/share/ublue-os/windowIsReady_Remover.zip -d /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com
rm -f /usr/share/ublue-os/windowIsReady_Remover.zip
chown -R root:root /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com
chmod -R 755 /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com

wget https://extensions.gnome.org/extension-data/app-hiderlynith.dev.v22.shell-extension.zip -O /usr/share/ublue-os/app-hiderlynith.zip
mkdir -p /usr/share/gnome-shell/extensions/app-hider@lynith.dev
unzip /usr/share/ublue-os/app-hiderlynith.zip -d /usr/share/gnome-shell/extensions/app-hider@lynith.dev
rm -f /usr/share/ublue-os/app-hiderlynith.zip
glib-compile-schemas /usr/share/gnome-shell/extensions/app-hider@lynith.dev/schemas/
chown -R root:root /usr/share/gnome-shell/extensions/app-hider@lynith.dev
chmod -R 755 /usr/share/gnome-shell/extensions/app-hider@lynith.dev

echo "::endgroup::"