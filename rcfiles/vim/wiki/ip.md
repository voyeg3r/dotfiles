### Introdução
O ip é utilizado para atribuir endereços IP para as interfaces de rede, mostrar configuração do TCP/IP, entre outras coisas.

O comando abaixo mostra as rotas ativas

# adicionar rota
ip route add to 0.0.0.0/0 via 192.168.1.1
ip route show



ip addr show


### Mostrar o gateway padrão

ip route list | awk '/default/ {print $3}'


