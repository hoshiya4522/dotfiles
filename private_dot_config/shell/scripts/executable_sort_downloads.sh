#!/bin/bash
TARGET="$HOME/Downloads"

# Watch the folder for finished downloads or moved files
inotifywait -m -e close_write,moved_to --format "%f" "$TARGET" | while read FILENAME
do
    # Ignore Brave's temporary files and hidden files
    if [[ "$FILENAME" == *.crdownload || "$FILENAME" == *.tmp || "$FILENAME" == .* ]]; then
        continue
    fi

    FILE="$TARGET/$FILENAME"

    # Check if it is a file (not a folder)
    if [ -f "$FILE" ]; then
        # Convert filename to lowercase for easier extension matching
        case "${FILENAME,,}" in
            *.mp3|*.wav|*.flac|*.m4a|*.ogg) mv "$FILE" "$TARGET/Audio/" ;;
            *.zip|*.tar.gz|*.rar|*.7z|*.tar|*.xz|*.pkg.tar.zst) mv "$FILE" "$TARGET/Compressed/" ;;
            *.pdf|*.doc|*.docx|*.txt|*.csv|*.xlsx|*.pptx) mv "$FILE" "$TARGET/Documents/" ;;
            *.jpg|*.jpeg|*.png|*.svg|*.gif|*.webp) mv "$FILE" "$TARGET/Images/" ;;
            *.appimage|*.deb|*.rpm|*.run|*.exe|*.msi) mv "$FILE" "$TARGET/Installers/" ;;
            *.torrent) mv "$FILE" "$TARGET/Torrent/" ;;
            *.mp4|*.mkv|*.avi|*.mov|*.webm) mv "$FILE" "$TARGET/Videos/" ;;
            *) mv "$FILE" "$TARGET/MISC/" ;; # Catch-all for anything else
        esac
    fi
done
