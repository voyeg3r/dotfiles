#!/usr/bin/env bash
# vim:nolist softtabstop=4 shiftwidth=4 tabstop=4 expandtab ft=sh:
#     Filename: acertahora.sh
#      Created: ago 22, 2021 - 22:00
#  Last Change: Tue, 01 Nov 2022 14:37:38
#          vim: ft=sh:fdm=syntax:nu:
# This aims to: sync clock
#        Autor: Sergio Araujo
#         site: https://dev.to/voyeg3r
#       github: @voyeg3r
#       e-mail: <voyeg3r ✉ gmail.com>
#      Licence: GPL (see http://www.gnu.org/licenses/gpl.txt)
#    Reference: https://pt.stackoverflow.com/questions/130582

# doas hwclock --set --date="08/21/2021 20:15:00"
# doas hwclock --hctosys

# dependency 'doas'

site='https://www.horariodebrasilia.org/'
dia=$(curl -s "$site" | grep -Poh '(?<=\<h3 id="dia-topo"\>).*(?=\</h3\>)')
hora=$(curl -s "$site" | grep -Poh '(?<=\<p id="relogio"\>).*(?=\</p\>)')

# echo "$dia"
# echo "$hora"

doas date +%T -s "$hora"

