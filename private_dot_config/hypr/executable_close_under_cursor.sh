#!/bin/bash

# 1. Get exact cursor coordinates and active workspace ID
CURSOR=$(hyprctl cursorpos -j)
CX=$(echo "$CURSOR" | jq '.x')
CY=$(echo "$CURSOR" | jq '.y')
ACTIVE_WS=$(hyprctl activeworkspace -j | jq '.id')

# 2. Find the window under the cursor ONLY on the active workspace
TARGET=$(hyprctl clients -j | jq -r \
  --argjson cx "$CX" \
  --argjson cy "$CY" \
  --argjson ws "$ACTIVE_WS" \
  '.[] | 
   select(.workspace.id == $ws) |
   select(.at[0] <= $cx and $cx <= (.at[0] + .size[0]) and .at[1] <= $cy and $cy <= (.at[1] + .size[1])) | 
   .address' | head -n 1)

# 3. Close that specific window using the Lua syntax
if [ -n "$TARGET" ]; then
    hyprctl dispatch "hl.dsp.window.close({ window = \"address:$TARGET\" })"
fi
