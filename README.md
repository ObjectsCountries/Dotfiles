# Dotfiles

## Info

| Component              | Using | Package     |
|------------------------|-------|-------------|
| `ls` replacement       | `eza` | `eza`       |
| `cat` replacement      | `bat` | `bat`       |
| `git diff` replacement | Delta | `git-delta` |

## Rice

| Component           | Theme                                                                                                  |
|---------------------|--------------------------------------------------------------------------------------------------------|
| Colors              | Breeze Dark, purple color                                                                              |
| Application Style   | Breeze                                                                                                 |
| Plasma Style        | Breeze                                                                                                 |
| GTK Theme           | Breeze                                                                                                 |
| Window Decorations  | Breeze                                                                                                 |
| Icons               | Papirus-Dark (`papirus-icon-theme` on Extra, with `papirus-folders` AUR script to make folders violet) |
| Cursors             | Breeze Light                                                                                           |
| System Sounds       | Ocean                                                                                                  |
| Splash Screen       | None                                                                                                   |
| Login Screen (SDDM) | Breeze, [custom background](Images/bg.jpg)                                                             |
| Boot Splash Screen  | BGRT, replaced Arch logo with CachyOS                                                                  |

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

Copy the [Rice](Rice/) folder to `~/.config/panel-colorizer/presets/`.

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
  * CachyOS icon
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

## Config Files

### Bash

Two lines added onto the end of the file:

```bash
alias eza='eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time'
eval "$(starship init bash)"
```

### Fastfetch

On [line 315](fastfetch.jsonc#L315), replace `"INSERT+CITY+HERE"` with the name of your city (plus state/province and country if necessary), replacing spaces with plus symbols. Rename the file to `config.jsonc`.

### Hyfetch

Currently set to asexual pride at brightness 40% with Fastfetch as the backend.

#### Starship

Currently set to be themed around the asexual pride flag, with 4 segments:

1. OS, shell, `username@hostname`
2. Directory and git status
3. Programming languages:
  * C
  * CMake
  * C++
  * C#
  * Jupyter (custom)
  * NodeJS
  * Python
  * Rust
  * Verilog (custom)
4. Battery, "Sudo Active", time, command duration (shown when a command takes at least 2 seconds)

Below is an arrow that will be white for a command that exits 0, and red for a command that exits with any other exit code.
