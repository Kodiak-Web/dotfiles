[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap
# The following lines were added by compinstall

#compilation seems to make themes fail on my ubuntu install
zstyle ':znap:*' auto-compile no

zstyle ':completion:*' completer _expand _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/kodi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

## HAND EDITS TIME FROM HERE ON. COWABUNGA
#path+=('home/kodi/.local/bin') #TIL zsh makes that possible
#history changes
autoload zmv
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt AUTO_CD
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
path+=("$HOME/.cargo/bin/")
path+=("$HOME/.local/bin")
eval "$(zoxide init zsh)"
znap source mjrafferty/apollo-zsh-theme 
#znap source agkozak/zsh-z replaced by zoxide
znap source fdw/ranger-zoxide
znap source zsh-users/zsh-autosuggestions
znap source arzzen/calc.plugin.zsh
## run every file in .zsh
for x in ~/.zsh/*.zsh
do
	. $x
done
