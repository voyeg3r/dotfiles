===[[http://ligadeblogs.blogspot.com/2008/09/configurar-dns-no-ubuntulinux.html|Configurar DNS no Ubuntu/Linux]]===
### Domingo, Setembro 21
Só não é melhor que chá de mel com canela e cravo da Índia!
Obs.: Funciona apenas para quem usa IP fixo na máquina. Dúvidas aqui => [[http://www.google.com/|Google]].

1. Instale o dnsmasq
//$ sudo apt-get install dnsmasq//

2. Para receber as informações de IP via DHCP é preciso configurar o arquivo dhclient.conf:
//$ sudo gedit /etc/dhcp3/dhclient.conf//


3a. Procure a linha:
//#prepend domain-name-servers 999.999.999.999;//

3b. Use preferencialmente os endereços de IP que se encontram no canto inferior direito do site [[http://www.opendns.com/|www.opendns.com]].

3c. Remova o comentário (#):
//prepend domain-name-servers 999.999.999.999, 999.999.999.999;//

4. Confirme as alterações. Deve aparecer os números de IP que você incluiu no arquivo dhclient.conf:
//$ sudo gedit /etc/resolv.conf//

5. Reinicie o dnsmasq:
//$ sudo /etc/init.d/dnsmasq restart//

Adeus aos DNS's lentos! d=

[[http://www.guiaubuntupt.org/wiki/index.php?title=Dnsmasq|Fonte1]]
[[http://blog.welrbraga.eti.br/?p=80|Fonte2]]
[[@http://ligadeblogs.blogspot.com/2008/09/configurar-dns-no-ubuntulinux.html|Fonte3]]
[[http://www.guiadohardware.net/dicas/resolvendo-problemas-acesso-dns-local.html|guia do hardware]]
[[http://www.dicas-l.com.br/dicas-l/20060914.php|dicas-l]]