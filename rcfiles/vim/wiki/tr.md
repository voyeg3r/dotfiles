### Introdução
O comando tr faz troca de caracteres

 tr 'A-Z' 'a-z' <<< "CASA"

 ==Remover pontuação - remove punctuation ==

    tr -d '[:punct:]'

### Remover ^M

tr -d "\n\r" < arquivo.velho > arquivo.novo

### exibindo o $PATH de forma mais legível

tr ":" "\n" <<<$PATH

### Extraindo números negativos de um arquivo

cat file.txt
-5232,-92338,84545,34
-2233,25644,23233,2
6211,-1212,4343,43
-2434,621171,9121,-33

tr ',' '\n' < file.txt | grep ^-
Output:
-5232
-92338
-2233
-1212
-2434
-33


