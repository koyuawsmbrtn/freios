#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -xeou pipefail

wget https://extensions.gnome.org/extension-data/smile-extensionmijorus.it.v10.shell-extension.zip -O /usr/share/ublue-os/smile-extension.zip
mkdir -p /usr/share/gnome-shell/extensions/smile-extension@mijorus.it
unzip /usr/share/ublue-os/smile-extension.zip -d /usr/share/gnome-shell/extensions/smile-extension@mijorus.it
rm -f /usr/share/ublue-os/smile-extension.zip
chown -R root:root /usr/share/gnome-shell/extensions/smile-extension@mijorus.it
chmod -R 755 /usr/share/gnome-shell/extensions/smile-extension@mijorus.it

echo "::endgroup::"