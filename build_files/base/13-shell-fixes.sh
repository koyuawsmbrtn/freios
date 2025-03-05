#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -xeou pipefail

wget https://extensions.gnome.org/extension-data/no-overviewfthx.v18.shell-extension.zip -O /usr/share/ublue-os/no-overviewfthx.zip
mkdir -p /usr/share/gnome-shell/extensions/no-overview@fthx
unzip /usr/share/ublue-os/no-overviewfthx.zip -d /usr/share/gnome-shell/extensions/no-overview@fthx
rm -f /usr/share/ublue-os/no-overviewfthx.zip
chmown -R root:root /usr/share/gnome-shell/extensions/no-overview@fthx
chmod -R 755 /usr/share/gnome-shell/extensions/no-overview@fthx

wget https://extensions.gnome.org/extension-data/windowIsReady_Removernunofarrucagmail.com.v24.shell-extension.zip -O /usr/share/ublue-os/windowIsReady_Remover.zip
mkdir -p /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com
unzip /usr/share/ublue-os/windowIsReady_Remover.zip -d /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com
rm -f /usr/share/ublue-os/windowIsReady_Remover.zip
chmown -R root:root /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com
chmod -R 755 /usr/share/gnome-shell/extensions/windowIsReady_Remover@nunofarruca@gmail.com

echo "::endgroup::"