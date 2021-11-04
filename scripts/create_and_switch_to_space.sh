#!/bin/bash

~/.dotfiles/scripts/create_new_space.sh

index=$(yabai -m query --displays --display | jq '.spaces[-1]')
skhd --key "ctrl - $index"
