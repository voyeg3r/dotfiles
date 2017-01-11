### opções

-i : determina a interface
-p, --nopromisc : não faz uso do modo promiscuo
-z, --silent: não realiza a varredura inicial utilizando o protocolo ARP
-T, --text : imprime os dados no formato texto puro


### capturando pacotes remotos

ettercap -Tq -i eth0 -M arp:remote /192.168.1.1/ //

Let 192.168.1.1 is the gateway of our network,then all the
packets between the gateway and all the machines in the subnet
will be going through our machine (i.e we are the gateway for all the machines

### Referências
* http://lrodrigo.lncc.br/index.php/Ettercap