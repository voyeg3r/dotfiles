### Introdução
Para converter o nome dos arquivos entre as duas codificações, o comando é o convmv
A sintaxe á dada por:

convmv -t codificacao_de_saida -f codificacao_de_origem --notest nomes_dos_arquivos

Assim para converter UTF-8 para ISO-8859-1 temos:

convmv -t iso-8859-1 -f utf-8 --notest nomes_dos_arquivos


O inverso, ISO-8859-1 para UTF-8, a comando é dado por:

convmv -t utf-8 -f iso-8859-1 --notest nomes_dos_arquivos

onde //nomes_dos_arquivos// é a lista de todos os arquivos que deseja decodificar, inclusive, aceita-se asterisco.
A opção "-r" permite realizar a operação recursivamente. Esse comando é inteligente o suficiente para
não converter arquivos que estejam na codificação de destino.


find . -type f -print0 | xargs -0 -i% convmv -f UTF-8 -t ISO-8859-1 % --notest


### converter recursivamente

convmv -r -f iso8859-1 -t utf8 seu_diretório

convmv --notest -r -f iso8859-1 -t utf8 seu_diretório


### Referências
* http://jfmitre.com/2010/01/alternando-arquivos-entre-codificacoes.html
