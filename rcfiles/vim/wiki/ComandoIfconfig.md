Arquivo: ifconfig.wiki
Criado: Sun 18/Jan/2015 hs 09:41
Last Change: dom 08 jan 2017 12:02:57 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r  gmail.com>

### ifconfig
Configura a interface de rede no caso de ip fixo - veja também [[ethtool]]

   ifconfig eth0 172.30.10.116 netmask 255.255.255.0 up

### como forçar a placa de rede para full duplex

# instale o programa ethtool
iface eth0 inet static
    #pre-up /usr/sbin/ethtool -s $IFACE speed 1000 duplex full autoneg off
    pre-up ethtool -s eth0 autoneg off 100 duplex full
    address 123.456.789.123
    netmask 255.255.255.0
    gateway 123.456.789.254

### configurando a placa de rede sem fio

auto wlan0
iface wlan0 inet static
    address 10.3.254.236
    netmask 255.255.255.0
    gateway 10.3.254.1
    wireless-essid nome-da-rede
    wireless-key s:senha

### como fazer com que sua placa de rede sempre seja atrelada a um mesmo ALIAS
* http://brfedora.wordpress.com/2008/06/04/placa-de-rede-ordenacao/

### listar interfaces ativas

ls /sys/class/net
ls -l /sys/class/net  | awk '/eth/ {print $8}' #eth0 ou eth1?

### como colocar dois ips na mesma interface

    auto eth0
    iface eth0 inet static
    address 10.0.0.5  #ip da rede
    netmask 255.255.254.0 #mascara de rede
    network 10.0.0.0 #endereço da rede
    broadcast 10.0.1.255 #endereço de broadcast
    gateway 10.0.0.1 #gateway da rede

    auto eth0:1
    iface eth0:1 inet static
    name Ethernet alias LAN card
    address 192.168.16.2
    netmask 255.255.255.0
    network 192.168.16.0
    broadcast 192.168.16.255
    gateway 192.168.16.1 #gateway da rede


   # outro exemplo bacana
   # Create an IP alias from CLI
        /sbin/ifconfig eth0:1 192.168.3.33

### Fixing NetworkManager DNS issue in Ubuntu (Hardy Heron/Gutsy)

Using NetworkManager to change your <span class="caps">DNS</span> to custom servers,
like OpenDNS, does not seem to stay between reboots.
To fix this, edit the /etc/dhcp3/dhclient.conf file. In there, you
will see a line similar to:

[[request]] subnet-mask, broadcast-address, time-offset, routers,
    domain-name, domain-name-servers, host-name,
    netbios-name-servers, netbios-scope;

First of all, Remove domain-name-servers from that list.
Second, add a line to set your custom <span class="caps">DNS</span> servers. For OpenDNS, you would do:

prepend domain-name-servers 208.67.222.222,208.67.220.220;

**Update**: That doesn’t seem to always work. Easier way out would be to edit /etc/resolv.conf
and add your <span class="caps">DNS</span> records like this:

nameserver 208.67.222.222
nameserver 208.67.220.220

Then run sudo chattr +i /etc/resolv.conf to stop NetworkManager from overwriting the file.
Your settings should now stay between restarts.

###[[http://under-linux.org/b1153-melhorando-performance-de-transferencia-de-grandes-arquivos-no-linux-jumbo-frame|transferência de grandes arquivos no linux]]
link: http://under-linux.org/b1153-melhorando-performance-de-transferencia-de-grandes-arquivos-no-linux-jumbo-frame

###[[http://jamesmcdonald.id.au/gnu-linux/delete-a-pppoe-connection-in-ubuntu|Delete a pppoe connection in Ubuntu]]

I swapped from a bridge adsl modem setup (the connection is defined
and terminates as ppp0 on my Linux box) to a ADSL Router setup where
the username and password is in the ADSL Router itself.  The problem
was that my Linux box still had the pppoe connection defined and
started on boot. I used pppoeconf to configure it but there didn’t
seem to be an option in pppoeconf to delete it once configured.

The fix is open /etc/network/interfaces and comment out the entry as shown
auto lo
iface lo inet loopback
# auto dsl-provider
# iface dsl-provider inet ppp
# pre-up /sbin/ifconfig eth0 up # line maintained by pppoeconf
# provider dsl-provider
iface eth0 inet static
address 10.244.139.25
netmask 255.255.255.0
gateway 10.244.139.253
auto eth0

