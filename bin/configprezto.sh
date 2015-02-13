#!/usr/bin/env zsh
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE: Fri Feb 13, 2015  03:16PM
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

ZDOTDIR=~/.dotfiles

git clone --recursive https://github.com/voyeg3r/prezto "${ZDOTDIR:-$HOME}/zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/zprezto/runcoms/^README.md(.N); do
    ln -sfvn "$rcfile" "${ZDOTDIR:-$HOME}/${rcfile:t}"
done

cd "${ZDOTDIR:-$HOME}"/zprezto/
find -type f | xargs sed -i 's/\.zprezto/zprezto/g'
