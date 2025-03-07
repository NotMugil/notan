# Details 

## Features

## Information
- **Operating System** • [Arch Linux](https://archlinux.org)
- **Desktop Environment** • [Niri](https://github.com/YaLTeR/niri)
- **Terminal** • [kitty](https://github.com/kovidgoyal/kitty)
- **Shell** • zsh
- **Aur Helper** • [yay](https://github.com/Jguer/yay)
- **Panel** • [waybar](https://github.com/Alexays/Waybar)
- **Launcher** • [anyrun](https://github.com/anyrun-org/anyrun)
- **File Manager** • [thunar](https://wiki.archlinux.org/title/thunar)/[yazi](https://github.com/sxyazi/yazi)
- **Notification Daemon** • [swaync](https://github.com/ErikReider/SwayNotificationCenter)
- **Wallpaper Daemon** • [swww](https://github.com/LGFae/swww)
- **Colorscheme** • [Tokyo Night Theme](https://github.com/catppuccin/catppuccin)

# Usage
  > [!NOTE]
  > Assuming that your AUR helper is [yay.](https://github.com/Jguer/yay)
  > To install yay on your arch based system, follow the instructions mentioned [here.](https://github.com/Jguer/yay?tab=readme-ov-file#installation) 
## 📦 Required dependencies

Install these dependencies manually (Arch) 
```shell
pacman -Sy niri wofi kitty wireplumber yazi zathura zathura-pdf-mupdf cava wl-clipboard \
    waybar swayidle swaylock swaync qt5-wayland qt6-wayland playerctl mpv nm-connection-editor \
    rofi-wayland grim slurp thunar pipewire pipewire-alsa pipewire-audio nushell  \
    pipewire-jack pipewire-pulse nwg-look noto-fonts-cjk noto-fonts-emoji \
    noto-fonts networkmanager gtk-engine-murrine blueberry bluez bluez-utils 
```
```shell
yay -S anyrun-git wlogout swaylock-effects swayosd-git swww amberol sway-audio-idle-inhibit-git catppuccin-gtk-theme-mocha orchis-theme
```

## 🧙‍♂️  Setup Config
  > [!WARNING]
  > This method requires you to remove your previous configurations. Make sure to backup your previous configs if needed.
### Default Method

Clone the repository and Copy all files from the repo to your config folder.
```bash
git clone --depth=1 https://github.com/NotMugil/niri-dots.git
cd niri-dots
cp -r .config/* ~/.config/
mkdir -p ~/.scripts
cp -r .scripts/* ~/.scripts/

# This step can be skipped if you are not using zsh shell
cp -r .zshenv ~/
```

All the commands listed in a single line to copy easily.
```
git clone --depth=1 https://github.com/NotMugil/niri-dots.git && cd niri-dots && cp -r .config/* ~/.config/ && mkdir -p ~/.scripts && cp -r .scripts/* ~/.scripts/
```

### Symlink Method
```bash
cd ~
git clone --depth=1 https://github.com/NotMugil/niri-dots.git
```
```
ln -sf ~/niri-dots/.config/anyrun/ ~/.config/ && ln -sf ~/niri-dots/.config/gtk-3.0/ ~/.config/ && ln -sf ~/niri-dots/.config/kitty/ ~/.config/ && ln -sf ~/niri-dots/.config/niri/ ~/.config/ && ln -sf ~/niri-dots/.config/rofi/ ~/.config/ && ln -sf ~/niri-dots/.config/swaylock/ ~/.config/ && ln -sf ~/niri-dots/.config/swaync/ ~/.config/ && ln -sf ~/niri-dots/.config/waybar/ ~/.config/ && ln -sf ~/niri-dots/.config/wofi/ ~/.config/ && ln -sf ~/niri-dots/.config/zsh/ ~/.config/ && ln -sf ~/niri-dots/.scripts/ ~/ && ln -sf ~/niri-dots/.zshenv ~/
```

## ✨ Theming Other Applications

<details>
<summary>
instructions 
</summary>
  
### Spotify (Spicetify)
Install spicetify. (AUR: `spicetify-cli`) 
Copy `niri-dots/.themes/spicetify/text` to `~/.config/spicetify/Themes/` (or wherever your spicetify themes are stored)
Then:
```bash
spicetify config current_theme Dribbblish
spicetify config color_scheme catppuccin-latte
spicetify apply
```

### Visual Studio Code
Install [Tokyo Night](https://vscodethemes.com/e/enkia.tokyo-night/tokyo-night) theme from `enkia` 

### Discord (Better Discord)
install from AUR: `betterdiscordctl`

Copy `niri-dots/.themes/tokyo-night.theme.css` to `~/snap/discord/145/.config/BetterDiscord/`

### GTK Theme
  > Install `nwg-look` to manage gtk-theme, font and icon themes.

```shell
yay -S tokyonight-gtk-theme-git
```

Otherwise: 
Edit the following files:
- `~/.config/gtk-3.0/settings.ini`
- `~/.gtkrc-2.0`
to:
```conf
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name = Tokyonight-Dark
```

and you might have to run: 
```bash
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

</details>

---

# Progress
## 💻 Development

### Known Issues
- [ ] some issue #1
- [ ] some issue #2

### Tasks
- [ ] Prepare Pull_Request_Template.md
- [ ] Prepare Contrubuting.md

# ⌨️ Keybinds

> [!NOTE]
> All keybinds can be found in the `~/.config/niri/config.kdl` in binds.

| Keybind                          | Functionality                                                                   |
|----------------------------------|---------------------------------------------------------------------------------|
| <kbd>Mod+RETURN</kbd>            | Spawns the terminal emulator `kitty`.                                           |
| <kbd>Mod+D</kbd>                 | Spawns an application launcher `anyrun`.                                        |
| <kbd>Mod+E</kbd>                 | Spawns the file manager `thunar`.                                               |
| <kbd>Super+Alt+L</kbd>           | Spawns the screen locker `swaylock`.                                            |
| <kbd>Mod+Q</kbd>                 | Closes the focused window.                                                      |
| <kbd>Mod+Left</kbd>              | Focuses on the column to the left.                                              |
| <kbd>Mod+Right</kbd>             | Focuses on the column to the right.                                             |
| <kbd>Mod+Ctrl+Left</kbd>         | Moves the column to the left.                                                   |
| <kbd>Mod+Ctrl+Right</kbd>        | Moves the column to the right.                                                  |
| <kbd>Mod+Home</kbd>              | Focuses on the first column.                                                    |
| <kbd>Mod+End</kbd>               | Focuses on the last column.                                                     |
| <kbd>Mod+Shift+Left</kbd>        | Focuses on the monitor to the left.                                             |
| <kbd>Mod+Shift+Right</kbd>       | Focuses on the monitor to the right.                                            |
| <kbd>Mod+Page_Down</kbd>         | Focuses on the workspace below.                                                 |
| <kbd>Mod+Page_Up</kbd>           | Focuses on the workspace above.                                                 |
| <kbd>Mod+1</kbd> - <kbd>Mod+9</kbd> | Focuses on specific workspace.                                               |
| <kbd>Mod+Ctrl+1</kbd> - <kbd>Mod+Ctrl+9</kbd> | Moves a column to specific workspace.                              |
| <kbd>Mod+Comma</kbd>             | Consumes a window into the column.                                              |
| <kbd>Mod+Period</kbd>            | Expels a window from the column.                                                |
| <kbd>Mod+R</kbd>                 | Switches to the next column width preset.                                       |
| <kbd>Mod+F</kbd>                 | Maximizes the current column.                                                   |
| <kbd>Mod+C</kbd>                 | Centers the current column.                                                     |
| <kbd>Mod+Minus</kbd>             | Decreases column width by 10%.                                                  |
| <kbd>Mod+Equal</kbd>             | Increases column width by 10%.                                                  |
| <kbd>Print</kbd>                 | Takes a screenshot of the entire screen.                                        |
| <kbd>Ctrl+Print</kbd>            | Takes a screenshot of the current screen.                                       |
| <kbd>Alt+Print</kbd>             | Takes a screenshot of the current window.                                       |
| <kbd>Mod+Shift+E</kbd>           | Quits the window manager with confirmation.                                     |
| <kbd>Mod+Shift+P</kbd>           | Powers off the monitors. To turn them back on, any input is required.           |
| <kbd>Mod+WheelScrollDown</kbd>   | Scrolls down through workspaces.                                                |
| <kbd>Mod+WheelScrollUp</kbd>     | Scrolls up through workspaces.                                                  |
| <kbd>Mod+Ctrl+WheelScrollDown</kbd> | Moves the column down through workspaces.                                    |
| <kbd>Mod+Ctrl+WheelScrollUp</kbd> | Moves the column up through workspaces.                                        |
| <kbd>Mod+WheelScrollRight</kbd>  | Focuses on the column to the right.                                             |
| <kbd>Mod+WheelScrollLeft</kbd>   | Focuses on the column to the left.                                              |
| <kbd>Mod+Ctrl+WheelScrollRight</kbd> | Moves the column to the right.                                              |
| <kbd>Mod+Ctrl+WheelScrollLeft</kbd> | Moves the column to the left.                                                |
| <kbd>Mod+Shift+WheelScrollDown</kbd> | Focuses on the column to the right.                                         |
| <kbd>Mod+Shift+WheelScrollUp</kbd> | Focuses on the column to the left.                                            |
| <kbd>Mod+Ctrl+Shift+WheelScrollDown</kbd> | Moves the column to the right.                                         |
| <kbd>Mod+Ctrl+Shift+WheelScrollUp</kbd> | Moves the column to the left.                                            |
| <kbd>XF86AudioRaiseVolume</kbd>   | Increases audio volume.                                                        |
| <kbd>XF86AudioLowerVolume</kbd>   | Decreases audio volume.                                                        |
| <kbd>XF86AudioMute</kbd>         | Mutes/unmutes audio.                                                            |
| <kbd>XF86AudioMicMute</kbd>      | Mutes/unmutes microphone.                                                       |

# Credits

## 

## ⭐ Star History
[![Star History Chart](https://api.star-history.com/svg?repos=NotMugil/niri-dots&type=Date)](https://star-history.com/#NotMugil/niri-dots&Date)

