#!/bin/bash

# corrigir o resolv.conf da maquina remota
echo "digite o ip desejado"
IP=$(dialog --stdout \
	--title "OpenDNS" \
	--inputbox "Digite o IP desejado" \
	0 0 )
ssh root@$IP "sed -i \
'/^# *prepend/s/^#//g; \
s/127.*/208.67.222.222,208.67.220.220;/g' \
/etc/dhcp3/dhclient.conf"