### Adicionando rotas permanentes no linux
fonte: [[http://ubuntuforums.org/showthread.php?p=217263]]

<span class="kw2">sudo vi</span> <span class="sy0">/</span>etc<span class="sy0">/</span>network<span class="sy0">/</span>interfaces
up route add <span class="re5">-net</span> 192.168.0.0 netmask 255.255.0.0 gw 10.0.0.1 dev eth0
<span class="kw2">sudo</span> <span class="sy0">/</span>etc<span class="sy0">/</span>init.d<span class="sy0">/</span>networking restart

### adicionar rotas
no arquivo /etc/network/interfaces as seguintes linhas:

  post-up route add -net 192.168.0.0/16 gw 192.168.10.1
  post-up route add -net 10.100.0.0/16 gw 192.168.10.10

  post-up route add -net 201.30.191.160 netmask 255.255.255.240 gw 172.16.1.252

### adicionar rotas II
fonte: [[http://groups.google.com/group/linux.debian.user.portuguese/browse_thread/thread/7ffbb5d8e1bb9384/46a5fafac46b7fd4?lnk=raot&pli=1&utoken=EH1KJT8AAAD-4m7bW_nhUf_RRJzb_a9wA697SM0dPD_kwQYDpXyIX_6hTrTheTunk332uxAYrjoLpOIi6wef5w0h5JGZ18wY|linux.debian.user.portuguese]]

Eu costumo configurar minhas rotas estáticas em arquivos separados por
cada interface, que são "chamados" durante a inicialização de cada
interface que necessite de rota(s) estática(s). Por exemplo, digamos que
seja necessário adicionar uma rota para a rede 10.0.0.0/8 cujo gateway é
o host 192.168.30.234, e minha interface conectada à rede 192.168.30 é a
eth0:

---- CORTE AQUI ----
# cd /etc/network/
# mkdir routes; cd routes
# touch eth0; chmod +x eth0
# vi eth0
--
#!/bin/bash
/sbin/route add -net 10.0.0.0 netmask 255.0.0.0 gw 192.168.30.234
--

# vi /etc/network/interfaces
###> INSIRA A SEGUINTE LINHA NA CONFIGURAÇÃO DA INTERFACE eth0 <
up /etc/network/routes/eth0

# /etc/init.d/networking restart

---- CORTE AQUI ----

Quando a interface eth0 "subir", o script /etc/network/routes/eth0 será
acionado, adicionando a rota no sistema. Não é necessário (neste caso)
adicionar um script para remover as regras, pois quando a própria
interface é "derrubada", o kernel cuida de remover as rotas.

--
Marcos S. Trazzini <mstrazzini - gm

### Dns Velox
Edite o arquivo /etc/resolv.conf

nameserver 200.165.132.155
nameserver 200.165.132.148

ifconfig eth0:0 172.16.0.1

criará uma nova interface chamada eth0:0 que passará a responder
pelo IP 172.6.0.1. É permitido o uso de nomes para especificar a
interface virtual, como: eth0:rede1, eth0:rede2, eth0:escritório.

Adicionando o segundo endereço:

# ifconfig eth0:1 10.0.0.5 netmask 255.255.255.0 up

Q. I am using Ubuntu Linux and I would like to
know how to create alias for eth0 so that I can
have multiple IP address?

A. To create alias for eth0 use ifconfig command.
It is use to configure a network interface and aliases.

Assuming that your eth0 IP is 192.168.1.10 and you
would like to create an alias eth0:0 with IP
192.168.1.11. Type the following command:

sudo ifconfig eth0:0 192.168.1.11 up

OR

sudo /sbin/ifconfig eth0:0 192.168.1.11 up

Verify that alias is up and running using following two command(s):

/sbin/ifconfig
ping 192.168.1.11
ping your-getway-ip
Permanent configuration

Your ethernet configuration is located in a file
called /etc/network/interfaces. If you reboot system
you will lost your alias. To make it permanent you
need to add it network configuration file:

gksudo gedit /etc/network/interfaces

OR

sudo vi /etc/network/interfaces

Append the following configuration:

auto eth0:0
iface eth0:0 inet static
name Ethernet alias LAN card
address 192.168.1.11
netmask 255.255.255.0
broadcast 192.168.1.255
network 192.168.1.0

Save the file and restart system or restart the network:

sudo /etc/init.d/networking restart

### get external ip

curl ifconfig.me

### como pegar seu ip atual

ifconfig eth0 | awk '/inet addr/ {print $2}

Please note that you can also use graphical
tools located at System > Administration >
Networking menu. Or use the following GUI tool
to setup aliases, hostname, dns settings etc:

sudo network-admin

If you want more network aliases,
use eth0:1, eth0:2, eth0:N (max upto 254).

### forjando o mac address

ifconfig wlan0 hw ether 00:11:D8:76:59:2E

### eth0 virou eth1?!
[[@http://hamacker.santhanna.net/?p=1944|fixando as placas de rede]]
**/etc/udev/udev.d/XXpersistent-net.rules** este arquivo seta a placa pelo mac

### veja também como pegar seu ip externo usando o html2text combinado com o grep
[[html2text]]

### calculando subredes no linux
* http://www.cyberciti.biz/faq/linux-subnet-calculator-cidr/

===Fixar nome da placa de rede Debian==
fonte: http://zonebin.blogspot.com/2010/09/fixar-nome-da-placa-de-rede-debian.html

Quando vamos configurar um servidor, é muito comum utilizarmos mais de uma placa de rede :) , isso facilita muito a configuralçao de firewall, porem existe um bug na distro Debian e derivadas, que apos o reset do sistema, as placas trocam de nome , ou seja, a eth0 vira a eth1, e a eth1 a eth0, e como consequencia, a rede nao funciona, ja que as regras do firewall foram para lugares diferentes

Como resolver?

existe um aplicativo que se chama ifrename voce pode fazer o download dele aqui

http://packages.debian.org/unstable/net/ifrename

ou instala-lo por linha de comando

# apt-get install ifrename

após a instalação edite o arquivo de configuração do aplicativo

# vi /etc/iftab

para configura-lo é bem simples
exemplo:

eth0 mac endereço-mac-da-placa
eth1 mac endereço-mac-da-placa

pronto, não ira mais ocorrer essa troca de nomes...so uma observação :mrgreen:

Esse bug afeta apenas algumas distribuições, então, nao se
preocupe ate perceber que esta usando uma distro afetada 8)

### gerar um mac address randomico

openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'

### Referências
* http://www.guiadohardware.net/artigos/compartilhar-placa/
* http://www.cyberciti.biz/tips/ubuntu-linux-creating-ethernet-alias-for-eth0-network-device.html
* http://www.gdhpress.com.br/redeseservidores/leia/index.php?p=cap4-8
* http://cavepopo.hd.free.fr/wordpress/bash/bash-scripts-examples/
