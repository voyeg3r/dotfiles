#!/bin/bash
# Criado em           : Qua 03/Out/2012 hs 13:56
# Last Change         : 2012 Nov 13 09:07:10
# vim                 :ft=sh:fdm=syntax:nu:
# Instituicao         : none
# Proposito do script : criar folha de ponto
# Autor               : Sérgio Luiz Araújo Silva
# site                : http://vivaotux.blogspot.com
# twitter             : http://www.twitter.com/voyeg3r
# link                : https://bitbucket.org/sergio/folhadeponto/overview

# para clonar faça:
# hg clone ssh://hg@bitbucket.org/sergio/folhadeponto

# testando se o programa ghostscript está instalado
# ele é necessário para juntar os pdf's
which gs >/dev/null || sudo apt-get isntall ghostscript
which inkscape >/dev/null || sudo apt-get isntall inkscape

# criando uma pasta na qual serão colocados os pdf's temporários
[ -d container ] && rm -rf container
[ -d container ] || mkdir container
[ -f folha-de-ponto.pdf ] && rm -f folha-de-ponto.pdf

# pegando o mês e o ano
mes=`date +%B`
ano=`date +%Y`
data="$mes de $ano"

# numero de linhas
numlinhas=`awk 'END { print NR }'  lista-de-funcionarios-da-escola.csv`

clear
for ((i=1;i<=numlinhas;i++)); {
	nome=`sed -n ${i}p lista-de-funcionarios-da-escola.csv`

	# colocando os números com zeros à esquerda para que na hora de juntar os
	# pdf's eles sejam inseridos em órdem alfabética
	numero=`printf "%02d\n" $i`
	numtitulo=`printf "%03d\n" $i`

	echo "  -----------------------------------"
	echo "      gerando o arquivo-${numero} ..."
	echo "  -----------------------------------"
	echo
	echo "      Folha de Ponto de: ${nome}"

	# criando cada cópia do svg com o respectivo numero
	cat folha-de-ponto.svg > ./container/folha-de-ponto-${numero}.svg

	# e alterando o nome do funcionario
    sed -i "s/marcadornome/$nome/g" ./container/folha-de-ponto-${numero}.svg
    # colocando o número sequencial na folha de ponto
    sed -i "s/marcan/$numtitulo/g" ./container/folha-de-ponto-${numero}.svg
    # colocando o mês e o ano corretos
    sed -i "s/marcadordata/$data/g" ./container/folha-de-ponto-${numero}.svg

    # gerando os pddf's e agrupando em um só arquivo
	inkscape -f ./container/folha-de-ponto-${numero}.svg -A ./container/folha-de-ponto-${numero}.pdf >/dev/null
    gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=folha-de-ponto.pdf -dBATCH ./container//*.pdf >/dev/null
    clear
}

# apagando a pasta que foi usada para juntar os pdfs
rm -rf ./container

