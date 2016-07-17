#!/usr/bin/env zsh
# a good referene:
# http://manpages.ubuntu.com/manpages/dapper/man1/zsh-lovers.1.html
# Este programa segue os termos da licença GPLv3
# autor: Sergio Luiz Araujo Silva
# site: http://vivaotux.blogspot.com

# esse script destina-se essencialmente a pegar os arquivos
# compactados do site do mairo vergara, remover certos padrões dos
# nomes e criar um arquivo CSV para poder importar todos os
# cartões de um pacote zipado numa só tacada, ou quase...

# pra rodar descompacte o pacote zip, entre na pasta e rode o
# script (não esqueça de dar permissão de execução).

# PROGRAMAS NECESÁRIOS:
# zsh, pois alguns comandos são específicos desse shell
# perl-rename, por ser mais eficiente que o rename que vem no meu  Antergos linux
# trans, programinha para traduzir as frases
# cheguei a usar o detox mas atualmente a linha está comentada

hash perl-rename 2>/dev/null || { echo >&2 "I require perl-rename but it's not installed. Aborting."; exit 1; }
hash detox 2>/dev/null || { echo >&2 "I require detox but it's not installed. Aborting."; exit 1; }
hash trans 2>/dev/null || { echo >&2 "I require trans but it's not installed. Aborting."; exit 1; }

find -name "*MairoVergara*" -print0 | xargs -0 rm -f

perl-rename 's/\.\././g' *

# remove digits from the begining
for i in *(.)mp3; perl-rename 's/^\d+-//g' $i

autoload -U zmv
# substitui as duas linhas seguintes pelo perl-rename
#zmv '[0-9]-## #(*.mp3)' '$1'
#zmv '[0-9][0-9]-## #(*.mp3)' '$1'
zmv '(*)' '${(L)1}'

for i in *(.); touch ${i:r}.txt
for i in *(.)txt; echo ${i:r} | sed 's/_/ /g' > $i
for i in *(.)txt; echo ${i:r} | sed 's/-/ /g' > $i
sed -i 's/\(.\)/\U\1/' *.txt
for i in *(.)mp3; echo "[sound:${i}]" | sed 's/ /_/g'  >> ${i:r}.txt
for i in *(.)txt; echo $(trans -b :pt "$(head -1 $i)")'.' >> $i
for i in *(.)mp3; perl-rename 's/ /_/g' $i
sed -i '2s/$/;/g' *.txt
for i in *(.)txt; sed -i 'N;N;s/\n/ /g' $i
for i in *(.)txt; sed -i 's/\s\[/.[/g' $i

# sed -i 's/Tem sido muito longo/faz muito tempo/g' *.txt
# sed -i 's/Tem sido muito/faz muito/g' *.txt
# sed -i 's/[Tt]em sido \(\d\+)\(dias)/Faz \1 \2/g' *.txt
# sed -i 's/É um longo/Faz muito/g' *.txt
cat *.txt > deck.csv


