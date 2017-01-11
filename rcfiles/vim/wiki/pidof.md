### Introdução
fonte: http://ivanix.wordpress.com/2009/01/17/ferramentas-que-auxiliam-na-monitoracao-de-processos/

O comando pidof, assim como o comando pgrep, localiza o ID de um processo. A
diferença entre esses dois comandos, é que o pidof somente localiza o PID do
processo através do nome; já o comando pgrep, além de localizar o PID pelo
nome, também localiza por outros atributos, como usuário, por exemplo.

### Exemplo do comando pidof:

    pidof cron
    2775

### Pode-se matar um programa assim:

    kill -9 `pidof firefox`

### Usando o [[pkill]] é mais prático

    pkill firefox-bin

### testando se um programa está rodando

``` sh
if ! pidof program; then
    echo "program not found"
fi
```

    outro modo

    [ -z `pidof firefox-bin` ] || echo "firefox rodando"

