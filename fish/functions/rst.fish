function rst
    if test (count $argv) -eq 0
        echo "Usage: rst <filename>"
        return 1
    end

    for file in $argv
        set backup $file.bak
        if test -e $backup
            printf  "Restoring $backup → $file..."
            cp $backup $file
            printf "done\n"
        else
            echo "No backup found for $file"
        end
    end
end
