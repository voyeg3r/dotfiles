#!/usr/bin/python
# Criado em:Dom 12/Ago/2007 hs 10:49
# Last Change: Dom 12 Ago 2007 11:11:06 BRT
# Instituicao:

import math

class Raizes:

    def __init__(self, a, b, c): #construtores
        self.a = a
        self.b = b
        self.c = c
        self.delta = self.b**2 - 4 * self.a * self.c

    def calcula_Raizes(self): #metodo_de_calculo_das_raizes
        if self.delta < 0:
            print "Delta negativo:ndelta: %f" %(self.delta)

        elif self.delta == 0:
            self.xxx = (-self.b + math.sqrt(self.delta)) / 2*self.a
            print "Valor Calculado.nx: %fndelta: %f" %(self.xxx, self.delta)

        elif self.delta > 0:
            self.x = (-self.b + math.sqrt(self.delta)) / 2*self.a
            self.xx = (-self.b - math.sqrt(self.delta)) / 2*self.a
            print "Raizes.nx: %fnxx: %fndelta: %f" %(self.x, self.xx, self.delta)
