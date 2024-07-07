#!/bin/bash

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/oppy-os/setup"
COMPLETED_FILE="$STATE_DIR/completed"

# Your original script contents go here
echo "Running first login tasks for Oppy OS..."
# Add your custom commands here

# After all tasks are done, create the completed file
mkdir -p "$STATE_DIR"
touch "$COMPLETED_FILE"
