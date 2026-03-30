# Config Files

## Bash

Two lines added onto the end of the file:

```bash
alias eza='eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time'
eval "$(starship init bash)"
```

## Emacs

[Lines 315-335](.emacs#L315-L335) are commented out on my PC, and left as they are on my laptop.

## Fastfetch

On [line 367](fastfetch.jsonc#L367), replace `"INSERT+CITY+HERE"` with the name of your city (plus state/province and country if necessary), replacing spaces with plus symbols.

## Git

Change `user.email` and `user.name` for yourself, if you plan on using my incredibly basic Git config.

## Hyfetch

Currently set to asexual pride at brightness 40% with Fastfetch as the backend.

## Starship

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