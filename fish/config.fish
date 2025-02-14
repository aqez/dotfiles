#if status is-interactive
#and not set -q TMUX
#    #exec tmux
#    exec tmux new-session -A -s base
#end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set PATH $PATH ~/.cargo/bin/

    zoxide init fish | source

    fish_config prompt choose arrow
end

# opam configuration
source /home/aqez/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
