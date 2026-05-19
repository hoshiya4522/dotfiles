#!/bin/bash

LIMIT=$(zenity --scale \
    --title="Battery Charge Limit" \
    --text="Choose your max battery percentage:\n(Set to 100 to disable limit)" \
    --value=95 \
    --min-value=60 \
    --max-value=100 \
    --step=1)

if [ -n "$LIMIT" ]; then
    if pkexec sh -c "echo $LIMIT > /sys/class/power_supply/BAT0/charge_control_end_threshold"; then
        zenity --info \
            --title="Success" \
            --text="Battery will now stop charging at $LIMIT%"
    else
        zenity --error \
            --title="Error" \
            --text="Failed to set battery limit."
    fi
fi
