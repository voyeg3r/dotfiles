### Verificar ips ativos numa subrede

arp-scan -l

arp-scan --interface=eth1 --localnet

sudo  arp-scan --interface=eth1 192.168.0.0/16

com o comando abaixo você também pode detectar conflitos de IP

    sudo arp-scan –I eth0 -l

    sudo arp-scan –I eth0 -l | uniq -D -w 15

    The uniq option using option 'w' is compares first 12
    characters of lines in file, and then using 'D' option prints all
    duplicate lines of file.


### como pingar em um MAC
Primeiro descubra o MAC ADDRESS do host que deseja pingar com ifconfig na
própria máquina ou com

arp-scan 10.1.1.0/24  #minha rede é 10.1.1.1

isto vai retornar cada IP ao lado do MAC ADDRESS, uma vez
que você tenha o MAC pode colocalo dentro de um padrão de busca no awk
como abaixo.

ping -c 2 `arp-scan 10.1.1.0/24 | awk '/00:1b:11:dc:a9:65/ {print $1}'`

### na minha rede

arp-scan 10.1.1.0/24

### ssh pelo MAC address

ssh  usuario@`arp-scan 10.1.1.0/24 | awk '/00:1b:11:dc:a9:65/ {print $1}'`

### Referências
* http://teckboard.blogspot.com/2009/08/tutorial-descobrir-ip-mac-wep-wpa.html
