#!/usr/bin/env bash
# Last Change: Thu, 03 Nov 2022 - 09:12
# vim:set ft=sh tabstop=4 shiftwidth=4 nospell nolist:
# tags: [nvim, setup]

# alias trash='gio trash'
#trash ~/.config/nvim

[[ -d ~/.config/nvim ]] && (
    echo "Removendo ~/.config/nvim"
	\rm -rf ~/.config/nvim
)

[[ -d ~/.cache/nvim ]] && (
	echo "Removendo ~/.cache/nvim"
	\rm -rf ~/.cache/nvim
)

[[ -d ~/.local/share/nvim ]] && (
    echo "Removendo ~/.local/share/nvim"
	\rm -rf ~/.local/share/nvim
)

[[ ! -d ~/.config/nvim ]] && (
	echo "Criando diretório ~/.config/nvim"
	mkdir -p ~/.config/nvim
)

echo "Clonando o plugin packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


