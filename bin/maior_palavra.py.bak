#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# retorna maior palavra de uma lista de palavras

#def maior_palavra(lista):
#    maior_palavra = ""
#    for i in lista:
#        if len(i) > len(maior_palavra):
#            maior_palavra = i
#    return maior_palavra

quantidade=int(raw_input("Quantas palavras? "))

palavras=[]

cont=0
while cont < quantidade:
    palavras.append(str(raw_input("Digite uma palavra: ")))
    cont=cont+1

print "palavras digitadas"
print "-"*30
print "\n".join(sorted(palavras,key=len))
print "-"*30
print "maior palavra"
print "-"*30
print sorted(palavras,key=len)[-1]
#sorted('lista de palavras diversas sim'.split(),key=len)


