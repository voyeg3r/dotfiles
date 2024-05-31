#!/usr/bin/env bash
# Last Change: Sat, 26 Nov 2022 - 15:17:51
# vim:nolist softtabstop=4 shiftwidth=4 tabstop=4 expandtab ft=sh:
# script for toggling my nvim versions
# References:
# https://unix.stackexchange.com/a/74186/3157
# https://stackoverflow.com/users/2766545/janaka-bandara

if [[ $(ps aux | grep -c 'nvim .[z]shenv') == 1 ]]; then
    echo "close your ~/.zshenv before using this script"
    exit 1
fi

# editor=$(awk -F= '/^export EDITOR/ {print $2}' ~/.zshenv)

if [[ $editor =~ '.*mynvim' ]]; then
  sed -i -r 's,(^export EDITOR=).*,\1/bin/nvim,g' ~/.zshenv
else
  sed -i -r 's,(^export EDITOR=).*,\1$MYNVIM,g' ~/.zshenv
fi

