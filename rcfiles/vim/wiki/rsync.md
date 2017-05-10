### Introdução
O rsync sincroniza dados via rede

Script de backup http://va.mu/XteF


``` sh
rsync -avz /origem /backup

rsync -avz /home/aluno sergio@172.30.10.234:/home/sergio/backup
```

### se quizer aumentar um pouco a segurança faça:

``` sh
rsync -avz -e ssh /home/aluno sergio@172.30.10.234:/home/sergio/backup

rsync -a --update --delete origem/ destino/
```

### Para copiar a arvore de diretorio para um host remoto use o seguinte comando:

    rsync -avz -e ssh - -delete   /dir maquinaremota:/bak/dir

      a opcao - -delete ira remover em /bak/dir arquivos não existentes em /dir


### move instead of copying

    rsync --remove-source-files /source/dir /dest/name

### rsync + find

    find . -name "whatever.*" -print0 | rsync -av --files-from=- --from0 ./ ./destination/

### backups incrementais com --link-dest
A opção "--link-dest" do rsync cria hard links para arquivos de outro
backup, os arquivos antigos não modificados são apenas linkados, em geral
se aponta para o último backup.

    --link-dest=${BACKUP-ULTIMO}

### apenas exibindo o conteúdo da origem
fonte: http://www.vivaolinux.com.br/artigos/impressora.php?codigo=338

Se você deseja listar o diretório /etc do servidor, pode usar o comando:

    $ rsync -Cravzp fabio@10.0.0.5:/etc/


O "pulo do gato" dessa situação é a omissão do diretório de destino.

### sincronizando e consertando a codificação
À partir da versão 3.0.0 do rsync há um recurso muito útil para sysadmins,
a capacidade de fazer a codificação de caracteres, ou seja, se no windows tenho
iso8859-1 e no ubuntu utf8 posso usar um parâmetro como abaixo:

    rsync --iconv=utf8,iso88591 /origem /destino

    rsync -va --iconv=utf8,iso88591 /source/latin1/ /destination/utf8

### Copie pastas mantendo sua extrutura


    rsync -vd --files-from=<(find .  -name entries -print ) .   ../target_directory


### Sincronizar mediante uma condição
Sincronizar apenas arquivos modificados em um determinado período

    rsync -avz -e ssh --files-from=<(find -mtime +30 -mtime -60) origem destino


### Opções do rsync

``` markdown
-u ou --update ............. ignora os arquivos que forem mais novos no destino
--delete ................... deleta no destino os arquivos inexistentes na origem
--bwlimit=KBPS ............. limita a banda em KBPS
-h, --human-readable ....... saida numerica em formato amigável
-p ......................... preserva permissões
-z --compress .............. compacta durante a transmissão
--exclude=PATTERN .......... exclude files matching PATTERN
-v ......................... mostra o que está acontecendo
-a ......................... o mesmo que -rlptgoD
```


Caso use

      /pasta

ele pega a pasta e seu conteúdo, já se usar:

      /pasta/

ele copia apenas o conteúdo da pasta
### Restaurando as configurações do home
* fonte: http://www.ubuntu-ac.org/archives/445

**Passo 1**
Depois que configurar tudo do usuário, copie toda a home do usuário (no meu caso é cyber) para um diretório que deseja (no meu caso /opt):

    $ sudo cp -Rv /home/cyber /opt

**Passo 2**
Adicionar o script na inicialização do sistema:

``` sh
#!/bin/bash
rsync --delete --recursive /opt/cyber /home/
chmod 775 -R /home/cyber
chown cyber:cyber -R /home/cyber/
```

No meu caso, criei um arquivo “restaura_home.sh” em /opt e adicionei a linha abaixo no arquivo

    /etc/rc.local:

/opt/restaura_home.sh
Por ser um programa recheado de opções, aconselho que leiam o manual do rsync para mais opções.

