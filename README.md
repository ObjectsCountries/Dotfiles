# Dotfiles, Mods, etc.

## Info

|Component|Using|Package|
|-|-|-|
|Icons|Papirus|`papirus-icon-theme`|
|Color of Folders|Papirus Folders script|`papirus-folders` (AUR)|
|`ls` replacement|`eza`|`eza`|
|`cat` replacement|`bat`|`bat`|
|`git diff` replacement|Delta|`git-delta`|
|Theme for just about everything|Cyberdream|Not on AUR, available as a Neovim package (scottmckendry/cyberdream.nvim)|

`eza` customization:
```bash
eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time
```

Cyberdream for other apps available under their [extras](https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras)

## KDE Plasma

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
    * Background color: #8B5BC4
    * Foreground color: #EAE6F0
    * Radius of 16 and margin of 2 on all sides, spacing of 4
  * Tray elements: no customization
  * Overrides:
    * Plain: Disable widgets customization
      * Apply to Application Menu, Panel Spacer, Icons-Only Task Manager, second Panel Spacer, Total CPU Use, Memory Usage
    * Plain Lavender: Background #1B1030, foreground #EAE6F0
      * Apply to Global Menu
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

### Dotfiles

* [Fastfetch](Config%20Files/fastfetch)
* [Fish](Config%20Files/fish)
* [Hyfetch](Config%20Files/hyfetch.json)
* [Kitty](Config%20Files/kitty)
* [Neovim](Config%20Files/nvim)
* [Neovide](Config%20Files/neovide)
* [Starship](Config%20Files/starship.toml)

### Mods

#### Minecraft

