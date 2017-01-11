### Introdução
Mostra o uso do disco

 du -sh /home

A cada dois segundos mostra o tamanho da pasta atual

watch -n 2 "du -sh | awk '{print $1}'"

### medindo espaço apenas na pasta atual

du --max-depth=1

### exibindo os 10 maiores da pasta atual

du -s * | sort -n | tail

### Listando arquivos maiores que 3G (recusivamente - usando o find)

find . -type f -size +3G | xargs -I% du -sh %

### exibindo de forma legível

du -k * | sort -nr | cut -f2 | xargs -d '\n' du -sh

Explicando o comando acima:

du -k *  ....... exibe o conteúdo em blocos de 1000 tipo kb
sort -nr ....... ordena por número reverso
cut -f2 ........ pega o nome desta galera
xargs -d "\n" .. recebe a lista indicando o delimitador quebra de linha
du -sh ......... gran finale

Usando o awk

du | sort -r -n | awk '{split("k m g",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}'


### Referências
* http://ubuntuforums.org/showthread.php?t=885344