#!/bin/bash

picom --daemon --inactive-opacity 1.0 --corner-radius 5

# xss-lock -- /home/aqez/repos/dotfiles/bin/lock.sh
xset r rate 170 100
setxkbmap -option caps:escape

# rclone mount --daemon --vfs-cache-mode writes box:/ /home/aqez/box
