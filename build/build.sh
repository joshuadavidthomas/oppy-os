#!/usr/bin/env bash

set -ouex pipefail

execute_scripts_in_dir() {
  local dir="$1"
  echo "Executing scripts in $dir"
  for script in "$dir"/*.sh; do
    if [ -f "$script" ]; then
      echo "Executing $script"
      bash "$script"
    fi
  done
}

execute_scripts_in_dir "/tmp/install"
execute_scripts_in_dir "/tmp/overrides"