* [Craft Presence](https://www.curseforge.com/minecraft/mc-mods/craftpresence)

##### Vanilla Tweaks

###### 1.20

Zip [here](Minecraft/VanillaTweaks-1.20.zip).

* Fixes and Consistency
  * Consistent Buckets
  * Updated Spectator Icon Textures
  * Don't Eat the Bowl!
  * Proper Break Particles
* Options Backgrounds
  * Purple Concrete
* Gui
  * No Java Edition Subtitle
  * Dark UI
* Hud
  * Ping Color Indicator
  * Rainbow Experience Bar
  * Smaller Crosshair
  * Wither Hearts
  * Numbered Hotbar
* 3d
  * 3D Sun & Moon
  * 3D Stonecutters
  * 3D Sculk Veins
  * 3D Glow Lichen
  * 3D Vines
  * 3D Fungi
  * 3D Trapdoors
  * 3D Lily Pads
  * 3D Iron Bars
  * 3D Sugar Cane
  * 3D Rails
  * 3D Ladders
  * 3D Pointed Dripstone
  * 3D Chains
  * 3D Chiseled Bookshelves
  * 3D Items
  * 3D Doors
  * 3D Amethyst Crystals
  * 3D Redstone Wire
* Unobtrusive
  * Borderless Glass
  * Borderless Stained Glass
  * Borderless Tinted Glass
  * Lower Fire
* Utility
  * Diminishing Tools
  * Mine Progress Bar
  * Hunger Preview
  * Directional Dispensers & Droppers
  * Directional Observers
  * Groovy Levers
  * Visual Cauldron Stages
  * Visual Composter Stages
  * Visual Honey Stages
  * Visual Sapling Growth
  * Visual Note Block Pitch
  * Sticky Piston Sides
  * Directional Hoppers
  * Fully Aged Crop Marker
  * Different Stems
  * Fully Aged Amethyst Cluster Marker
  * Brewing Guide
  * Redstone Power Levels
  * Clean Redstone Dust
* Connected Textures
  * Connected Bookshelves
  * Connected Polished Stones
  * Connected Iron Blocks
  * Connected Lapis Blocks
* Variation
  * Variated Cobblestone
  * Variated Planks
  * Variated End Stone
  * Variated Stone
  * Variated Villagers
  * Variated Red Mushroom Blocks
  * Variated Grass
* Terrain
  * Brighter Nether
  * Golden Savanna
  * Twinkling Stars
  * Circular Log Tops
  * Clearer Water
  * Podzol Sides
  * Warped Nylium Sides
  * Mycelium Sides
  * Snow Sides
  * Grass Path Sides
  * Crimson Nylium Sides
  * Grass Sides
* Aesthetic
  * Softer Wool
  * Brown Leather
  * Pink End Rods
  * Ashless Campfires
  * Flint Tipped Arrows
  * Splash Bottle o' Enchanting
  * Fencier Fences
  * Smoother Warped Planks
  * Classic Style Netherite Armor
* Colorful Slime
  * Cyan Slime

###### 1.21

Zip [here](Minecraft/VanillaTweaks-1.21.zip).

* Fixes And Consistency
  * Updated Spectator Icon Textures
  * Consistent Buckets
  * Don't Eat the Bowl!
  * Proper Break Particles
* World Of Color
  * Blue Enchantment Glint
  * Purple Elytra
  * Unique Dyes
  * Cyan Slime
* Fun
  * Sus Sand and Gravel
* Gui
  * Purple Concrete Options Background
  * Black Widgets
  * Gray Hotbar Selector
  * Asexual
  * Smaller Crosshair
  * No Java Edition Subtitle
  * Colored Ping Indicator
  * Clearer Wither Hearts
  * Rainbow Experience Bar
  * Numbered Hotbar
  * Dark UI
* 3d
  * 3D Bookshelves
  * 3D Sun & Moon
  * 3D Stonecutters
  * 3D Sculk Veins
  * 3D Glow Lichen
  * 3D Vines
  * 3D Fungi
  * 3D Lily Pads
  * 3D Iron Bars
  * 3D Sugar Cane
  * 3D Rails
  * 3D Ladders
  * 3D Mace
  * 3D Pointed Dripstone
  * 3D Chains
  * 3D Chiseled Bookshelves
  * 3D Items
  * 3D Doors & Trapdoors
  * 3D Amethyst Crystals
  * 3D Redstone Wire
* Unobtrusive
  * Borderless Glass
  * Borderless Stained Glass
  * Borderless Tinted Glass
  * Lower Fire
* Utility
  * Diminishing Tools
  * Mine Progress Bar
  * Hunger Preview
  * Directional Dispensers & Droppers
  * Directional Observers
  * Groovy Levers
  * Brewing Guide
  * Visual Cauldron Stages
  * Visual Composter Stages
  * Visual Honey Stages
  * Visual Sapling Growth
  * Visual Note Block Pitch
  * Sticky Piston Sides
  * Directional Hoppers
  * Fully Aged Crop Marker
  * Different Stems
  * Fully Aged Amethyst Cluster Marker
  * Redstone Power Levels
  * Clean Redstone Dust
* Connected Textures
  * Connected Polished Stones
  * Connected Iron Blocks
  * Connected Lapis Blocks
* Variation
  * Variated Cobblestone
  * Variated Planks
  * Variated Stone
  * Variated End Stone
  * Variated Villagers
  * Variated Red Mushroom Blocks
  * Variated Grass
* Terrain
  * Podzol Sides
  * Warped Nylium Sides
  * Mycelium Sides
  * Snow Sides
  * Grass Path Sides
  * Crimson Nylium Sides
  * Brighter Nether
  * Golden Savanna
  * Twinkling Stars
  * Circular Log Tops
  * Clearer Water
  * Grass Sides
* Aesthetic
  * Softer Wool
  * Brown Leather
  * Pink End Rods
  * Ashless Campfires
  * Flint Tipped Arrows
  * Splash Bottle o' Enchanting
  * Fencier Fences
  * Smoother Warped Planks
  * Classic Style Netherite Armor

#### Guilty Gear Strive

* [Secretary of Trans Rights Goldlewis](https://gamebanana.com/mods/395711)
* [Purple UI](https://gamebanana.com/mods/330653)
* [Dark/Night Celestial Lobby](https://gamebanana.com/mods/429714)
* [SF6 Frame DATA viewer FIXED (SEASON 4)](https://gamebanana.com/mods/513406)

### Other

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

Install the Python libraries `dotenv`, `psutil`, `pysolar` and `pywal` (`pysolar` through the AUR, the rest through Pacman) in order to get the auto-updating background.

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
