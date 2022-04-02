#!/bin/bash

# Remappings
xmodmap -e "keycode 135 = Super_R"
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Super_L"
xset rate 200 25
killall xcape 2> /dev/null ; xcape -e 'Super_L=Escape' &

xmonad
