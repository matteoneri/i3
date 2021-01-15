#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

BLUR="10x6"

$SCREENSHOT
~/.config/i3/scripts/im-painteffect -p 1 -e 0 -t yes $PICTURE $PICTURE
# convert $PICTURE -blur $BLUR $PICTURE
i3lock -i $PICTURE -t -f
rm $PICTURE
