#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Sex 05/Out/2012 hs 12:58
# Last Change: 2012 Out 05 13:11:11
# vim:ft=python:nolist:nu:
# Proposito do script: relogio gráfico em python
# Autor: Sérgio Luiz Araújo Silva
# site: vivaotux.blogspot.com
# twitter: voyeg3r
#by Luciano Ramalho

import Tkinter
from time import strftime

relogio = Tkinter.Label()

relogio.pack()
relogio['font'] = 'Helvetica 120 bold'
relogio['text'] = strftime('%H:%M:%S')

def tictac():
    agora = strftime('%H:%M:%S')
    if agora != relogio['text']:
        relogio['text'] = agora
    relogio.after(100, tictac)

tictac()
relogio.mainloop()
