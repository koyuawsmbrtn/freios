#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Remove desktop entries
if [[ -f /usr/share/applications/gnome-system-monitor.desktop ]]; then
    sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nHidden=true@g' /usr/share/applications/gnome-system-monitor.desktop
fi
if [[ -f /usr/share/applications/org.gnome.SystemMonitor.desktop ]]; then
    sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nHidden=true@g' /usr/share/applications/org.gnome.SystemMonitor.desktop
fi

# Add Mutter experimental-features
MUTTER_EXP_FEATS="'scale-monitor-framebuffer', 'xwayland-native-scaling'"
if [[ "${IMAGE_NAME}" =~ nvidia ]]; then
    MUTTER_EXP_FEATS="'kms-modifiers', ${MUTTER_EXP_FEATS}"
fi
tee /usr/share/glib-2.0/schemas/zz1-freios-modifications-mutter-exp-feats.gschema.override << EOF
[org.gnome.mutter]
experimental-features=[${MUTTER_EXP_FEATS}]
EOF

# GNOME Terminal is replaced with Ptyxis in F41+
# Make schema valid on GNOME <47 which do not contain the accent-color key or xwayland-native-scaling mutter feature
if [[ "${FEDORA_MAJOR_VERSION}" -lt "41" ]]; then
    sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/org.gnome.Terminal.desktop
    sed -i 's@accent-color="slate"@@g' /usr/share/glib-2.0/schemas/zz0-freios-modifications.gschema.override
    sed -i 's@'", "\''xwayland-native-scaling'\''@@g' /usr/share/glib-2.0/schemas/zz1-freios-modifications-mutter-exp-feats.gschema.override
fi

# Create symlinks from old to new wallpaper names for backwards compatibility
ln -s "/usr/share/backgrounds/xe_clouds.jxl" "/usr/share/backgrounds/xe_clouds.jpeg"
ln -s "/usr/share/backgrounds/xe_foothills.jxl" "/usr/share/backgrounds/xe_foothills.jpeg"
ln -s "/usr/share/backgrounds/xe_space_needle.jxl" "/usr/share/backgrounds/xe_space_needle.jpeg"
ln -s "/usr/share/backgrounds/xe_sunset.jxl" "/usr/share/backgrounds/xe_sunset.jpeg"
ln -s "/usr/share/backgrounds/xe_koenigssee.jxl" "/usr/share/backgrounds/xe_koenigssee.jpeg"

# Test freios gschema override for errors. If there are no errors, proceed with compiling freios gschema, which includes setting overrides.
mkdir -p /tmp/freios-schema-test
find /usr/share/glib-2.0/schemas/ -type f ! -name "*.gschema.override" -exec cp {} /tmp/freios-schema-test/ \;
cp /usr/share/glib-2.0/schemas/zz0-freios-modifications.gschema.override /tmp/freios-schema-test/
cp /usr/share/glib-2.0/schemas/zz1-freios-modifications-mutter-exp-feats.gschema.override /tmp/freios-schema-test/
echo "Running error test for freios gschema override. Aborting if failed."
# We should ideally refactor this to handle multiple GNOME version schemas better
glib-compile-schemas --strict /tmp/freios-schema-test
echo "Compiling gschema to include freios setting overrides"
glib-compile-schemas /usr/share/glib-2.0/schemas &>/dev/null

# Watermark for Plymouth
cp /usr/share/plymouth/themes/spinner/{silverblue-,}watermark.png

echo "::endgroup::"
