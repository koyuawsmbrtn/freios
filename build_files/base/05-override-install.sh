#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -eoux pipefail

# Patched shells and Switcheroo Patch
if [[ "$(rpm -E %fedora)" -eq "40" ]]; then
    dnf5 -y copr enable sentry/switcheroo-control_discrete
    dnf5 -y copr disable sentry/switcheroo-control_discrete
    dnf5 versionlock add gnome-shell
    dnf5 -y swap \
        --repo=copr:copr.fedorainfracloud.org:sentry:switcheroo-control_discrete \
        switcheroo-control switcheroo-control
    dnf5 versionlock add switcheroo-control
elif [[ "$(rpm -E %fedora)" -eq "41" ]]; then
    # Enable Terra repo (Extras does not exist on F40)
    # shellcheck disable=SC2016
    dnf5 -y swap \
        --repo="terra*" \
        gnome-shell gnome-shell
    dnf5 versionlock add gnome-shell
    dnf5 -y swap \
        --repo="terra*" \
        switcheroo-control switcheroo-control
    dnf5 versionlock add switcheroo-control
fi

# Starship Shell Prompt
curl --retry 3 -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
# shellcheck disable=SC2016
echo 'eval "$(starship init bash)"' >>/etc/bashrc

# Automatic wallpaper changing by month
HARDCODED_RPM_MONTH="12"
# Use old freios background package for GTS
# FIXME: remove this once GTS updates to fc41
# if [ "$(rpm --eval "%{dist}")" == ".fc40" ]; then
#     dnf5 install -y "freios-backgrounds-0.1.7-1$(rpm -E "%{dist}")"
#     # Pin to february wallpaper instead
#     sed -i "/picture-uri/ s/${HARDCODED_RPM_MONTH}/02/" "/usr/share/glib-2.0/schemas/zz0-freios-modifications.gschema.override"
# else
sed -i "/picture-uri/ s/${HARDCODED_RPM_MONTH}/$(date +%m)/" "/usr/share/glib-2.0/schemas/zz0-freios-modifications.gschema.override"
# fi
glib-compile-schemas /usr/share/glib-2.0/schemas

# Automatic wallpaper changing by month
HARDCODED_RPM_MONTH="12"
sed -i "/picture-uri/ s/${HARDCODED_RPM_MONTH}/$(date +%m)/" "/usr/share/glib-2.0/schemas/zz0-freios-modifications.gschema.override"
glib-compile-schemas /usr/share/glib-2.0/schemas

# Consolidate Just Files

find /tmp/just -iname '*.just' -exec printf "\n\n" \; -exec cat {} \; >>/usr/share/ublue-os/just/60-custom.just

# Register Fonts
fc-cache -f /usr/share/fonts/ubuntu
fc-cache -f /usr/share/fonts/inter

echo "::endgroup::"
