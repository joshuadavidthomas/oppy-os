#!/usr/bin/env bash

set -ouex pipefail

file="/usr/share/kde-settings/kde-profile/default/xdg/kdeglobals"
browser="vivaldi-stable.desktop"

if sed -n '/\[General\]/,/^\[/p' "$file" | grep -q "^BrowserApplication="; then
  echo "BrowserApplication line exists. Updating..."
  sed -i '/\[General\]/,/^\[/ s/^BrowserApplication=.*/BrowserApplication='"$browser"'/' "$file"
else
  echo "BrowserApplication line doesn't exist. Adding..."
  sed -i '/\[General\]/a BrowserApplication='"$browser"'' "$file"
fi
