#!/usr/bin/env zsh
# Created: qua jan 16 13:37:04 -03 2019
# Last Change: jan 16 2019 13:42

# The best way to store your dotfiles: A bare Git repository
# Source: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

[ -d $HOME/.cfg ] || mkdir $HOME/.cfg
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
