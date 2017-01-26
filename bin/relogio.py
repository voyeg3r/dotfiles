#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  qui 26 jan 2017 20:08:40 BRT
# Created:      qui 26 jan 2017 20:08:40 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# source: https://www.vivaolinux.com.br/script/Relogio-digital-em-Python

import tkinter
from time import strftime
rel = tkinter.Label()
rel.pack() # deixa o conteudo visivel dentro da label
rel['text'] = strftime('%H:%M:%S')
rel['font'] = 'Helvita 120 bold'
rel['foreground'] = 'black'
rel['bg'] = 'white'
def contador():
	agora = strftime('%H:%M:%S')
	if rel['text'] != agora:
		rel['text'] = agora
	rel.after(100, contador)
contador() # chama a funcao contador
rel.mainloop()



