Local onde ficam os serviços

  ls /etc/init.d/

iniciar um serviço

  systemctrl start nignx.service
  systemctl start org.cups.cupsd.service

Enable service to start on boot time

  systemctrl enable nignx.service
  systemctrl disable nignx.service

check if service is on

  systemctrl is-enabled nignx.service

Halt the machine

  systemctrl halt
  systemctrl reboot

show system log

 journalsystemctl -f
 journalsystemctl --since=today  .......... today's logs

kill a service

  systemctrl kill nignx

other info

  hostnamectl
  timedatectl
