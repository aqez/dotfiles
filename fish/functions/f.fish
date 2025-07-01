function f --wraps='cd $(fdfind . /home | fzf)' --description 'alias f=cd $(fdfind . /home | fzf)'
  cd $(fdfind . /home | fzf) $argv
        
end
