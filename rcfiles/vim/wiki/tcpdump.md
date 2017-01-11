### Introdução

fonte: http://www.dicas-l.com.br/dicas-l/20081014.php

pegar somente os pacotes que estão sendo enviados ou
recebidos para www.gooogle.com.br. Para isso basta utilizar
a expressão "host" seguido do "nome do host" que deseja filtrar.

tcpdump -i eth0 host www.google.com.br

Mas eu queria somente o acesso via HTTP (porta 80).
Sem problemas basta usar a expressão "host" em conjunto
com "port" utilizando o operador "and", veja como:

tcpdump -i eth0 -n host 192.168.0.1 and port 80


|| ==tcpdump: Monitorando conexões==
Autor: Leandro Nascimento Souza <leandro@minimedia.com.br>
Data: 11/04/2007 ||
|| **tcpdump: Monitorando conexões**|| O //tcpdump// é um dos mais, se não o mais "famoso" //sniffer// para sistemas GNU/[[http://www.vivaolinux.com.br/linux/|Linux]]. Com ele podemos realizar análises de redes e solucionar problemas. Sua utilização é simples e sem mistérios, bastando apenas ter os conhecimentos básicos de redes //TCP/IP//. Esta dica é apenas uma introdução deste sniffer, maiores informações e documentação à seu respeito podem ser encontradas em seu site oficial: * [[http://www.tcpdump.org/|http://www.tcpdump.org]]

A instalação do tcpdump em sistemas //Debian// é super simples, bastando executar o comando abaixo como super usuário (root):

**# apt-get install tcpdump**

Para iniciarmos a utilização do tcpdump precisamos especificar a interface de rede que queremos analisar com o parâmetro -i seguido da interface desejada, por exemplo, se quisermos analisar todo o tráfego que passa pela interface eth0, executaríamos a seguinte linha de comando:

**# tcpdump -i eth0**

Conexões de origem podem ser monitoradas utilizando o parâmetro src host, um exemplo simples seria monitorarmos o tráfego que vem de 192.168.0.9 para nosso computador, com o ip 192.168.0.2. A linha de comando ficaria da seguinte forma:

**# tcpdump -i eth0 src host 192.168.0.9**

Se quisermos monitorar as conexões especificando um host de destino, poderíamos fazê-lo com o parâmetro dst host, o exemplo abaixo mostra todo o tráfego do host 192.168.0.2 com 192.168.0.1, no caso, 192.168.0.1 é nosso gateway.

**# tcpdump -i eth0 dst host 192.168.0.1**

Com tcpdump também podemos especificar exceções com o parâmetro not host, por exemplo, em nosso servidor queremos ver todo o tráfego que se passa em sua interface, exceto o de 192.168.0.8, faríamos da seguinte forma:

**# tcpdump -i eth0 not host 192.168.0.9**

No tcpdump podemos também especificar portas de origem e destino com os comandos src port e dst port, um exemplo seria monitorarmos o tráfego destinado à porta 80 (http), para isso utilizaríamos a linha de comandos abaixo e navegaríamos em um site qualquer:

**# tcpdump -i eth0 dst port 80**

Para verificarmos o tráfego da porta de origem 32881 por exemplo, faríamos da seguinte forma:

**# tcpdump -i eth0 src port 32881**

Muitas opções avançadas podem ser obtidas com o tcpdump, essas são algumas opções básicas, porém fundamentais para quem quer aprender sobre sniffers. || ||
|| __http://www.vivaolinux.com.br/dica/tcpdump-Monitorando-conexoes__ ||