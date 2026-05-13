function dwr --wraps='dotnet watch run --no-restore' --description 'alias dwr=dotnet watch run --no-restore'
  dotnet watch run $argv
        
end
