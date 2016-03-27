#!/usr/bin/env zsh
# a good referene:
# http://manpages.ubuntu.com/manpages/dapper/man1/zsh-lovers.1.html

# esse script destina-se essencialmente a pegar os arquivos
# compactados do site do mairo vergara, remover certos padrões dos
# nomes

hash perl-rename 2>/dev/null || { echo >&2 "I require perl-rename but it's not installed. Aborting."; exit 1; }
hash detox 2>/dev/null || { echo >&2 "I require detox but it's not installed. Aborting."; exit 1; }
hash trans 2>/dev/null || { echo >&2 "I require trans but it's not installed. Aborting."; exit 1; }

# detox *
perl-rename 's/\.\././g' *
#perl-rename 's/,//g' *
for i in *(.)mp3; perl-rename 's/^\d+\s-\s//g' $i

autoload -U zmv
#zmv '[0-9]-## #(*.mp3)' '$1'
#zmv '[0-9][0-9]-## #(*.mp3)' '$1'
zmv '(*)' '${(L)1}'

for i in *(.); touch ${i:r}.txt
for i in *(.)txt; echo ${i:r} | sed 's/_/ /g' > $i
sed -i 's/\(.\)/\U\1/' *.txt
for i in *(.)txt; echo $(trans -b :pt "$(head -1 $i)") >> $i
for i in *(.)mp3; echo "[sound:${i}]" | sed 's/ /_/g'  >> ${i:r}.txt
for i in *(.)mp3; perl-rename 's/ /_/g' $i
sed -i '1,2s/$/;/g' *.txt
for i in *(.)txt; sed -i 'N;N;s/\n/ /g' $i
sed -i 's/Tem sido muito longo/faz muito tempo/g' *.txt
sed -i 's/[Tt]em sido \(\d\+)\(dias)/Faz \1 \2/g' *.txt
sed -i 's/É um longo/Faz muito/g' *.txt
#sed -i '$s/$/\n/g' *.txt
cat *.txt > deck.csv
#for i in *(.)mp3; mkdir ${i:r} && mv $i ${i:r}
#for i in *(/); mv ${i}.txt ${i}


