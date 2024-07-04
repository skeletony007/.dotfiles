#!usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='robbyrussell'

plugins=(
    zsh-autosuggestions
    git
    pass
)

source "$ZSH/oh-my-zsh.sh"

bindkey '^[[1;3C' forward-word # alt + right
bindkey ^y forward-char

source "$HOME/.config/zsh/zshrc"
