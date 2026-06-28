#!/bin/bash

last_output=""

update_icon() {
    # Get active window data
    window=$(hyprctl activewindow -j)
    
    # If no active window
    if [[ "$window" == "{}" || -z "$window" ]]; then
        current_output=$(jq -c -n '{"text": "", "tooltip": "No active window"}')
    else
        # Extract all variables from JSON
        floating=$(echo "$window" | jq -r '.floating // false')
        fullscreen=$(echo "$window" | jq -r '.fullscreen // 0')
        pseudo=$(echo "$window" | jq -r '.pseudo // false')
        xwayland=$(echo "$window" | jq -r '.xwayland // false')
        pinned=$(echo "$window" | jq -r '.pinned // false')
        swallowing=$(echo "$window" | jq -r '.swallowing // "0x0"')
        
        icons=""
        tooltip="Tiled"
        
        # 1. Main layout icons
        if [[ "$fullscreen" != "0" ]]; then
            icons+=" "
            tooltip="Maximized / Fullscreen"
        elif [[ "$pseudo" == "true" ]]; then
            icons+="󰹿 "
            tooltip="Pseudo"
        elif [[ "$floating" == "true" ]]; then
            icons+=" "
            tooltip="Floating"
        fi
        
        # 2. Add extra indicator icons
        if [[ "$xwayland" == "true" ]]; then
            icons+=" "
            tooltip="$tooltip, Xwayland"
        fi
        
        if [[ "$pinned" == "true" ]]; then
            icons+=" "
            tooltip="$tooltip, Pinned"
        fi
        
        # Swallowing address is "0x0" when empty, or a hex code when active
        if [[ "$swallowing" != "0x0" && "$swallowing" != "null" ]]; then
            icons+="󰮯 "
            tooltip="$tooltip, Swallowing"
        fi
        
        # Remove any extra spaces at the end of the icons string
        icons=$(echo "$icons" | sed 's/ *$//')
        
        # Wrap in brackets only if there are icons to show
        if [[ -n "$icons" ]]; then
            final_icon="[$icons]"
        else
            final_icon=""
        fi
        
        # Format the final JSON output
        current_output=$(jq -c -n --arg text "$final_icon" --arg tooltip "$tooltip" '{"text": $text, "tooltip": $tooltip}')
    fi
    
    # Only print to Waybar if the state actually changed
    if [[ "$current_output" != "$last_output" ]]; then
        echo "$current_output"
        last_output="$current_output"
    fi
}

# Run once on startup
update_icon

# Listen for events to update instantly
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    # Filter for window-related events
    case "$line" in
        activewindow*|windowtitle*|fullscreen*|changefloatingmode*|pin*|swallow*)
            update_icon
            ;;
    esac
done
