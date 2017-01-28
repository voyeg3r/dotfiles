#!/usr/bin/env python2
# # -*- coding: UTF-8 -*-
# Criado em:Qui 11/Mar/2010 hs 08:19
# Last Change: Sáb 02 Abr 2016 16:56:30 BRT
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: calcular sequencia de fibonacci
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

# to import:
# from fibonacci import mem_fib


import os
if os.name == 'posix':
    os.system('clear')
else:
    os.system('cls')

def mem_fib(n, _cache={}):
    '''efficiently memoized recursive function, returns a Fibonacci number'''
    if n in _cache:
        return _cache[n]
    elif n > 1:
        return _cache.setdefault(n, mem_fib(n-1) + mem_fib(n-2))
    return n


if __name__ == "__main__":
    max = int(input("Digite o numero a calcular: "))
    print(mem_fib(max))
