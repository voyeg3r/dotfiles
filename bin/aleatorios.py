#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Sex 12/Mar/2010 hs 07:34
# Last Change: qui 29 dez 2016 09:16:35 BRT
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: gerar sequencia de numeros aleatórios
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

import random


def aleatorios():
    '''Asks an int and returns a list of aleatory nymbers '''
    tam = eval(input('Digite quantos valores seram incluidos: '))
    print([random.randint(1, tam) for i in range(tam)])

if __name__ == '__main__':
        aleatorios()
# Se você estiver fazendo algo sério, e quiser uma implementação decente pra
# essa geração de um vetor aleatório, deveria usar o Numpy.
#
# Postei um benchmark das soluções propostas e adicionei uma utilizando o
# Numpy (http://paste.pocoo.org/show/187702/), seguem os tempos que deram para
# mim:
#
# Tempo total (teste #1): 10.1679s
# Tempo total (teste #2): 3.1838s
# Tempo total (teste #3): 9.7410s
# Tempo total (teste #4): 3.5267s
# Tempo total (teste #5): 0.1241s --> este é o tempo utilizando o Numpy
#
# - Christian S. Perone
#
# from timeit import Timer
# from random import randint, shuffle, randint, sample
# from numpy.random import randint as numpy_randint
#
# SIZE  = 200000
# TIMES = 20
#
# def test1():
#    vetor = []
#    for i in range(SIZE):
#       i = randint(1, SIZE)
#       vetor.append(i)
#
# def test2():
#     vetor = shuffle(range(1, SIZE+1))
#
# def test3():
#     vetor = [randint(1, SIZE) for i in xrange(1, SIZE+1)]
#
# def test4():
#     vetor = sample(xrange(SIZE),  SIZE)
#
# def test5():
#     vetor = numpy_randint(1, SIZE, SIZE)
#
# def test_method(num, times):
#     t = Timer("test%d()" % num, "from __main__ import test%d" % num)
#     print "Tempo total (teste #%d): %.4fs" % (num, t.timeit(times))
#
# if __name__=='__main__':
#     [test_method(i, TIMES) for i in xrange(1,6)]
#
#
