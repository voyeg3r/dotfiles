#!/usr/bin/env zsh
# vim:ft=sh:nolist:
# tags: [menu, select, case, shell, zsh]

# export COLUMNS=1

# declare -A choices
local -a choices
choices=($HOME/build/dotfiles-gabriel/.config/zsh/core/ufetch/*(.:t))

PS3="Select your language please: "
select opt in ${choices[@]} Quit
do
    case $opt in
        "catppuccin")
            echo "$opt is your choice";;
        "fedora")
           echo "$opt is your choice";;
        "pink-floyd")
           echo "$opt is your choice";;
        "Quit")
           echo "We're done"
           break;;
        *)
           echo "Ooops";;
    esac
done
