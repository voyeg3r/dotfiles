#!/usr/bin/env bash
# =================================================
# Creation Date:    <+type creation's date+>
# Last Change:      ter 29 nov 2016 12:25:15 BRT
# this script aims: afinar violão
# author:           sérgio luiz araújo silva
# site:             http://vivaotux.blogspot.com
# twitter:          @voyeg3r
# skype:            sergioaraujosilva
# Reference:
# https://elias.praciano.com/2015/03/como-afinar-seu-violao-com-linux/
# =================================================

# Dependency: sox

n=('' E4 B3 G3 D3 A2 E2);
while read -n1 -p 'string? ' i;
	do case $i in [1-6])
		play -n synth pl ${n[$i]} fade 0 1 ;; *) echo;
		break;;
	esac;
done
