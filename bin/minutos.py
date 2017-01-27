#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    27-01-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  <+this script aims+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

'''
fonte: http://pingmind.com.br/media/private/uploads/2253/TWP10%20Condicoes_3.pdf

Considere a empresa de telefonia Tchau .  Abaixo de 200 minutos, a empresa
cobra R $ 0 , 20 por minuto .  Entre 200 e 400 minutos, o preço é R $ 0 , 18 .
Acima de 400 minutos o preço por minuto é R $ 0 , 15 .  Calcule sua conta de
telefone .

Adicionada mais uma condição: caso minutos seja => 800 nova tarifa
'''

def calcular():
    '''
    calcular a tarifa baseado na quantidade de minutos
    '''
    minutos = int(input("Minutos utilizados: "))
    if minutos < 200:
        preço = 0.20
    elif minutos <= 400:
        preço = 0.18
    elif minutos <= 800 :
        preço = 0.15
    else:
        preço = 0.08

    print(f"Conta telefonica: R$ {minutos * preço:.02f}")


if __name__ == '__main__':
        calcular()

