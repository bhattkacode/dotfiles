#!/bin/bash

id_file="$HOME/.scratchpad_window_id"

is_window_in_scratchpad() {
    i3-msg [id="$1"] | grep -q "[]"
}

save_window_id() {
    echo "$1" > "$id_file"
}

read_window_id() {
    cat "$id_file"
}

# Get the current focused window's ID
current_window_id=$(xdotool getwindowfocus)

# Check if the specific window is in the scratchpad
scratchWinID=$(cat $id_file)

i3-msg [id="$scratchWinID"] floating disable
i3-msg [id="$scratchWinID"] move container to workspace current
if [ $? -ne 0 ]; then
    i3-msg [id="$current_window_id"] move scratchpad
    save_window_id "$current_window_id"
fi
