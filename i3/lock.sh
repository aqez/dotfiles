#!/bin/bash

scrot -o /tmp/lock.png
convert /tmp/lock.png -scale 50% -blur 5x5 -scale 200% /tmp/lock.png
i3lock -u -i /tmp/lock.png
