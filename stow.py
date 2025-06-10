#!/usr/bin/env python3

from os import getcwd, listdir, remove, symlink
from pathlib import Path
from shutil import rmtree
from tkinter import W, BooleanVar, Button, Checkbutton, Frame, Tk

_CONFIG_PATH: Path = Path(getcwd() + "/Config Files/")
_KTANE_PATH: Path = Path(getcwd() + "/KTaNE/")

if not Path.exists(_CONFIG_PATH) or not Path.exists(_KTANE_PATH):
    print("Please run this script from the base of the repo.")
    exit(1)

_CONFIG_DESTINATION: Path = Path.home() / ".config/"
_KTANE_DESTINATION: Path = (
    Path.home() / ".config/unity3d/Steel Crate Games/Keep Talking and Nobody Explodes/"
)

_ROOT = Tk()

_COMPONENTS: dict[str, tuple[str, Path, BooleanVar]] = {
    "Emacs": ("emacs/", _CONFIG_DESTINATION, BooleanVar()),
    "Fastfetch": ("fastfetch/", _CONFIG_DESTINATION, BooleanVar()),
    "Fish": ("fish/", _CONFIG_DESTINATION, BooleanVar()),
    "Hyfetch": ("hyfetch.json", _CONFIG_DESTINATION, BooleanVar()),
    "Hyprland": ("hypr/", _CONFIG_DESTINATION, BooleanVar()),
    "Hyprpanel": ("hyprpanel/", _CONFIG_DESTINATION, BooleanVar()),
    "Kitty": ("kitty/", _CONFIG_DESTINATION, BooleanVar()),
    "KTaNE": (".", _KTANE_DESTINATION, BooleanVar()),
    "Neovide": ("neovide/", _CONFIG_DESTINATION, BooleanVar()),
    "Neovim": ("nvim/", _CONFIG_DESTINATION, BooleanVar()),
    "Starship": ("starship.toml", _CONFIG_DESTINATION, BooleanVar()),
}


_ROOT.title("Dotfiles Stower")

_FRAME: Frame = Frame(_ROOT)

_FRAME.pack(padx=10, pady=10)

_CHECKBUTTONS: list[Checkbutton] = []

for name, (_, _, chosen) in _COMPONENTS.items():
    _CHECKBUTTONS.append(Checkbutton(_FRAME, text=name, variable=chosen))
    _CHECKBUTTONS[-1].pack(anchor=W)

def _stow():
    for name, (path, destination, chosen) in _COMPONENTS.items():
        if chosen.get():
            match name:
                case "KTaNE":
                    for file in listdir(_KTANE_PATH):
                        if file != "README.md":
                            dest: Path = destination / file
                            if Path.is_file(dest):
                                remove(dest)
                            elif Path.is_dir(dest):
                                rmtree(dest)
                            symlink(_KTANE_PATH / file, dest)
                case _:
                    dest = destination / path
                    if Path.is_file(dest):
                        remove(dest)
                    elif Path.is_dir(dest):
                        rmtree(dest)
                    symlink(_CONFIG_PATH / path, dest)

_SUBMIT: Button = Button(_FRAME, text="Stow", command=_stow)

_SUBMIT.pack()

def _main():
    _ROOT.mainloop()


if __name__ == "__main__":
    _main()