===[[http://www.andrelop.org/blog/2007/10/29/prevencao-virtual-102-usando-backups-pessoais-versionados-the-even-cheaper-way/|Prevenção virtual 102 : usando backups pessoais versionados (the even cheaper way)]]===
Fonte: [[http://www.andrelop.org/blog/2007/10/29/prevencao-virtual-102-usando-backups-pessoais-versionados-the-even-cheaper-way/|Andrelop’s personal weblog]]

Não, ao contrário do que você pensa, esse não é mais um daqueles posts
chatos que falam sobre a importância de backups, puxa suas orelhas por
você não estar em dia com eles e lhe deixa com uma sensação de estar
fazendo algo errado e de que, a qualquer momento, poderá sofrer com
isso.  Mesmo você sabendo que isso tudo é a mais pura verdade, ninguém
precisa ficar lhe lembrando sobre isso a todo momento e lhe
aporrinhando com esse assunto. Backup sempre é e sempre será
esquecido. É comum (ou, ao menos, deveria ser) não esquecermos dos
backups de nossos clientes, nossos servidores e de nossos sistemas
mais importantes, mas nossos backups pessoais sempre acabam ficando
esquecidos.  Por quê ? Simples : porque soluções que você simplesmente
coloca para funcionar uma única vez e esquece, deixando que tudo seja
feito de forma transparente, são difíceis de serem encontradas e,
quando o são, não são das mais fáceis para serem implementadas nem
compreeendidas.  Para resolver esse problema, eu escrevi um pequeno
script shell simples que uso para meus backups pessoais. Funciona de
maneira estremamente simples e me permite ter backups diários ou com
periodicidades ainda menores (diversas vezes por dia, por exemplo)
ocupando um espaço desprezível em relação ao que seria ocupado caso
backups completos fossem utilizados e, de quebra, me permite restaurar
a cópia de qualquer arquivo desejado, de uma data específica desejada,
sem que seja necessário sair por aí procurando por inúmeras fitas ou
sem que seja necessário que eu seja obrigado a usar soluções de backup
que criam catálogos de backup e que possuam um uso mais complexo.
Facilidade, esse é o objetivo. Minha solução usa o famoso
[[http://samba.anu.edu.au/rsync/|rsync]] para implementar backups
diferenciais e, mais especificamente, faz uso da opção **–link-dest**
do rsync para criar cópias posteriores dos backups utilizando
[[http://en.wikipedia.org/wiki/Hard_link|hardlinks]] para os
arquivos originais da primeira cópia do backup.  O script cria um
diretório para cada uma de suas invocações, contendo o dia, mês,
ano, hora, minuto e segundo de sua execução e inclui o backup
nesse diretório. Dessa forma, você possui uma visão completa de
todo o seu conteúdo de backup sob esse diretório representando
esse momento no tempo. Sim, o conteúdo completo, tudo, sem mais
nem menos, com a diferença de que não é a cada execução que tudo é
realmente copiado para o novo diretório criado.  Somente os
arquivos/diretórios modificados são criados e, para o restante,
somente hardlinks para os arquivos originais criados como
resultado da primeira execução do script são criados. O script
mantém um arquivo de controle para saber qual o momento no tempo
da última execução e ter uma base para saber a partir de qual
ponto deve checar por modificações em suas próximas invocações.  O
único detalhe é que, como hardlinks não funcionam entre
dispositivos (ou seja, entre partições ou discos diferentes),
todos os backups devem ser armazenados no mesmo disco ou partição
de disco. Sempre, sem fugir dessa regra para não ter uma bela
surpresa com espaço em disco astronômico sendo consumido sem
necessidade.  Se interessou ? Ok, mão na massa então. Simplesmente
copie o script postado em sua íntegra abaixo e grave-o com um nome
qualquer desejado, torne-o executável e preencha o valor das
variáveis **target**, **sources** e **lastrunfile**, ou seja, o
local onde os backups serão criados, qual o conteúdo que será alvo
de backup e qual a localizaçao do arquivo que conterá a informação
do último momento no tempo em que a última execução do backup foi
feita (ele é criado automaticamente na primeira execução do
script), respectivamente.  O conteúdo completo do script é o
seguinte :


``` sh
#!/bin/bash
# Name : versioned-backup.sh
# Author : André Luís Lopes
# Description : A simple shell script which deploys a nice
# versioned backup solution based on rsync’s
# hardlinking capability
# Version : 0.0.1
# License : GPL (General Public License) version 2
# Where’s the rsync binary
rsync=”/usr/bin/rsync”
# The miminal rsync options we absolutely want
rsyncminopts=”-az”
# Our target directory, i.e, where we are going
# to dump everything
target=”/backup/archives”
# A space separated list of directories we want to backup
sources=”/etc /home”
# The current point-in-time (pit), constructed in
# the DD-MM-YYY-HH:MM:SS format
pit=$(date +%d-%m-%Y-%H:%M:%S)
# The file which will store the point-in-time
# information about our last snapshot run
lastrunfile=”/backup/archives/lastrun”
# Ensure it works even when running for the very first
# time, as we create the target place where we are going
# to dump everything and the base directory to where we
# are going to hardlink further snapshots to
if [ ! -f $lastrunfile ] ; then
mkdir -p $target/$pit || true
echo $pit &gt; $lastrunfile
for source in $sources ; do
$rsync $rsyncminopts $source $target/$pit
done
exit 0
fi
# As we are dealing with situations where we would need to
# be able to create snapshots every second and be able to
# differentiate between them, we create our point-in-time
# target directory for the current second
mkdir -p $target/$pit
# Create the snapshot of every source directory from the
# current point-in-time into our specific point-in-time
# directory and hardlink all the files and directories which
# where not modified since the last snapshot run
for source in $sources ; do
$rsync $rsyncminopts –link-dest=$target/$(cat $lastrunfile) $source $target/$pit/
done
# Store the identification of our last run into a non-volatile
# place so we can use it on further runs
echo $pit &gt; $lastrunfile
```


Simplesmente execute o script de tempos em tempos, provavelmente agendado no
crontab de um usuário que tenha permissões de ler os arquivos que sofrerão o
backup e gravar no local onde o backup deverá ser armazenado (o root serve, mas
não necessariamente precisa ser ele). É isso. Simples e fácil. Deixe o cron, o
anacron ou seu agendador de tarefas preferido sendo executado e esqueça de suas
preocupações com backup.  Lógico que o script pode melhorar bastante. Na
verdade, tenho algumas idéias para melhorá-lo já a algum tempo, mas venho
usando essa mesma solução a alguns meses sem maiores problemas e ela vem me
atendendo bem, por isso nunca achei que fosse necessário melhorá-lo.  Funciona
tão bem que algumas pessoas na empresa onde trabalho utilizam uma versão
modificada dele, a qual eu modifiquei levemente para que o transporte ssh do
rsync fosse utilizado, de forma que eu tivesse a mesma funcionalidade, mas em
um ambiente em que o dispositivo que recebe o backup é uma partição de disco em
um servidor remoto.  A imaginação é o limite. O que achou da solução ? Gostou ?
Comente suas impressões e me deixe feliz ou profundamente triste caso minha
solução seja muito tosca

[[image:http://www.andrelop.org/blog/wp-includes/images/smilies/icon_smile.gif caption=":-)"]]

