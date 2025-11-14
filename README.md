# Dotfiles

## Info

| Component                   | Using                  | Package                                                                   |
|-----------------------------|------------------------|---------------------------------------------------------------------------|
| `ls` replacement            | `eza`                  | `eza`                                                                     |
| `cat` replacement           | `bat`                  | `bat`                                                                     |
| `git diff` replacement      | Delta                  | `git-delta`                                                               |
| Fish, Bat and Neovim themes | Cyberdream             | Not on AUR, available as a Neovim package (scottmckendry/cyberdream.nvim) |

`eza` customization:
```bash
eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time
```

Cyberdream for other apps available under their [extras](https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras)

## Theming

| Component           | Theme                                                                                                  |
|---------------------|--------------------------------------------------------------------------------------------------------|
| Colors              | Breeze Dark, purple                                                                                    |
| Application Style   | Breeze                                                                                                 |
| Plasma Style        | Breeze                                                                                                 |
| GTK Theme           | Breeze                                                                                                 |
| Window Decorations  | Breeze                                                                                                 |
| Icons               | Papirus-Dark (`papirus-icon-theme` on Extra, with `papirus-folders` AUR script to make folders violet) |
| Cursors             | Breeze Light                                                                                           |
| System Sounds       | Ocean                                                                                                  |
| Splash Screen       | None                                                                                                   |
| Login Screen (SDDM) | Breeze, [custom background](swag.jpg)                                                                  |
| Boot Splash Screen  | BGRT, replaced Arch logo with CachyOS                                                                  |

## Laptop

### Desktop

* Dynamic Wallpaper: `plasma5-wallpapers-dynamic`
  * Use [Lakeside](wallpaper.avif)
* Analog Clock in top left
* Weather in bottom left
* Digital Clock to the right of Analog Clock
  * 12-Hour for time, M/d/yyyy for date, transparent background
* Media player in bottom right
* Battery above media player (align to right)

### Panel

* One panel at the top, 28 px in height
* `plasma6-applets-panel-colorizer`
  * Sky preset
  * Panel:
    * Background color: #1B1030
  * Widgets:
    * Background color: #8B5BC4, alpha 0.50
    * Foreground color: #FFFFFF
    * Radius of 16 and margin of 2 on all sides, spacing of 4
  * Tray widgets: no customization
  * Preset Overrides:
    * Plain: Background #000000 alpha 0.00, disable foreground
      * Apply to Application Menu, Global Menu, Panel Spacer, Icons-Only Task Manager, second Panel Spacer, Total CPU Use, Memory Usage
    * Padding: Margins 2 vertically, 6 horizontally
      * Apply to Digital Clock
* Application Menu
  * `org.cachyos.hello` icon
* Global Menu
* Panel Spacer
* Icons-Only Task Manager
  * Firefox, Discord, Emacs (client)
* Panel Spacer
* System Tray
* Total CPU Use
* Memory Usage
* Digital Clock
  * M/d/yyyy date beside 12-Hour time

## Dotfiles

* [Emacs](Config%20Files/.emacs)
* [Fastfetch](Config%20Files/fastfetch.jsonc)
* [Fish](Config%20Files/fish/)
* [Glance](Config%20Files/glance.yml)
* [Hyfetch](Config%20Files/hyfetch.json)
* [Starship](Config%20Files/starship.toml)
