#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  2018 mai 24 17:32
# Created:      sex 27 jan 2017 15:43:25 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

'''
 SOURCE: http://pingmind.com.br/media/private/uploads/2253/TWP10%20Condicoes_3.pdf

 Pergunte a velocidade de um carro, supondo um valor inteiro .  Caso ultrapasse
 110 km/h, exiba uma mensagem dizendo que o usuário foi multado .  Neste caso,
 exiba o valor da multa, cobrando R $ 5 , 00 por km acima de 110 .

 Esse código foi adaptado para python3 fazendo uso da notação
 mais moderna chamada f-strings que simplifica a impressão do resultado
 na tela
'''

def multa():
    '''recebe um inteiro velocidade, para cada quilometro acima de 110
    adiciona R$ 5,00 à multado
    '''
    v = int(input("Velocidade: "))
    if v > 110:
        print("Você foi multado!")
        multa = (v - 110) * 5
        print(f'Valor da multa: R$ {multa:.02f}')


# caso o programa seja executado diretamente ele
# chama a função multa
if __name__ == "__main__":
    multa()


