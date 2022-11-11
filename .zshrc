#!/usr/bin/env zsh

### ZSH HOME
export ZSH=$HOME/.zsh

## show last command name and working directory
preexec() { print -Pn "\e]0;$1%~\a" }

# bindkey -v for vim mode
bindkey -e

# options
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# zsh completions setting/keybinds
autoload -Uz compinit && compinit
fpath=(~/.zsh/zsh-completions/zsh-completions.plugin.zsh/src $fpath)

# zsh autosuggestions setting/keybinds
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting setting/keybinds
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# paths
export PATH=/opt/homebrew/bin:$PATH

# for system folder to be exported
export EDITOR='nvim'
for DOTFILE in `find /Users/camrynpoole/.dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
