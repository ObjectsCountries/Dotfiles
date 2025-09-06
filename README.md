# Dotfiles

## Info

| Component                   | Using                  | Package                                                                   |
|-----------------------------|------------------------|---------------------------------------------------------------------------|
| Icons (Laptop)              | Papirus                | `papirus-icon-theme`                                                      |
| Color of Folders (Laptop)   | Papirus Folders script | `papirus-folders` (AUR)                                                   |
| `ls` replacement            | `eza`                  | `eza`                                                                     |
| `cat` replacement           | `bat`                  | `bat`                                                                     |
| `git diff` replacement      | Delta                  | `git-delta`                                                               |
| Fish, Bat and Neovim themes | Cyberdream             | Not on AUR, available as a Neovim package (scottmckendry/cyberdream.nvim) |

`eza` customization:
```bash
eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time
```

Cyberdream for other apps available under their [extras](https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras)

## Desktop KDE Plasma

### Theming

* Fira Sans font, FiraCode Nerd Font for monospace

| Component           | Theme                                                                                                  |
|---------------------|--------------------------------------------------------------------------------------------------------|
| Colors              | BreezeDark                                                                                             |
| Application Style   | Breeze                                                                                                 |
| Plasma Style        | Orchis-Dark (`plasma6-themes-orchis-kde-git` on AUR)                                                   |
| GTK Theme           | Orchis-Dark                                                                                            |
| Window Decorations  | Orchis-Dark                                                                                            |
| Icons               | Papirus-Dark (`papirus-icon-theme` on Extra, with `papirus-folders` AUR script to make folders violet) |
| Cursors             | Breeze Light                                                                                           |
| System Sounds       | Ocean                                                                                                  |
| Splash Screen       | None                                                                                                   |
| Login Screen (SDDM) | eos-Breeze, [custom background](swag.jpg)                                                              |
| Boot Splash Screen  | BGRT, replaced Arch logo with EndeavourOS                                                              |

### Desktop

* Dynamic Wallpaper: `plasma5-wallpapers-dynamic`
  * Use [Lakeside](wallpaper.avif)
* Digital Clock w/ background in bottom right corner of left monitor
* GPU Usage line graph and Disk Usage pie chart in bottom left corner of right monitor

### Taskbar

* Application Launcher w/ `endeavouros` icon
* Global Menu
* Icons-Only Task Manager
  * Firefox, Discord, Steam, Emacs
* System Tray
* Clock

## Laptop KDE Plasma

### Desktop

* Breeze Dark theme for everything except icons
* Dynamic Wallpaper: `plasma5-wallpapers-dynamic`
  * Use [Lakeside](wallpaper.avif)
* Analog Clock in top left
* Weather in bottom left
* Digital Clock to the right of Analog Clock
  * 12-Hour for time, M/d/yyyy for date
* Media player in bottom right
* Battery above media player (align to right)

#### Panel

* One panel at the top
* `plasma6-applets-panel-colorizer`
  * Sky preset
  * Panel:
    * Background color: #1B1030
  * Widgets:
    * Background color: #8B5BC4, alpha 0.50
    * Foreground color: #FFFFFF
    * Radius of 16 and margin of 2 on all sides, spacing of 4
  * Tray elements: no customization
  * Overrides:
    * Plain: Background #000000 alpha 0.00, disable foreground
      * Apply to Application Menu, Global Menu, Panel Spacer, Icons-Only Task Manager, second Panel Spacer, Total CPU Use, Memory Usage
    * Padding: Margins 2 vertically, 6 horizontally
      * Apply to Digital Clock
* Application Menu
  * `endeavouros` icon
* Global Menu
* Panel Spacer
* Icons-Only Task Manager
  * Firefox, Discord, Emacs
* Panel Spacer
* System Tray
* Total CPU Use
* Memory Usage
* Digital Clock
  * M/d beside region defaults time

## Dotfiles

* [Emacs](Config%20Files/.emacs)
* [Fastfetch](Config%20Files/fastfetch/)
* [Fish](Config%20Files/fish/)
* [Glance](Config%20Files/glance.yml)
* [Hyfetch](Config%20Files/hyfetch.json)
* [Neovim](Config%20Files/nvim/)
* [Neovide](Config%20Files/neovide/)
* [Starship](Config%20Files/starship.toml)
