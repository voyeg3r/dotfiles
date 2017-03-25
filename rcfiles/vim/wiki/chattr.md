### Introdução
Uma utilização possível para este comando é
evitar que o sistema perca tempo gravando tempo de acesso
aos arquivos do squid, uma vez que o mesmo já faz isto.

    chattr -R +A /var/spool/squid

### tornando um arquivo imutavel até para o root

    sudo chattr +i <file>

Para reverter o atributo troque o sinal por '-'



