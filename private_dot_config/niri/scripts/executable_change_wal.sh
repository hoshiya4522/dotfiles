#!/bin/bash

DIR="/home/hoshiya4522/Pictures/Wallpapers"
WALLPAPER=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)


wal -i "$WALLPAPER" -n

swaync-client -rs
swww img "$WALLPAPER" --transition-type random --transition-fps 60

pkill wayabr
waybar&

notify-send -i "$WALLPAPER" -a "Wallpaper" "Theme Updated" "New colors generated from $(basename "$WALLPAPER")"

