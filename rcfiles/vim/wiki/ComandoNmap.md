
### uso simples

nmap localhost

verificar quais portas abertas em todos os micros

nmap 10.3.0.*

### descobrindo servidores ssh ativos na rede local

    nmap -p 22 --open -sV 192.168.0/24
    nmap -p 22 10.3.1.1/16 | grep -B 4 "open"
    nmap -p 22 --open -sV 192.168.0/24

### escaneando todas as portas
Por padrão, o Nmap escaneia apenas um conjunto de 1661 portas,
que incluem as usadas pelos serviços mais comuns. Uma media de
segurança comum é esconder serviços como o SSH em portas altas,
de forma que eles sejam mais difíceis de detectar. Nesses casos,
você pode fazer um scan completo, incluindo todas as portas TCP (ou UDP) usando a opção "-p 0-65535", como em:

# nmap -sS -p 0-65535 192.168.0.4


### opções do nmap
|| -sA || verifica a versão do programa ||
|| -sO || verifica o Sistema operacional ||
|| -sU || verifica o estado das portas ||
|| -sP || pinga ||
|| -sV || versão dos serviços ||
### manual em português
* http://ftp.iasi.roedu.net/mirrors/download.insecure.org/nmap/data/nmap_manpage-pt.html
### detectar sistema operacional

nmap -v -v -sS -O 10.3.0.0/24
nmap -sV -O -v localhost | grep "Service Info"


### Verificar hosts ativos

nmap -sP 192.168.0.0/24 | awk '/^Host/ {print $2 " ativo"}'

# também pode ser feito com arp-scan
arp-scan -l

Mostra a saida rapidamente

nmap -sP -T Insane 192.168.1.1-254


### Mostrar portas abertas e SO

nmap -sS -O -P0 -v localhost


### Listar portas abertas


nmap -p 1-65535 --open localhost


### detectando o konficker na rede
O nmap à partir da versão 4.85BETA7 detecta este virus do windows

nmap -PN -T4 -p139,445 -n -v -–script smb-check-vulns,smb-os-discovery -–script-args safe=1 [Rede_Alvo]

### escaneando portas e forjango o endereço de pesquisa

sudo nmap -sS 192.168.0.10 -D 192.168.0.2

### pegar lista de servidores com a porta 80 aberta

nmap -sT -p 80 -oG - 192.168.1.* | grep open


### Referências
* http://www.dicas-l.com.br/dicas-l/20030916.php
* http://www.dicas-l.com.br/dicas-l/20030916.php
* http://www.guiadohardware.net/dicas/usando-nmap.html
