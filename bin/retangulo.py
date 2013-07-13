#!/bin/python/env
# Criado em:Dom 12/Ago/2007 hs 10:49
# Last Change: Dom 12 Ago 2007 11:11:06 BRT
# Instituicao:

class Retangulo:
    lado_a = None
    lado_b = None
    def __init__(self, lado_a, lado_b):
        self.lado_a = lado_a
        self.lado_b = lado_b
        print "Criando nova instˆncia Retangulo"
                                a
    def calcula_area(self):
        return self.lado_a * self.lado_b
    def calcula per ́metro(self):
                   ı
        return 2 * self.lado_a + 2 * self.lado_b

