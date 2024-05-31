#!/bin/env bash

repo='https://github.com/wbthomason/packer.nvim'
packpath='$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim'

# backup your old ~/.config/nvim - If you run it multiple times it
# will not mess up ane of your previous configs. the backup is
# nvim-backup-Year-month-day-hour-minute-second
mv -f ~/.config/nvim{,-backup-$(date +"%Y%m%d_%H%M%S")}

# in some cases people have the 'rm' command aliased, so the backslash
# will make sure we are using the actual rm command
\rm -rf ~/.config/nvim
\rm -rf ~/.cache/nvim
\rm -rf ~/.local/share/nvim

# If you wan to see older commits remove '--depth=1'
git clone --depth=1 https://sergio@bitbucket.org/sergio/nvim.git ~/.config/nvim
ln -sfvn ~/.config/nvim/packpath ~/.local/share/nvim

[ ! -f "$packpath" ] 2>/dev/null && git clone --depth 1 "$repo" "$packpath"

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'


