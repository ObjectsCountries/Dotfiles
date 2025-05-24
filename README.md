# Dotfiles, Mods, etc.

## Info

|Component|Using|Package|
|-|-|-|
|Icons (Laptop) |Papirus|`papirus-icon-theme`|
|Color of Folders (Laptop)|Papirus Folders script|`papirus-folders` (AUR)|
|`ls` replacement|`eza`|`eza`|
|`cat` replacement|`bat`|`bat`|
|`git diff` replacement|Delta|`git-delta`|
|Theme for just about everything|Cyberdream|Not on AUR, available as a Neovim package (scottmckendry/cyberdream.nvim)|

`eza` customization:
```bash
eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time
```

Cyberdream for other apps available under their [extras](https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras)

## Desktop KDE Plasma

### Theming

* Fira Sans font, FiraCode Nerd Font for monospace

|Component|Theme|
|-|-|
|Colors|[MyBreeze-Dark-Color](https://store.kde.org/p/2217383)|
|Application Style|Breeze|
|Plasma Style|[MyBreeze-Dark-Plasma](https://store.kde.org/p/2217414)|
|GTK Theme|[MyBreeze-Dark-GTK](https://store.kde.org/p/2217416)|
|Window Decorations|[Cool-Color-Dark-Aurorae-6](https://store.kde.org/p/2227008)|
|Icons|[Varied-gnome-dark](https://store.kde.org/p/2221913)|
|Cursors|Breeze Light|
|System Sounds|Ocean|
|Splash Screen|None|
|Login Screen (SDDM)|Default|
|Boot Splash Screen|BGRT|

### Desktop

* Dynamic Wallpaper: `plasma5-wallpapers-dynamic`
  * Use [Lakeside](Wallpaper/wallpaper.avif)
* Digital Clock w/ background in bottom right corner of left monitor
* Wunderground widget in bottom left corner of right monitor
* GPU Usage line graph and Disk Usage pie chart above Wunderground

### Taskbar

* Application Launcher w/ `endeavouros` icon
* Icons-Only Task Manager
  * Floorp, Discord, Steam, Emacs client
* Wunderground
* System Tray
* Clock

## Laptop KDE Plasma

### Desktop

* Breeze Dark theme for everything except icons
* Dynamic Wallpaper: `plasma5-wallpapers-dynamic`
  * Use [Lakeside](Wallpaper/wallpaper.avif)
* Analog Clock in top left
* Wunderground in bottom left
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
    * Foreground color: #EAE6F0
    * Radius of 16 and margin of 2 on all sides, spacing of 4
  * Tray elements: no customization
  * Overrides:
    * Plain: Background #000000 alpha 0.00, disable foreground
      * Apply to Application Menu, Global Menu, Panel Spacer, Icons-Only Task Manager, second Panel Spacer, Total CPU Use, Memory Usage
* Application Menu
  * `endeavouros` icon
* Global Menu
* Panel Spacer
* Icons-Only Task Manager
  * Chrome, Discord, Steam
* Panel Spacer
* Wunderground (extension)
* System Tray
* Total CPU Use
* Memory Usage
* Digital Clock
  * M/d beside region defaults time

## Dotfiles

* [Emacs](Config%20Files/Emacs)
* [Fastfetch](Config%20Files/fastfetch)
* [Fish](Config%20Files/fish)
* [Hyfetch](Config%20Files/hyfetch.json)
* [Hyprland](Config%20Files/hypr)
* [Hyprpanel](Config%20Files/hyprpanel)
* [Kitty](Config%20Files/kitty)
* [Neovim](Config%20Files/nvim)
* [Neovide](Config%20Files/neovide)
* [Starship](Config%20Files/starship.toml)

## Mods

### Minecraft

* [Craft Presence](https://www.curseforge.com/minecraft/mc-mods/craftpresence)

### Guilty Gear Strive

* [Secretary of Trans Rights Goldlewis](https://gamebanana.com/mods/395711)
* [Purple UI](https://gamebanana.com/mods/330653)
* [Dark/Night Celestial Lobby](https://gamebanana.com/mods/429714)
* [SF6 Frame DATA viewer FIXED (SEASON 4)](https://gamebanana.com/mods/513406)

## Other

* [Login Screen](Login%20Screen)
* [Background](Wallpaper)
* Apps:
  * Discord
  * Steam (Download KTaNE and GGST, and maybe Marvel Rivals)
  * Spotify
  * Octopi (updates and downloads for Arch-based distros)
  * Mission Center
  * Qalculate! (Qt)
  * Unity 2017.4.22f1 (for KTaNE modding)

## Hyprland

Install the Python libraries `dotenv`, `psutil` and `pysolar` (`pysolar` through the AUR, the others through Pacman) in order to get the auto-updating background.

### Hyprpanel

#### Left

* Menu
* Workspaces
* Media Title
* Cava

#### Center

* Open Window

#### Right

* Notifications
* Weather
* System Tray
* Upload/Download Speeds
* Packages
* Volume
* Microphone Volume
* CPU Usage (Click to open Mission Center)
* RAM Usage (Click to open Mission Center)
* Hyprsunset
* Hypridle
* Time
