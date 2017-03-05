#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  sáb 04 mar 2017 10:31:32 BRT
# Created:      sáb 04 mar 2017 10:31:32 BRT
# File:         basico_decorator.py
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r
# download:     https://gist.github.com/voyeg3r/41740d38cb247a5d8e27a36289298789

'''
Este pequeno módulo introduz o conceito de decorator
ouro nome comum para decorators é: "wrapper"
na prática ao implementar um decorator você adiciona
funcionalidades à funções preexistentes, no caso da
função hello() abaixo note que ela passa a retornar
seu conteudo dentro de tags <i> e <b>.
'''

def bold(f):
    def envelope():
        return "<b>" + f() + "</b>"
    return envelope

def italic(f):
    def envelope():
        return "<i>" + f() + "</i>"
    return envelope

@bold
@italic
def hello():
    return 'Hello World!'

if __name__ == '__main__':
        hello()
