#!/bin/bash
# Get active layout
layout=$(hyprctl -j activeworkspace | jq -r '.tiledLayout')

# Output accordingly using a case statement
case "$layout" in
    dwindle) echo "󰌗" ;;
    scrolling) echo "" ;;
    master) echo "" ;;
    monocle) echo "" ;;
    *) echo "" ;;
esac
