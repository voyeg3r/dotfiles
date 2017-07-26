### Introdução
Comando usado para exibir as linhas finais de um arquivo qualquer

    tail -n 100 /etc/passwd

Uma flag muito útil, é a flag "-f", que permite a visualização
dinâmica de um arquivo, ou seja, as linhas são exibidas na tela na
medida em que são geradas. Esta facilidade é particularmente
interessante quando se faz a compilação de um software redirecionando
a saída para um arquivo. Através do comando tail pode-se acompanhar
toda a compilação ao mesmo tempo em que as informações são gravadas em
um arquivo:

    tail -f /var/log/squid/access.log | awk '{print $3,$7}'

### Remove first two lines

    tail -n +3 file

### monitorar log via rede

    tail -f error_log | nc -l 1234


### Imprimir da segunda linha em diante

    cat /etc/passwd | tail -n +2


