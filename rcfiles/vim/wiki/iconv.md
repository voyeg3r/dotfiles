### Introdução

O comando iconv converte a codificação de caracteres de arquivos,
por exemplo: a codificação ISO-8859-15 exibe acentos corretamente no windows
mas no Linux costuma exibir caracteres estranhos, sendo utf-8 o padrão para este
sistema

    iconv -f ISO-8859-1 -t UTF-8 < frozen.pob.srt-backup > output.txt

    find -type f -maxdepth 1 | xargs -i iconv -f iso-8859-1 -t utf-8 {} -o {}

OBS: se o arquivo já é utf-8 e rodarmos a conversão para utf-8 pode
dar erro, daí podemos fazer um teste


``` sh
d2u (){
    if (( ! $# )); then
        echo "Usage: $0:t input-dosfile output-unixfile"
        return 1
    fi

    CODIFICATION="`file -bi "$1" | awk -F"=" '{print $NF}'`"
    [[ "$CODIFICATION" != "utf-8" ]]  && iconv -f $CODIFICATION -t UTF-8 "$1" > "${1}.changed"

    sed -i 's/\x0D$//' "${1}.changed"
}
```



for i in `find . ; do
  novonome=$(echo "$i" | iconv -f iso-8859-1 -t utf-8)

  if [ "$novonome" != "$i" ]; then
        echo "   Modificando \"$i\" para \"$novonome\"..."
	mv "$i" "$novonome"
   fi
done


### alias para o bashrc
dica do Mitre: http://jfmitre.com/2006/05/convertendo-arquivos-utf-8-em-iso-8859.html

alias iso2utf='iconv -f iso-8859-1 -t utf-8'
alias utf2iso='iconv -f utf-8 -t iso-8859-1'

iconv -f UTF-8 -t ISO-8859-15 in.txt > out.txt


### script para converter todos os arquivos de uma pasta

#!/bin/bash
# 04/07/2007
# por Marcelo Oliveira - www.iboletim.com.br
# Licença de uso: GPL

# uso: ###################################
# utf2iso.sh diretorio-a-ser-convertido
##########################################

# fecha se nao for fornecido nenhum argumento
if [ $# -eq 0 ]
then
	echo "ERRO: especifique o nome da pasta com os arquivos a serem convertidos!"
	echo "Uso: ./utf2iso.sh diretorio-a-ser-convertido"
	exit 1

fi

# cria diretorio para armazenar arquivos convertidos
cp -R $1 iso-8859-1

# acessa diretorio com os arquivos a serem convertidos
cd $1

# cria lista de todos os arquivos que serao convertidos (estou excluindo .gif e .jpg)
lista=`find -type f | grep -v gif | grep -v jpg`

# executa conversao
for i in $lista
do
	echo "convertendo... $i"
	iconv -f utf-8 -t iso-8859-1 $i > ../iso-8859-1/$i;
	#read; # para verificar as mensagens de erro
done

if [ $? == 0 ]
then
	echo -e "\nConversao terminada com sucesso!\n"
fi

vim: ft=markdown
