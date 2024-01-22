#!/bin/zsh
DECOR_HEIGHT=44

DESKTOP_HEIGHT=$(xrandr | grep '*' | cut -d x -f 2 | cut -d " " -f 1 | head -1) #ah yes text extraction.
DESKTOP_WITHOUT_PANEL_HEIGHT=$(calc "$DESKTOP_HEIGHT - $DECOR_HEIGHT")
WINDOW_HEIGHT=$(calc "$DESKTOP_WITHOUT_PANEL_HEIGHT*0.5")
tdrop -ma -w 40% -h $WINDOW_HEIGHT -y $(calc $DESKTOP_WITHOUT_PANEL_HEIGHT-$HEIGHT) kitty zsh
