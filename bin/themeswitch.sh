#!/usr/bin/bash

dark=org.kde.breezedark.desktop
light=org.kde.breeze.desktop

current=$(grep "LookAndFeel" ~/.config/kdeglobals)
current=${current#*=}

echo $current

target=""

if [ "$current" == "$dark" ]; then
    target=$light
else
    target=$dark
fi


echo Current: $current

echo Target: $target

lookandfeeltool -a $target
lookandfeeltool -a $target
lookandfeeltool -a $target
