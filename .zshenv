#!/usr/bin/env zsh


# If one of the VISUAL or EDITOR environment variables contain the string 'vi' when the shell starts up then it will be viins, otherwise it will be emacs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="safari"
. "$HOME/.cargo/env"
