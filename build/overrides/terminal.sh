#!/usr/bin/env bash

set -ouex pipefail

sed -i 's/^TerminalApplication=.*/TerminalApplication=wezterm/' /usr/share/kde-settings/kde-profile/default/xdg/kdeglobals
sed -i 's/^TerminalService=.*/TerminalService=org.wezfurlong.wezterm.desktop/' /usr/share/kde-settings/kde-profile/default/xdg/kdeglobals

sed -i '/X-KDE-Shortcuts=Ctrl+Alt+T/d' /usr/share/applications/org.gnome.Ptyxis.desktop
sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/org.gnome.Ptyxis.desktop
rm -f /usr/share/kglobalaccel/org.gnome.Ptyxis.desktop
