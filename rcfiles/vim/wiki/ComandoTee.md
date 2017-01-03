##Introdução
O comando tee permite que a saída de um comando
seja gravada em um arquivo ao mesmo tempo em que
é exibida na tela.

echo "deb http://packages.medibuntu.org/ hardy free non-free" | sudo tee -a /etc/apt/sources.list

No caso acima estamos mostrando na tela:

deb http://packages.medibuntu.org/ hardy free non-free

Ao mesmo tempo em que estamos enviando o mesmo conteúdo para o final
do arquivo

/etc/apt/sources.list

##Gravando a saida padrão e os erros em um arquivo de log
A solução abaixo é especialmente útil para scripts em que você
não pode estar acompanhando o tempo todo, daí você gera um log,
mas se tiver tempo pode ver o que acontece na hora.

comando 2>&1 | tee -a log.txt
bash -x test.sh 2>&1 | tee out.test

##enviando uma saida para varios arquivos de uma vez

source: http://stackoverflow.com/questions/34678428/

echo "What you want the files to contain." | tee filename{1..10}.txt


##Gravando logs dos comandos digitados
* fonte: http://www.vivaolinux.com.br/dica/Gravando-logs-dos-comandos-digitados
Para gravar log de comandos ou processos, se você esqueceu de
configurar o terminal para mais de 200 linhas, digite os seguintes
comandos:

$ script | tee /dev/pts/[n]


Onde [n] é o número de outro terminal onde você quer ver os comandos rolarem.

Automaticamente é gerado um arquivo chamado typescript no diretório
onde foi executado o comando. Aí basta abrir o arquivo e lá estará
todo o log e saídas do terminal em que você trabalhou.

##Referências
* http://www.zago.eti.br/log.html
