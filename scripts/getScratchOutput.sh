#!/bin/env bash

output=$(tmux capture-pane -pt scratch:.1 | awk '/./{line=$0} END{print line}')
class="normal"
if [[ "$output" == *"❯"* ]] || [[ "$(hyprctl activewindow | grep initialClass)" == *"scratch" ]] || [[ "$(tmux list-panes -t scratch:.1 -F '#{pane_current_command}')" == "nvim" ]]; then
  true
else
  n=30
  string_length=${#output}

  if [ "$string_length" -gt "$n" ]; then
    output="…$(expr "$output" : ".*\(.\{$n\}\)$")"
  fi
  if [[ $output =~ \[[^][\]]*\/[^][\]]*\]([:?.?]|$) ]] || [[ "$output" == *"password for"* ]]; then
    class="urgent"
  fi
  echo '{"text": "'"$output"'", "tooltip": "yo", "class": "'"$class"'"}'
fi
