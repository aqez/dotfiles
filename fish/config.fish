#if status is-interactive
#and not set -q TMUX
#    #exec tmux
#    exec tmux new-session -A -s base
#end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set PATH $PATH ~/.cargo/bin/

    zoxide init fish | source

    nvm -s use latest

    #fish_add_path /home/aqez/.npm-global/bin

    fish_config prompt choose arrow
end

# opam configuration
source /home/aqez/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# opencode
fish_add_path /home/aqez/.opencode/bin

# npm

export MAKEFLAGS="-j 12"
