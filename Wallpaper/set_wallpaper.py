#!/usr/bin/env python3

from datetime import datetime, timedelta, timezone
from math import ceil
from os import getenv
from signal import SIGTERM
from subprocess import run, Popen
from time import sleep

from dotenv import load_dotenv
from psutil import Process, process_iter
from pysolar.solar import get_azimuth

load_dotenv() # Be sure to create a .env file with your coordinates

TIMEZONE: int = -7 # Modify according to your timezone
HYPRSUNSET_TEMP: str = "5000" # Modify according to how you would like hyprsunset to be set (MUST be a string, NOT an int)
WALLPAPER_FOLDER: str = "/home/kasra/Dotfiles/Wallpaper" # Enter in the name of the path to your wallpaper folder (WITHOUT an ending /)


# If your wallpaper names follow a numbered pattern...
NUMBER_OF_WALLPAPERS: int = 12              # Replace this with the number of wallpapers you have
STARTING_AT: int = 1                        # Replace this with the starting number for your wallpapers
WALLPAPER_NAME_PREFIX: str = "dear-"        # Make sure all your wallpapers have the same prefix
EXTENSION: str = "jpg"                      # Make sure all your wallpapers have the same extension
HYPRSUNSET_ON: set[int] = {1, 2, 3, 11, 12} # Replace with all of the numbers for a nighttime wallpaper, where you want to have hyprsunset on

# If they don't...
# WALLPAPER_NAMES: list[str] = [] # Fill this list with the names of your wallpapers (MUST be a string, NOT a pathlib.Path, and MUST be relative file names only, assuming they're all in the same folder)


wallpaper: int = -1
previous_wallpaper: int = -1

while True:

    now: datetime = datetime.now(timezone(timedelta(hours = TIMEZONE)))
    azimuth: float = get_azimuth(float(getenv("LATITUDE", "0.0")), float(getenv("LONGITUDE", "0.0")), now)

    wallpaper = STARTING_AT + ceil(azimuth / (360 // NUMBER_OF_WALLPAPERS)) % NUMBER_OF_WALLPAPERS # Automatically calculates the right wallpaper based on the azimuth of the sun
    # wallpaper_path: str = WALLPAPER_FOLDER + WALLPAPER_NAMES[wallpaper - STARTING_AT] # Uncomment if using a list of wallpaper names, but DO NOT comment out the above line
    wallpaper_path: str = WALLPAPER_FOLDER + "/" + WALLPAPER_NAME_PREFIX + str(wallpaper) + "." + EXTENSION # Comment this out if using a list of wallpaper names

    if previous_wallpaper != wallpaper:

        hyprsunset: Process | None = None

        for p in process_iter(["name"]):
            if p.info["name"] == "hyprsunset":
                hyprsunset = p
                break

        if wallpaper in HYPRSUNSET_ON and hyprsunset is None:
            Popen(["hyprsunset", "-t", HYPRSUNSET_TEMP])
        elif wallpaper not in HYPRSUNSET_ON and hyprsunset is not None:
            hyprsunset.send_signal(SIGTERM)

        sleep(1)
        run(["hyprpanel", "sw", wallpaper_path])

    previous_wallpaper = wallpaper
    sleep(60)
