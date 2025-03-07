#!/bin/bash

# Define constants
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
NIRI_DIR="$HOME/.config/niri"
LIGHT_THEME="Orchis-Light-Compact"
DARK_THEME="catppuccin-mocha-maroon-standard+default"
LIGHT_COLOR_SCHEME="prefer-light"
DARK_COLOR_SCHEME="prefer-dark"
LIGHT_WALLPAPER="$HOME/.wallpapers/light/fullerene.jpg"
DARK_WALLPAPER="$HOME/.wallpapers/dark/sevenEleven.jpg"
LIGHT_KITTY_THEME="Catppuccin-Latte"
DARK_KITTY_THEME="Catppuccin-Mocha"

# Function to apply GTK theme and color scheme
apply_gtk_theme() {
    local theme="$1"
    local color_scheme="$2"

    gsettings set org.gnome.desktop.interface gtk-theme "$theme"
    gsettings set org.gnome.desktop.interface color-scheme "$color_scheme"
}

# Function to switch Waybar theme
switch_waybar_theme() {
    local theme="$1"

    ln -sf "$WAYBAR_CONFIG_DIR/themes/$theme" "$WAYBAR_CONFIG_DIR/style.css"
    ~/.scripts/refresh_waybar.sh
}

# Function to apply wallpaper
apply_wallpaper() {
    local wallpaper="$1"

    swww img "$wallpaper" --transition-type any
}

# Function to switch theme
switch_theme() {
    local gtk_theme="$1"
    local color_scheme="$2"
    local waybar_theme="$3"
    local wallpaper="$4"
    local kitty_theme="$5"

    apply_gtk_theme "$gtk_theme" "$color_scheme"
    switch_waybar_theme "$waybar_theme"
    switch_niri_theme "$niri_theme"
    apply_wallpaper "$wallpaper"
    kitten themes --reload-in=all "$kitty_theme"
}

# Main logic
current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$current_theme" == "'$DARK_THEME'" ]; then
    switch_theme "$LIGHT_THEME" "$LIGHT_COLOR_SCHEME" "light" "$LIGHT_WALLPAPER" "$LIGHT_KITTY_THEME" "light"
    ~/.scripts/combine_configs.sh light
else
    switch_theme "$DARK_THEME" "$DARK_COLOR_SCHEME" "dark" "$DARK_WALLPAPER" "$DARK_KITTY_THEME" "dark"
    ~/.scripts/combine_configs.sh dark
fi
