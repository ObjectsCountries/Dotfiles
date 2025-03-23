#!/usr/bin/env python3

from datetime import datetime, timedelta, timezone
from os import getenv
import re
import signal
import subprocess
import time

from dotenv import load_dotenv
import psutil
from pysolar.solar import get_azimuth
import pywal

load_dotenv()

wallpaper: int = -1
previous_wallpaper: int = -1

time.sleep(.5)

while True:
    date: datetime = datetime.now(timezone(-timedelta(hours=7))) # Modify according to your timezone
    azimuth: float = get_azimuth(float(getenv("LATITUDE")), float(getenv("LONGITUDE")), date)
    wallpaper = 1 + int((azimuth // 30) + 1) % 12
    wallpaper_path = f"/home/kasra/Dotfiles/Wallpaper/dear-{wallpaper}.jpg"

    if previous_wallpaper != wallpaper:
        subprocess.run(["hyprctl", "hyprpaper", "preload", wallpaper_path])
        subprocess.run(["hyprctl", "hyprpaper", "wallpaper", ","+wallpaper_path])
        subprocess.run(["hyprctl", "hyprpaper", "unload", "unused"])
        time.sleep(1)
        subprocess.run(["hyprpanel", "sw", wallpaper_path])
    previous_wallpaper = wallpaper
    time.sleep(60)
