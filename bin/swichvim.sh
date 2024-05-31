#!/usr/bin/env bash
#     Filename: swichvim.sh
#      Created: 2019-11-16 09:54
#  Last Change: Mon, 13 Sep 2021 - 15:35
#          vim: ft=sh:fdm=syntax:nu:
# This aims to: swich nvim settings
#        Autor: Sergio Araujo
#         site: https://dev.to/voyeg3r
#       github: @voyeg3r
#       e-mail: <voyeg3r ✉ gmail.com>
#      Licence: GPL (see http://www.gnu.orswimg/licenses/gpl.txt)

#currentvim=$(ls -l ~/.config/nvim | awk '{print $NF}')
currentvim=$(readlink ~/.config/nvim)

swich(){
    rm -f ~/.config/nvim/plugin/packer_compiled.lua
    rm -rf ~/.local/share/nvim
 
    if [ "$currentvim" == "$HOME/.dotfiles/defaults.nvim" ]; then
        ln -sfvn $HOME/.dotfiles/nvim $HOME/.config
    else
        ln -sfvn $HOME/.dotfiles/defaults.nvim $HOME/.config
    fi
	echo "Running packer install..."
	nvim +PackerInstall +PackerCompile +qall
	echo "Let's get started with our new neovim configuration"
}

echo "--------------------------------------------------"
echo "Current vim is: $currentvim"
echo "--------------------------------------------------"
echo
read -r -p "Do you want to swich? [Y/n]: " response
response=${response,,} # tolower

if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    swich
fi

echo "--------------------------------------------------"
echo "Now our neovim is: $currentvim"
echo "--------------------------------------------------"
