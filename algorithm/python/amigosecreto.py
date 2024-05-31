#!/usr/bin/env python2
# -*- encoding: utf-8 -*-

#Para rodar o script você só precisa do python e de um arquivo chamado
#amigos.txt, com o nome das  pessoas dentro no formato Nome - email.

#Exemplo:

    #  Fulano Taltal - meu@email.com.br
    #  Sicrana  - sicrana@hotmail.com
    #  Beltrana Gatinha - com-cam@tal.com.br

from random import shuffle
import os

arquivo = open("amigos.txt","r")

pessoas = arquivo.readlines()
shuffle(pessoas)

for par in zip(pessoas, pessoas[1:] + pessoas [:1]):
  envia = os.popen("/usr/bin/mail -s '[sorteio] Seu amigo secreto é ...'"
  par[0].replace("\n","").split("-")[1], "w")
  print &gt;&gt; envia, "tchandandandan .... \n\n\n\n\n\n\n\n\n\n"
  par[1].replace("\n","").split("-")[0]
  envia.close()

arquivo.close()
