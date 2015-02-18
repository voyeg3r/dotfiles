#!/usr/bin/env zsh

# clone dir
DOTDIR=~/.dotfiles

git clone --recursive git@github.com:voyeg3r/prezto.git "${ZDOTDIR:-$HOME}/zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/zprezto/runcoms/^README.md(.N); do
  ln -sfvn "$rcfile" "${ZDOTDIR:-$HOME}/${rcfile:t}"
done


