#!/bin/bash

# If audio is already playing, stop it
if pgrep -x "mpv" > /dev/null || pgrep -x "aplay" > /dev/null; then
    killall mpv piper-tts aplay 2>/dev/null
	notify-send "Speech Killed"
    exit 0
fi

TEXT=$(wl-paste --primary)

# Check if the text contains any Bengali characters
if echo "$TEXT" | grep -qP '[\x{0980}-\x{09FF}]'; then
	# Bengali found: Use Edge-TTS cloud
	notify-send "Bengali Detected"
	notify-send "Speech Start"

    # echo "$TEXT" | edge-tts --voice bn-BD-NabanitaNeural -f /dev/stdin --write-media /tmp/smart_tts.mp3
    echo "$TEXT" | edge-tts --voice bn-IN-TanishaaNeural -f /dev/stdin --write-media /tmp/smart_tts.mp3
    mpv /tmp/smart_tts.mp3
else
    # Pure English: Use instant offline Piper
	notify-send "English Detected"
	notify-send "Speech Start"

    echo "$TEXT" | piper-tts -m ~/.local/share/piper-voices/en_US-amy-medium.onnx --output_raw | aplay -r 22050 -f S16_LE -t raw -c 1
fi
