#!/bin/bash

# Define the paths to your light and dark GTK themes
waybar_config_dir="$HOME/.config/waybar"
light_theme="Orchis-Light-Compact"
dark_theme="catppuccin-mocha-maroon-standard+default"
niri_dir="$HOME/.config/niri"

# Function to check and apply the theme
apply_theme() {
    current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
    if [ "$current_theme" == "'$1'" ]; then
        echo "Theme is already set to $1"
    else
        echo "Changing theme to $1"
        gsettings set org.gnome.desktop.interface gtk-theme "$1"
    fi

    if [ "$1" == "'$light_theme'" ]; then
        echo "Setting color scheme to prefer-light"
        gsettings set org.gnome.desktop.interface gtk-theme 'prefer-light'
    elif [ "$1" == "'$dark_theme'" ]; then
        echo "Setting color scheme to prefer-dark"
        gsettings set org.gnome.desktop.interface gtk-theme 'prefer-dark'
    fi
}

# Toggle logic
current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$current_theme" == "'$dark_theme'" ]; then
    apply_theme "$light_theme"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    kitten themes --reload-in=all Catppuccin-Latte
    ln -sf "$waybar_config_dir/themes/light.css" "$waybar_config_dir/style.css"
    ~/.scripts/refresh_waybar.sh
    ln -sf "$niri_dir/themes/light.kdl" "$niri_dir/config.kdl"
    swww img ~/.wallpapers/light/fullerene.jpg --transition-type outer
else
    apply_theme "$dark_theme"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    kitten themes --reload-in=all Catppuccin-Mocha
    ln -sf "$waybar_config_dir/themes/dark.css" "$waybar_config_dir/style.css"
    ~/.scripts/refresh_waybar.sh
    ln -sf "$niri_dir/themes/dark.kdl" "$niri_dir/config.kdl"
    swww img ~/.wallpapers/dark/sevenEleven.jpg --transition-type outer
fi

