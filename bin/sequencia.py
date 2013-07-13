#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
#
#  Considere que, para um determinado número inteiro n existe uma sequencia de números a 
#  partir de n que leva ao número 1. Tal sequencia será definida da seguinte forma:
# 
#     * se n for ímpar, multiplique n por 3 e some 1 para obter o próximo número da sequencia
#     * caso contrário, ou seja, se n for par, divida o por 2 para obter o próximo número
# 
# Para determinar se um número é ímpar ou par utilize o operador "%". Este operador retorna o resto da 
# divisão, logo, se "n % 2 == 1" significa que o número é ímpar, pois o resto da divisão por 2 foi igual a um.
# 
# Vejamos um exemplo, para n igual a 22 teremos a seguinte sequencia:
# 
# 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1
#

def calcula_sequencia(max):
    sequencia=[max]
    while max != 1:
        if max % 2 != 0:
            max = max * 3 + 1
            sequencia.append(max)
        else:
            max = max / 2
            sequencia.append(max)
    return sequencia

if __name__ == '__main__':
        max = int(raw_input("Digite o valor inicial da sequencia: "))
        print calcula_sequencia(max)

#numbers = [int(raw_input("enter number: "))]

#p = lambda x: ((x % 2) and x * 3 + 1) or x / 2

#while numbers[-1] != 1: numbers.append(p(numbers[-1]))

#print numbers

