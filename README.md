# My Dots!

## Better Touch Tool

the presets include remapping the right shift key to output "~/."

When red window button is left clicked it will be the default action, `CMD + W`

When the red window button is right clicked (two finger tap), it will do the `CMD + Q` action.

- Function Keys Info

Make sure that you go into `System Presets -> Keyboard -> Touchbar Settings -> Show App Controls`

To completely disable the system Touchbar press `CMD + ,` to enter btt settings.

Next, go to `standard settings -> touchbar` and uncheck `Show macOS Control Strip`

If you dont want to completely disable, uncheck `Hide left close/X button` to get rid of annoying btt button

## Window Managing

- better touch tool

`window` snapping enabled, using defaults

- macOS settings

`three finger drag` enabled in system settings

## ZSH

cd into `.zsh` first and then clone each repo

- zsh-autosuggestions

`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

then in .zshrc put `source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh`

- zsh-completion

to enable the zsh completion system `autoload -U compinit; compinit`

`git clone https://github.com/zsh-users/zsh-completions.git`

then in .zshrc put `fpath=(~/.zsh/zsh-completion/zsh-completion.plugin.zsh/src $fpath)`

- zsh-syntax-highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git`

then in .zshrc put `source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`

## Symlinks

- vimrc

`ln -s ~/.dotfiles/.vimrc ~/.vimrc`

`ln -s ~/.dotfiles/.vim ~/.vim`

- zsh

`ln -s ~/.dotfiles/.zprofile ~/.zprofile`

`ln -s ~/.dotfiles/.zshenv ~/.zshenv`

`ln -s ~/.dotfiles/.zshrc ~/.zshrc`

- brew

`ln -s ~/.dotfiles/Brewfile ~/Brewfile`

- kitty

`ln -s ~/.dotfiles/.config/kitty ~/.config/kitty`

- nvim

`ln -s ~/.dotfiles/.config/nvim ~/.config/nvim`

- git

`ln -s ~/.dotfiles/.gitconfig ~/.gitconfig`

`ln -s ~/.dotfiles/.gitmessage ~/.gitmessage`

- hammerspoon

`ln -s ~/.dotfiles/.hammerspoon ~/.hammerspoon`

- warp

ln -s ~/.dotfiles/.warp ~/.warp
