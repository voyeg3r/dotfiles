### Introdução

    ping -c1 www.google.com  &> /dev/null && echo "rede ok" || echo rede fora

### desabilitar o ping

    sudo -s "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all"

# If you want to enable it you can use:

    sudo -s "echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all"

### pingar no gateway

ping -c 2 `route -n | awk '/UG/ {print $2}'`

### como pingar em um MAC
Primeiro descubra o MAC ADDRESS do host que deseja pingar com ifconfig na
própria máquina ou com

    arp-scan 10.1.1.0/24  # minha rede é 10.1.1.1

isto vai retornar cada IP ao lado do MAC ADDRESS, uma vez
que você tenha o MAC pode colocalo dentro de um padrão de busca no awk
como abaixo.

    ping -c 2 `arp-scan 10.1.1.0/24 | awk '/00:1b:11:dc:a9:65/ {print $1}'`

### Testar uma interface de rede

    ping -I eth0 www.yahoo.com

### identificando o SO
* fonte: http://www.dicas-l.com.br/dicas-l/20100509.php
* http://www.dicas-l.com.br/dicas-l/20100615.php
O comando ping retorna algo como:

    64 bytes from 127.0.0.1: icmp_seq=1 ttl=128 time=0.176 ms

    O campo ttl retorna:
    || ttl || 128 || windows ||
    || ttl || 64 || linux ||
    || ttl || 255 || unix ||

### Ping em um range de máquinas
veja também [[ComandoNmap]]


``` sh
#!/bin/bash
# testa hosts ativos
for((i=1; i <= 254; i++)); do
   if ! ping -qc 2 192.168.1.$i | grep "0% packet loss" ; then
      echo "192.168.1.$i não respondeu $1 " >> falhou.txt
   else
      echo "192.168.1.$i respondeu $1 " >> respondeu.txt
   fi
done
```


``` sh
#!/bin/sh
NOW=$(date +"%T %m/%d/%Y")
PING=$(ping -qc 5 example.com | grep '5 packets')
echo $NOW: $PING >> /home/matt/ping.log
exit 0
```


A opção -q do ping faz com que o comando mostre apenas
se houve ou não perda de pacotes, ou seja, a linha que mostra
o resultado efetivo.

``` sh
#!/bin/bash
LOG=~/ping.log
NOW=$(date)
OUT=$(ping -c 1 google.com | grep packets)
echo "$NOW : $OUT" >>$LOG
```

    #!/bin/bash
    nmap -sP 10.0.2.101-104 | grep up >> relatorio.txt

Outra forma de testar hosts ativos numa rede

    arp-scan -l

