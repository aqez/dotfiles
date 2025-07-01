function PR --wraps='gh pr create -f' --description 'alias PR=gh pr create -f'
  gh pr create -f $argv
        
end
