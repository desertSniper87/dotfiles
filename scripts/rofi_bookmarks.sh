#!/bin/bash

selection=$(rofi -i -width 1000 -theme solarized -dmenu $@ < /home/torsho/Dropbox/snippets.txt)
kaomoji=$(echo $selection)
echo -n "$kaomoji" | xclip -selection clipboard
sleep 0.1
xdotool key shift+Insert
