#!/bin/bash

display=$(yabai -m query --displays --display | jq .index)

osascript -e \
  "tell application \"System Events\"
    do shell script quoted form of \"/System/Applications/Mission Control.app/Contents/MacOS/Mission Control\"
    click button 1 of group \"Spaces Bar\" of group $display of group \"Mission Control\" of process \"Dock\"
    do shell script quoted form of \"/System/Applications/Mission Control.app/Contents/MacOS/Mission Control\"
  end tell"

