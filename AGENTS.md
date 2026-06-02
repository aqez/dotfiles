# AGENTS.md

Guidance for coding agents working in this dotfiles repository.

## Scope

These instructions apply to the whole repository. This repo contains live personal configuration files for the `aqez` user; many top-level directories are symlinked into `~/.config`.

## Repository layout

- `nvim/` — Neovim config in Lua, using `lazy.nvim` and plugin modules under `nvim/lua/plugins/`.
- `fish/` — Fish shell config, functions, completions, and plugin files.
- `wezterm/`, `kitty/`, `alacritty/` — terminal configs.
- `tmux/` — tmux config and TPM submodule path.
- `hypr/`, `awesome/`, `qtile/`, `ags/`, `eww/`, `rofi/` — desktop/window-manager UI configs.
- `systemd/`, `btrbk/` — user/system service and backup-related configs.
- `bin/` — personal scripts.
- `packages.txt` — package inventory/list.

## Dotfile deployment assumptions

Most config directories are intended to be linked directly under `~/.config` using GNU stow, e.g. `~/.config/nvim -> <repo>/nvim`. Do not reorganize directory structure unless explicitly asked.

Before changing deployment-related behavior, inspect existing symlinks and ask for confirmation. Do not run `stow`, service enable/disable commands, or commands that mutate the user's live desktop/session unless explicitly requested.

## Editing rules

- Make small, targeted changes and preserve the current style of the file being edited.
- Avoid bulk formatting across unrelated files.
- Do not commit secrets, access tokens, private keys, machine credentials, or generated local state.
- Do not edit vendored/submodule content under:
  - `awesome/battery-widget`
  - `awesome/awesome-wm-widgets`
  - `tmux/plugins/tpm`
- Keep ignored/generated files out of the repo, especially `lazygit/state.yml`, `.luarc.json`, caches, and plugin checkout directories.

## Style notes

- Lua configs generally use 4-space indentation and return plugin specs as Lua tables.
- Fish functions use standard Fish syntax and 4-space indentation in function bodies.
- Shell scripts in `bin/` should prefer portable Bash/sh where practical and should quote paths/variables.
- Existing configs are intentionally personal and pragmatic; prefer minimal fixes over introducing frameworks.

## Validation commands

Run the narrowest relevant checks for changed files. Useful commands:

```sh
# Lua syntax for Neovim/WezTerm/Awesome files, if luac is installed
find nvim wezterm awesome -name '*.lua' -print0 | xargs -0 luac -p

# Fish syntax
fish -n fish/config.fish fish/functions/*.fish fish/conf.d/*.fish fish/completions/*.fish

# Shell scripts
bash -n bin/* qtile/autostart.sh
# If shellcheck is installed:
shellcheck bin/* qtile/autostart.sh

# Python syntax
python -m py_compile qtile/config.py

# tmux syntax, if tmux supports -n
tmux_conf=tmux/tmux.conf; tmux source-file -n "$tmux_conf"
```

For Neovim config changes, a useful smoke test is:

```sh
nvim --headless '+lua print("nvim config loaded")' +qa
```

Be aware that launching apps may load live user configuration and can create/update local state.

## Git hygiene

- Check `git status --short` before and after edits.
- Preserve unrelated user changes.
- Do not initialize/update submodules, install packages, update lockfiles, or run plugin managers unless the task requires it.
