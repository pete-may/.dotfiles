if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
      tmux attach -t raspi-remote || tmux new -s raspi-remote
fi
