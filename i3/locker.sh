#!/bin/bash

# requires graphicsmagick for better performance (erase <gm> to use imagemagick) 
ICON=$HOME/.config/i3/icons/lock.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
#xset dpms force off
#gm mogrify -colorspace gray -blur 0x3 $fscrn
#gm mogrify -blur 0x4 $fscrn
#gm mogrify -scale 50% -blur 0x2 -scale 200% $fscrn
convert $TMPBG -scale 10% -scale 1000% -fill black -colorize 25% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
#gm mogrify -scale 10% -scale $(identify -format "%wx%h" $fscrn)\! $fscrn

i3lock -dui $TMPBG -n
rm $TMPBG
