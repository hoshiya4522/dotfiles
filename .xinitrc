#!/bin/sh
/usr/bin/VBoxClient-all

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


while true; do
    emacs --daemon &
    bash $HOME/.scripts/vboxres &
    pkill dwmblocks &
    dwmblocks &
    dunst &
    # feh ~/Pictures/Wallpapers/acyclovir.png --bg-fill &
    feh ~/Code/Git/dwm/wallpapers/tokyonight -z --bg-fill &
    dwm >/dev/null 2>&1
done
