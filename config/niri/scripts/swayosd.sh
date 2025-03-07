#!/bin/bash

# Define paths and commands
osd="swayosd-client"

# Main script logic based on passed arguments
case $1 in
    raise)
        $osd --output-volume raise
        ;;
    lower)
        $osd --output-volume lower
        ;;
    mute)
        $osd --output-volume mute-toggle
        ;;
    micmute)
        $osd --input-volume mute-toggle
        ;;
    Caps_Lock)
        $osd --caps-lock
        ;;
    brightness_up)
        $osd --brightness raise
        ;;
    brightness_down)
        $osd --brightness lower
        ;;
    *)
        echo "Unknown keybind: $1"
        ;;
esac

exit 0
