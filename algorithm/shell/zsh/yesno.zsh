#!/usr/bin/env zsh
# =================================================
#             File: yesno.zsh
#          Created: 2018 mai 26 07:19
#      Last Change: 2018 mai 26 09:13
# This script aims: get user confirmation
#           Author: sérgio luiz araújo silva
#             Site: http://vivaotux.blogspot.com
#          twitter: @voyeg3r
#            skype: sergioaraujosilva
# =================================================

read "response?Are you sure? [Y/n] "
response=${response:l} #tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    echo "You have chosen yes"
fi
