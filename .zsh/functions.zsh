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

function clit() {
	local gitfolder="$HOME/.git/"
	local url=$(xclip -o -selection clipboard)
	local current_dir="$PWD"
	
	if echo "$url" | grep "https://github.com/Kodiak-Web/**"; 
	then
		gitfolder="$gitfolder/Kodiak-Web/"
	fi
	if [ ! -d "$gitfolder" ]
	then
    		mkdir "$gitfolder"
	fi 
	cd $gitfolder
	git clone "$url"
	cd "$current_dir"
}

function tsh {
	tmux new-session "-As$1" "$1"
}
