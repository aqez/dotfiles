function monitor
    dotnet-counters monitor -p $(dotnet-counters ps | fzf | awk '{print $1}')
end
