Arquivo: ethtool
Criado: Sun 18/Jan/2015 hs 09:50
Last Change: dom 08 jan 2017 12:02:51 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r  gmail.com>


### speed up the Ethernet

    sudo ethtool -s eth0 speed 100 duplex full

### como forçar a placa de rede para full duplex


# instale o programa ethtool

    iface eth0 inet static
    #pre-up /usr/sbin/ethtool -s $IFACE speed 1000 duplex full autoneg off
    pre-up /usr/sbin/ethtool -s $IFACE autoneg off 100 duplex full
    address 123.456.789.123
    netmask 255.255.255.0
    gateway 123.456.789.254


<span style="display: block; text-align: JUSTIFY;"> Para verificar o uso do modo full-duplex no Windows, acesse as propriedades da conexão de rede e clicar em
"configurar" para abrir a janela de opções da placa de rede. Você encontrará a opção com o
modo de transferência da placa de rede na sessão "Avançado":
Fonte: [[@http://www.gdhpress.com.br/redes/leia/index.php?p=cap1-10]]
</span>
<span style="display: block; text-align: CENTER;">[[image:http://www.gdhpress.com.br/redes/leia/cap1-10_html_78acedb5.png align="left"]]</span>
