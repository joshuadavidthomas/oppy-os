#!/usr/bin/env bash

set -ouex pipefail

sed -i '/X-KDE-Shortcuts=Ctrl+Alt+T/d' /usr/share/applications/org.gnome.Ptyxis.desktop
sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/org.gnome.Ptyxis.desktop
rm -f /usr/share/kglobalaccel/org.gnome.Ptyxis.desktop
