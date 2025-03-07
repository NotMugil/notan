#!/bin/bash

# Function to determine system color scheme
get_color_scheme() {
    # Example for GNOME (using gsettings)
    # Adjust this according to your desktop environment or window manager
    if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'dark'; then
        echo "dark"
    else
        echo "light"
    fi
}

# Determine color scheme
COLOR_SCHEME=$(get_color_scheme)

# Set wallpapers directory based on color scheme
if [ "$COLOR_SCHEME" = "dark" ]; then
    WALLPAPER_DIR="$HOME/.wallpapers/dark"
else
    WALLPAPER_DIR="$HOME/.wallpapers/light"
fi


# List wallpapers in the directory and extract filenames
wallpapers=()
while IFS= read -r -d $'\0' file; do
    wallpapers+=("$(basename "$file")")
done < <(find "$WALLPAPER_DIR" -type f -print0)

# Function to display menu using wofi
select_wallpaper() {
    selected=$(printf '%s\n' "${wallpapers[@]}" | wofi --dmenu --insensitive --prompt="Select wallpaper:" --style="$HOME/.config/wofi/wallpaper.css")

    # If user cancels, exit without changing wallpaper
    if [ -z "$selected" ]; then
        exit 0
    fi

    # Find full path of selected wallpaper
    selected_path=$(find "$WALLPAPER_DIR" -type f -name "$selected")

    # Change wallpaper using the selected file
    swww img "$selected_path" --transition-type any && notify-send "Wallpaper Changed" -i "$selected_path" --app-name=Wallpaper

    # Update the .current_wallpaper symbolic link
    ln -sf "$selected_path" "$HOME/.current_wallpaper"
}

# Main execution
select_wallpaper
