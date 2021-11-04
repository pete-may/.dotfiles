#!/bin/bash

display=$(yabai -m query --displays --display | jq .index)
spaceIndex=$(yabai -m query --spaces --space | jq .index)
actualIndex=$(($(yabai -m query --displays --display | jq ".spaces | to_entries | .[] | select(.value == $spaceIndex) | .key")+1))

osascript -e \
  "tell application \"System Events\"
    do shell script quoted form of \"/System/Applications/Mission Control.app/Contents/MacOS/Mission Control\"
    delay 0.3
    perform action \"AXRemoveDesktop\" of button $actualIndex of list 1 of group \"Spaces Bar\" of group $display of group \"Mission Control\" of process \"Dock\"
    delay 0.5
    do shell script quoted form of \"/System/Applications/Mission Control.app/Contents/MacOS/Mission Control\"
  end tell"

skhd --key "ctrl - $(($spaceIndex-1))"
