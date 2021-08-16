#!/bin/bash

if [[ $(yabai -m query --spaces --space | jq -r '.type') = 'stack' && $(yabai -m query --spaces --space | jq '.display') -ne 1 ]]
	then 
			p=401 
	else 
			p=16 
	fi 
	space=$(yabai -m query --spaces --space | jq '.index')                                                                                    
yabai -m config --space $space left_padding $p                                                                                           
yabai -m config --space $space right_padding $p
