Arquivo: dicas sobre planilhas calc (excel)
Criado: Sex 28/Set/2012 hs 09:33
Last Change: ter 03 jan 2017 14:43:47 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r  gmail.com>


##Formatação condicional

Crie um estilo e formate com o fundo cinza

  Se a fórmula é igual a    =MOD(LINHA();2)=0

##Contar alunos abaixo da média

	=CONT.SE(C3:C15;"<6")


## Contar valores caso existam

Esta situação é muito comum em boletins escolares, numa coluna
em que nada foi digitado o calc irá mostrar apenas um traço "-"
para as colunas onde notas tenham sido digitadas ele conta quantas
atingiram a média que no caso é 6,0

  =SE(CONT.VALORES(C3:C22)=0;"-";CONT.SE(C3:C22;">=6"))

