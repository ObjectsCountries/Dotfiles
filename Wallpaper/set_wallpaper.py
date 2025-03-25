#!/usr/bin/env python3

from datetime import datetime, timedelta, timezone
from os import getenv
from signal import SIGTERM
import subprocess
from time import sleep

from dotenv import load_dotenv
import psutil
from pysolar.solar import get_azimuth

load_dotenv()

wallpaper: int = -1
previous_wallpaper: int = -1

sleep(.5)

while True:
    date: datetime = datetime.now(timezone(-timedelta(hours=7))) # Modify according to your timezone
    azimuth: float = get_azimuth(float(getenv("LATITUDE")), float(getenv("LONGITUDE")), date)
    wallpaper = 1 + int((azimuth // 30) + 1) % 12
    wallpaper_path = f"/home/kasra/Dotfiles/Wallpaper/dear-{wallpaper}.jpg"

    if previous_wallpaper != wallpaper:

        hyprsunset = None

        for p in psutil.process_iter(["name"]):
            if p.info["name"] == "hyprsunset":
                hyprsunset = p
                break

        if wallpaper in {1, 2, 3, 11, 12} and hyprsunset is None:
            subprocess.Popen(["hyprsunset", "-i", "5000"])
        elif wallpaper in {4, 5, 6, 7, 8, 9, 10} and hyprsunset is not None:
            hyprsunset.send_signal(SIGTERM)

        subprocess.run(["hyprctl", "hyprpaper", "preload", wallpaper_path])
        subprocess.run(["hyprctl", "hyprpaper", "wallpaper", ","+wallpaper_path])
        subprocess.run(["hyprctl", "hyprpaper", "unload", "unused"])
        sleep(1)
        subprocess.run(["hyprpanel", "sw", wallpaper_path])

    previous_wallpaper = wallpaper
    sleep(60)
