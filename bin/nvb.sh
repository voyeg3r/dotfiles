#!/usr/bin/sh
# https://alpha2phi.medium.com/neovim-for-beginners-init-lua-45ff91f741cb
# Last Change: Jun 08 2022 17:28

NVIM_BEGINNER=~/.config/nvim-beginner
export NVIM_BEGINNER

alias nvb='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CONFIG_HOME=$NVIM_BEGINNER nvim' 
export nvb

nvb
