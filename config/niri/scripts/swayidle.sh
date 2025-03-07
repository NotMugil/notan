#!/bin/sh

swayidle -w timeout 300 'swaylock -f -i ~/.current_wallpaper' timeout 600 'niri msg action power-off-monitors' before-sleep 'swaylock -f -i ~/.current_wallpaper'

