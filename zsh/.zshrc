#!/usr/bin/env zsh

if [ -z "$TMUX" ]; then
    while true; do
        clear

        tmux new-session -A -c "${HOME}/personal" -s 'personal'

        if ! tmux has-session 2>/dev/null; then
            exit
        fi
        if ! tmux has-session -t '=personal' 2>/dev/null; then
            echo -e '\033[1;33mWARNING:\033[0m Destroy all other Tmux sessions first. Restoring session.'
            sleep 1
        fi
    done
fi

export XDG_CONFIG_HOME="${HOME}/.config"

add_to_path() {
    if [[ ":${PATH}:" != *":${1}:"* ]]; then
        export PATH="${PATH}:${1}"
    fi
}

add_to_path_front() {
    if [[ ":${PATH}:" != *":${1}:"* ]]; then
        export PATH="${1}:${PATH}"
    fi
}

if [ -d "${XDG_CONFIG_HOME}/personal.d" ]; then
    for f in "${XDG_CONFIG_HOME}/personal.d"/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export PERSONAL="${HOME}/personal"
export WORK="${HOME}/work"

export SESSION_PATH="$PWD"

bindkey -e
