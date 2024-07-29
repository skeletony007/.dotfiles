#!usr/bin/env zsh

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
fi

if [ -z "$TMUX" ]; then
    exec tmux new-session -A -s personal -c "$HOME/personal"
fi

export XDG_CONFIG_HOME=$HOME/.config

add_to_path() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

add_to_path_front() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

PERSONAL=$XDG_CONFIG_HOME/personal

if [ -d "$PERSONAL" ]; then
    for f in "$PERSONAL"/env* "$PERSONAL"/paths* "$PERSONAL"/alias*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export PERSONAL=$HOME/personal
export WORK=$HOME/work
