#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

$SCREENSHOT
i3lock -i $PICTURE -t -f -u -p win -e
rm $PICTURE
