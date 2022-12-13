#!/usr/bin/env zsh

# zsh home
export ZSH=$HOME/.zsh

bindkey -e

# source zap 
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# zap plugin manager
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"

# zap source
plug "$HOME/.dotfiles/system/aliases.zsh"
plug "$HOME/.dotfiles/system/prompt.zsh"

# zsh completions setting/keybinds
autoload -Uz compinit && compinit
fpath=(~/.local/share/zap/plugins/zsh-completions/zsh-completions.plugin.zsh/src $fpath)

# case insensitive completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# show last command name and working directory
preexec() { print -Pn "\e]0;$1%~\a" }

# paths
export PATH=/opt/homebrew/bin:$PATH

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
