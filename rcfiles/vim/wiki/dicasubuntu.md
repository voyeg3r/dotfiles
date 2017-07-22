# Arquivo: dicas do ubuntu

```
Criado: Seg 10/Jan/2011 hs 16:41
Last Change: ter 10 jan 2017 13:32:19 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
```
### Changing hostiname without resarting the system
+ https://askubuntu.com/questions/87665/how-do-i-change-the-hostname-without-a-restart

    sudo hostname newname

### Setting a persistent DNS
+ https://www.xpertnotes.net/blog/2015/12/29/make-dns-stick-in-ubuntu/
+ https://itsfoss.com/easiest-watch-netflix-hulu-usa/


Edit the file /etc/resolvconf/resolv.conf.d/base

    sudo vim /etc/resolvconf/resolv.conf.d/base

Add the name servers to this

    nameserver 69.197.169.9
    nameserver 192.95.16.109

Run the following command to apply the changes.

    sudo resolvconf -u

Check the file /etc/resolv.conf to make sure the changes took place.

    cat /etc/resolv.conf

### stopping system errors report

    sudo systemctl disable apport.service

    sudo vim /etc/default/apport

    change "enabled" to zero "0"

    sudo service apport stop ; sudo sed -ibak -e '/^enabled/ s/1/0/g' /etc/default/apport

### setting abnt2 keyboard

    setxkbmap -model abnt2 -layout br

### comando para definir o brilho de forma emergencial

	xrandr --output LVDS1 --brightness 0.7

### instalando kernel 3.6

Linux Kernel 3.6.2 Installation

Open the terminal and run the following commands:

	cd /tmp

wget http://dl.dropbox.com/u/47950494/upubuntu.com/linux-kernel-3.6.2 -O linux-kernel-3.6.2

	chmod +x linux-kernel-3.6.2

	sudo sh linux-kernel-3.6.2

Reboot your system to finish the installation. To check if the kernel
is well installed, run this command:

	uname -r

To delete Kernel 3.6.2 and revert back to the previous kernel, run this command:


	sudo apt-get purge linux-image-3.6.2-030602


For any trouble encountered after upgrading to this new kernel, you
may find [1]this article helpful in case your system is unable to load
or having instability issues.

	[1] - http://www.upubuntu.com/2012/09/how-to-repair-broken-system-after.html

### impressoras brother DCP-7065DN
Site da brother http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html

Versão deb para debian e ubuntu
driver da impressora
	wget -c http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP7065DN-2.0.4-2.i386.deb

    dpkg -i --force-all *.deb

sudo apt-get install xsane sane-utils xsane-common
cd ~/Downloads
wget -c http://www.brother.com/pub/bsc/linux/dlf/brscan4-0.4.1-1.i386.deb
sudo dpkg -i --force-all brscan*
brsaneconfig4 -a name=DCP-7065DN model=DCP-7065DN nodename=`hostname`.local
# ...where drucksack is the local hostname of the printer/scanner ↑
# If you want if you want to specify your printer rather using its IP, run this instead:
# brsaneconfig4 -a name=DCP-7065DN model=DCP-7065DN ip=192.168.2.30

	Depois de instalar o driver brsane descrito acima eu
	tive problemas de permissão e tive que abrir o xsane como root
    no caso do ambiente gnome 'gksu xsane' e no caso do kde 'kdesu xsane',
    assim pude constatar que se tratava de problemas de permissão, uma vez
    constatado o problema pensei em colocar meu usuário em todos os grupos
    relacionados com impressora, administração, scanner etc, esta etapa se faz
    editando o arquivo /etc/group

	Grupos aos quais adicionei o meu usuário para
	que conseguisse imprimir com o xsane

	adm, lp, fax, scanner, lpadmin, saned


 Para saber se instalou o driver

	dpkg -l --force-all  | grep -i brother


Open a web browser and go to "http://localhost:631/printers".

    Check if the Device URI of your printer is "usb://Brother/(your printer's model name)"

### kernel otimizado

Porque rápido ainda não é o bastante

http://www.megatek.net.br/customkernels/

### instalando o libreoffice

Fonte: http://andregondim.eti.br/2011/01/libreoffice-para-ubuntu-ja-pode-ser-usado-via-ppa/

Primeiro remova o openoffice via terminal:

     sudo apt-get purge "openoffice*.*"

Insira o PPA com o comando:

     sudo add-apt-repository ppa:libreoffice/ppa

Atualize os repositórios e instale da seguinte maneira:

     sudo apt-get update; sudo apt-get install libreoffice -y

Dependendo do gerenciador de janela, faça para GNOME:

     sudo apt-get install libreoffice-gnome

### cliente p2p para iptv

# cliente p2p para iptv
# http://ubuntued.info/como-instalar-o-veetle-no-ubuntu
# http://www.veetle.com/index.php/download/instructions/player/autoStart
