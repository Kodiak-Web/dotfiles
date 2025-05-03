function fzfcd --wraps=cd --wraps='cd (find . -type d | fzf)' --wraps='cd (find . -type d | fzf) 2> /dev/null' --description 'alias fzfcd cd (find . -type d | fzf) 2> /dev/null'
  cd (find . -type d | fzf) 2> /dev/null $argv
        
end
