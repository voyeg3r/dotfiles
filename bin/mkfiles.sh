#!/bin/bash
# Criado em:Qui 05/Jan/2006 hs 13:13
# ultima modificação: Sex 03 Fev 2006 20:17:48 BRST
# Agenda telefônica
# Autor: Sérgio Luiz Araújo Silva
#
# script para criar arquivos
#
#

 extensao=.txt

# for i in {001..010}; do
#	 echo "arquivo${i}${extensao}" > arquivo$i$extensao
# done

touch file{001..010}$extensao
