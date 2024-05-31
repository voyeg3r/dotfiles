#!/usr/bin/env bash
#     Filename: nv.sh
#  Last Change: Sun, 26 Jun 2022 16:53
#          vim: ft=sh:fdm=syntax:set nu:
#       source: https://dev.to/creativenull/installing-neovim-nightly-alongside-stable-10d0

clear
# just change the build name
export BUILD_NAME="nvim2"

# the folder where you want to install
export NVIMHOME="$HOME/build/$BUILD_NAME"

if [ ! -d "$NVIMHOME" ]; then
    echo "clonando o vim direto do site oficial..."
    sleep 2
    git clone https://github.com/neovim/neovim "$NVIMHOME"
    cd "$NVIMHOME" || echo "Diretório $NVIMHOME inexistente" && exit 1
    make CMAKE_BUILD_TYPE=Release
fi

export MYVIMRC="$NVIMHOME"/init.lua
[ ! -f "$MYVIMRC" ] && touch "$MYVIMRC"

NVIM_RPLUGIN_MANIFEST="$HOME"/.local/share/"$BUILD_NAME"/rplugin.vim VIMRUNTIME="$NVIMHOME"/runtime "$NVIMHOME"/build/bin/nvim "$@" -u "$NVIMHOME"/init.vim

# MYVIMRC=$NVIMHOME/init.lua NVIM_RPLUGIN_MANIFEST=$HOME/.local/share/$BUILD_NAME/rplugin.vim VIMRUNTIME=$NVIMHOME/runtime nvim "$@" -u "$NVIMHOME"/init.lua
