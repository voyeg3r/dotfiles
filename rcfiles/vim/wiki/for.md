### Introdução

 Loop for, used to perform repetitive tasks

### creating many folders

    for ((i=1;i<=7;i++)){
        mkdir $(printf "%03d\n" $i)
    }

 This code will create folders 001 002.. 007

We can also create folders this way

     mkdir -p {001..007}

### Multiplication table

source: http://www.commandlinefu.com/commands/matching/multiplication-table/bXVsdGlwbGljYXRpb24gdGFibGU=/sort-by-votes

for y in {1..10}; do for x in {1..10}; do echo -n "| $x*$y=$((y*x)) "; done; echo; done|column -t


Um exemplo para substituir 02 por 03

for i in *02*; do echo mv ${i} ${i/02/03}; done


### fazer download de um range de arquivos

for ((i=1; i<67; i++)) do wget http://www.phrack.org/archives/tgz/phrack${i}.tar.gz -q; done

$ for i in {1..4}; do echo "i vale $i"; done

    i vale 1
    i vale 2
    i vale 3
    i vale 4

$ for i in {1..4}; do echo "i vale $i"; done

    i vale 1
    i vale 2
    i vale 3
    i vale 4

$ mkdir -p diretorio{a..c}/sub-diretorio{w..z}


