#! /usr/bin/env bash

PATH=$PATH:$HOME/go/bin

if ! command -v sesh &> /dev/null; then
  echo "sesh not found"
  exit 1
fi

selected=$(sesh list -tz | fzf-tmux -p 75%,80% \
    --no-sort --border-label ' sesh ' --prompt '🪟  ' \
    --header '  ^y All ^x Tmux-Session ^c Zoxide-Dirs' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-y:change-prompt(🌟  )+reload(sesh list -tz)' \
    --bind 'ctrl-x:change-prompt(🪟  )+reload(sesh list -t)' \
    --bind 'ctrl-c:change-prompt(📁  )+reload(sesh list -z)' \
)

if [[ -n $selected ]]; then
  sesh connect $selected
fi
