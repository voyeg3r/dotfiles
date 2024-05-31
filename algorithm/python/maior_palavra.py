#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# retorna maior palavra de uma lista de palavras

# def maior_palavra(lista):
#     maior_palavra = ""
#     for i in lista:
#         if len(i) > len(maior_palavra):
#             maior_palavra = i
#     return maior_palavra


quant = int(input("Quantas palavras? "))

words = []

for i in range(quant):
    words.append(input("Digite uma palavra: "))

print('Palavras digitadas:')
print('-' * 30)
print("\n".join(sorted(words, key=len)))
print('-' * 30)
print('Maior palavra')
# print(sorted(words, key=len)[-1])
print(max(words, key=len))

