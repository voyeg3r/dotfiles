### Mostrar processos que consomem mais memória

    ps aux | sort -nk +4 | tail

    # Will show the first 10 processes which use
    # the most memory, using ascendant sorting. Alternately:

    ps aux | sort -nrk 4 | head

A explicação do comando acima é simples:
O comando "ps aux" exibe todos os processos de todos os usuários, o comando sort está ordenando numericamente "n" mostrando a coluna 4 "k 4" e entrega a saida para o comando tail, que exibe os 10 primeiros.

### listar usuario memória e cpu

    ps aux --sort=%mem,%cpu

### listar os comandos que mais consomem memória

    ps -A --sort -rss -o comm,pmem,rss | head -n 6


