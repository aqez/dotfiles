if status is-interactive
    # Commands to run in interactive sessions can go here
    set PATH $PATH ~/.cargo/bin/

    zoxide init fish | source

    fish_config prompt choose arrow
end
