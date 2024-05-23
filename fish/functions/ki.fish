function ki --wraps='ps -e | fzf | xargs kill 09' --description 'alias ki ps -e | fzf | xargs kill 09'
  ps -e | fzf | xargs kill 09 $argv
        
end
