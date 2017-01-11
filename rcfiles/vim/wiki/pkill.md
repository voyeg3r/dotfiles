### Introdução
O comando pkill, é uma ferramenta da família pgrep. Ele
tem a mesma função que o comando kill, porém pode enviar
sinais para um processo utilizando o nome do processo e
outros atributos.

    pkill firefox

### Matar todos os processos que não são do root

    for i in $(pgrep -v -u root);do kill -9 $i;done

Uma opção mais inteligente

    pkill -v -u root

### Matar todos os processos httpd

    pkill httpd

### Referências
* http://ivanix.wordpress.com/2009/01/17/ferramentas-que-auxiliam-na-monitoracao-de-processos/
