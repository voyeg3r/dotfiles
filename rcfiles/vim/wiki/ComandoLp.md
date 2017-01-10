Arquivo: dicas do comando lp
Criado: Qui 11/Out/2012 hs 15:51
Last Change: dom 08 jan 2017 12:03:00 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r  gmail.com>

### como enviar um echo para a impressora via linha de comandos

	echo "um teste" | lp -d Brother_DCP-7065DN

If you normally use a particular printer, you can tell CUPS to use it by default using the lpoptions(1) command:

	lpoptions -d printer

### como limpar o spool de impressao

	sudo service cups stop
	sudo rm -rf /var/spool/cups/*
	sudo service cups start

### instalando a impressora brother

sudo apt-fast install brother*

# SCANNING
sudo apt-get install xsane sane-utils xsane-common
cd ~/Downloads
# wget http://pub.brother.com/pub/com/bsc/linux/dlf/brscan4-0.3.0-2.amd64.deb
wget http://www.brother.com/pub/bsc/linux/dlf/brscan4-0.4.1-3.i386.deb
sudo dpkg -i brscan4-0.4.1-3.i386.deb
sudo cp /usr/lib/sane/libsane-brother4.so.1.0.7 /usr/lib/sane/
sudo cp /usr/lib/sane/libsane-brother4.so /usr/lib/sane/
sudo cp /usr/lib/sane/libsane-brother4.so.1 /usr/lib/sane/
brsaneconfig4 -a name=DCP-7065DN model=DCP-7065DN nodename=`hostname`.local
# ...where drucksack is the local hostname of the printer/scanner ↑
# If you want if you want to specify your printer rather using its IP, run this instead:
# brsaneconfig4 -a name=DCP-7065DN model=DCP-7065DN ip=192.168.2.30

### PRINTING

sudo apt-get install cups csh lib32stdc++6
sudo mkdir /var/spool/lpd
sudo mkdir -p /usr/lib/cups/filter
sudo mkdir /usr/share/cups/model
sudo mkdir -p /usr/lib/cups/filter
cd ~/Downloads
wget http://pub.brother.com/pub/com/bsc/linux/dlf/dcp7065dnlpr-2.1.0-1.i386.deb
wget http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperDCP7065DN-2.0.4-2.i386.deb
sudo dpkg -i dcp7065dnlpr-2.1.0-1.i386.deb
sudo dpkg -i cupswrapperDCP7065DN-2.0.4-2.i386.deb
sudo cp /usr/lib/libbr* /usr/lib32/
sudo cp /usr/lib/cups/filter/brlpdwrapper* /usr/lib64/cups/filter
sudo cp /usr/lib/cups/filter/brlpdwrapper* /usr/lib/cups/filter

