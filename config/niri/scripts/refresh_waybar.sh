#!/bin/bash

# Function to check if Waybar is running
waybar_is_running() {
    pgrep -x waybar > /dev/null
}

# Check if Waybar is running
if waybar_is_running; then
    # Waybar is running, so kill and restart it
    echo "Waybar is running. Restarting..."
    killall waybar
    waybar &
else
    # Waybar is not running, start it
    echo "Waybar is not running. Starting..."
    waybar &
fi
