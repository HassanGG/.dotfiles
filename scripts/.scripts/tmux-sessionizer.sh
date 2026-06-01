#!/usr/bin/env bash

# List top-level directories in ~/Projects and let the user pick one with fzf
selected=$(find ~/Projects -maxdepth 1 -mindepth 1 -type d | fzf --reverse --header "Select project")

# Exit if nothing was selected (e.g., user pressed escape)
[[ -z "$selected" ]] && exit 0

# Derive session name from directory name; replace dots with underscores for tmux compat
session_name=$(basename "$selected" | tr . _)

# If the session doesn't already exist, create it detached in the project directory
if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -ds "$session_name" -c "$selected"
fi

# If already inside tmux, switch the current client; otherwise attach from outside
if [[ -n "$TMUX" ]]; then
  tmux switch-client -t "$session_name"
else
  tmux attach-session -t "$session_name"
fi
