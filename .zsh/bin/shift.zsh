#!/bin/zsh
# no longer in use. replaced by a small rust binary :)
dbus-send --type=method_call --dest=org.mpris.MediaPlayer2.playerctld /org/mpris/MediaPlayer2 com.github.altdesktop.playerctld.Shift
#strips .instance from firefox playerctl name. works for any other playerctl application that does the same, does nothing to applications that dont have a period in thier name
progname=$(playerctl -l | head -1 | sed -E 's/(^[A-z0-9]+)[.]*[A-z0-9]*/\1/g')

qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText $progname $progname
