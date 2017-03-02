### Introdução

### Adicionando rotas permanentes no linux
fonte: http://ubuntuforums.org/showthread.php?p=217263

``` sh
sudo vi /etc/network/interfaces
up route add -net 192.168.0.0 netmask 255.255.0.0 gw 10.0.0.1 dev eth0
sudo /etc/init.d/networking restart
```



### route no windows

``` sh
route -p add 172.17.0.0 mask 255.255.0.0 172.30.34.150
route -p add 172.19.0.0 mask 255.255.0.0 172.30.34.150
```

Despois configurei as máquinas para o nosso gateway (proxy)

    172.30.39.157

Se os usuários tentarem configurar outro proxy, por exemplo

    172.19.1.10

ele vai dar erro de DNS, ou seja a criança não navega!

### Default gateway
The command below shows your default gateway on Linux

    route -n | awk '/UG/ {print $2}'
