function bak
    if test (count $argv) -eq 0
        echo "Usage: bak <filename>"
        return 1
    end

    for file in $argv
        printf "Backing up $file → $file.bak..."
        cp $file $file.bak
        printf "done\n"
    end
end

