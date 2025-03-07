#!/bin/bash

# Directory where the .kdl files are located
CONFIG_DIR="$HOME/.config/niri/configs"
THEMES_DIR="$HOME/.config/niri/themes"
OUTPUT_FILE="$HOME/.config/niri/config.kdl"

# Check if a valid theme argument is provided
if [ "$1" != "light" ] && [ "$1" != "dark" ]; then
    echo "Invalid theme specified. Use 'light' or 'dark'."
    exit 1
fi

# Concatenate all .kdl files into config.kdl
cat "$CONFIG_DIR"/*.kdl "$THEMES_DIR/$1.kdl" > "$OUTPUT_FILE"

echo "Configuration files combined into $OUTPUT_FILE"
