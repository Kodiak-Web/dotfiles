#!/bin/zsh


function chx() {
    if [ "$0" != "" ]
    then
	chmod +x $0
    else
	    chmod +x ${history[@][0]}
    fi
}
function title() {
  echo $'\033]30;'$*$'\007'
}
