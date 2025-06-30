#!/bin/bash

# Change cursor to padlock
swaymsg exec "swaylock -f -e -l --font \"JetBrainsMono Nerd Font Medium\" --image /home/bart/Pictures/Wallpaper/yosemite-night.jpg"

# Wait for swaylock to exit
wait
