### exibindo a hora a cada dois segundos

watch 'date +%H:%M:%S'

Uma simplificação do comando acima

watch 'date +%T'

A cada dois segundos mostra o tamanho da pasta atual

watch -n 2 "du -sh | awk '{print $1}'"


### Acompanhando logs


watch -n60 du /var/log/messages


### Exibindo a hora segundo a segundo

watch -n 1 -t 'date +%T'

### a cada 5 segundos exibindo a memória livre

watch -n 5 'df -m'

### monitorando alterações em um diretório

watch -d ls -l

A opção -d é que habilita o recurso de destacar
as diferenças entre cada atualização do watch
### monitorando conecções estabelecidas

watch -n 1 'netstat -tpanl | grep ESTABELECIDA'

### monitorando uma pasta em que estão sendo gravados dados

watch -n 10 'du -sh ./'

### ocultando o cabeçalho do comando watch
Use a opção -t