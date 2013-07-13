#!/bin/bash
# este script tem como proósito criar um tmpfs para melhorar o desempenho da máquina
# download: wget -c https://raw.github.com/gist/1345394 -O createtmpfs.sh && chmod +x $_


if [ "$(id -u)" != "0" ]; then
   echo "  Need be root"
   sleep 2
   exit  1
fi

clear
echo "iniciando a criação de tmpfs..."

cp /etc/fstab{,-backup} 

if ! grep tmpfs /etc/fstab &> /dev/null ; then 
	cat <<-EOF>> /etc/fstab
	tmpfs /tmp tmpfs defaults,noexec,nosuid 0 0
	tmpfs /var/tmp tmpfs defaults,noexec,nosuid 0 0
	EOF
fi 

mount -a
echo "entradas criadas"
echo "`df -h | awk '/tmpfs/ {print $6}'`"
sleep 3
clear

