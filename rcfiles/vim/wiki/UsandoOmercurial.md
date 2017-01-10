[[=Manual]] do Mercurial=

Arquivo: Como usar o mercurial ( controle de versões )
Criado: Qua 03/Nov/2010 hs 21:54
Last Change: dom 08 jan 2017 12:03:35 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r

Meu usuário no bitbucket é 'sergio'

### Referência:
http://mercurial.selenic.com/wiki/QuickStartPtBr
http://hgbook.red-bean.com/read/mercurial-in-daily-use.html

Meu repositorio de arquivos do vim
https://bitbucket.org/sergio/vimfiles

Um manual sobre como colocar sobre controle de versões a pasta home
http://pyverted.com/version-control/using-mercurial-on-your-home-directory/2009/08/

### Instalando

    sudo apt-get -y mercurial

### Configurando

Arquivos de Configuração

    O Mercurial lê dados de configuração de váris arquivos, se existirem.
    Abaixo listamos os arquivos mais específicos primeiro.

    No Unix, estes arquivos são lidos:

    - "<repo>/.hg/hgrc"
    - "$HOME/.hgrc"
    - "/etc/mercurial/hgrc"
    - "/etc/mercurial/hgrc.d/*.rc"
    - "<install-root>/etc/mercurial/hgrc"
    - "<install-root>/etc/mercurial/hgrc.d/*.rc"

    Se houver um arquivo de configuração de repositório que não tenha como
    dono o usuário ativo, o Mercurial avisará que o arquivo é ignorado:

      não confiando em arquivo <repo>/.hg/hgrc de usuário não confiável USUÁRIO, grupo GRUPO

    Este aviso pode ser silenciado (o arquivo ainda seria ignorado) ou você
    pode especificar que confia no conteúdo desse arquivo. Use uma das
    definições seguintes, a sintaxe é explicada em seguida:

    - "ui.report_untrusted = False"
    - "trusted.users = USER"
    - "trusted.groups = GROUP"

    Os arquivos de configuração do Mercurial usam um simples formato ini. Um
    arquivo de configuração consiste de seções iniciadas por um cabeçalho
    "[seção]" seguidas por entradas "nome = valor":

      [ui]
      username = Primeironome Sobrenome <primeironome.sobrenome@exemplo.net>
      verbose = True

    As entradas acima são referidas como "ui.username" e "ui.verbose",
    respectivamente. Por favor veja a página de manual hgrc para uma
    descrição completa dos possíveis valores de configuração:

    - em sistemas semelhantes ao Unix: "man hgrc"
    - na Internet: http://www.selenic.com/mercurial/hgrc.5.html

    [ui]
    ssh = ssh -i ~/.ssh/id_rsa.pub -C
    username = sergio silva <voyeg3r@gmail.com>
    editor = vim
    [paths]
    default = ssh://hg@bitbucket.org/sergio/vimfiles

### Iniciando o repositório

    cd repositorio

    hg init

    hg add .

    faça as alterações

### fazendo o primeiro commit

    hg ci -m "mensagem do primeiro commit"

    hg push ssh://hg@bitbucket.org/usuario/projeto

    NOTA: PARA DIGITAR NOVAMENTE O COMANDO PUSH COM TODOS OS PARÂMETROS
    US O REVERSE-SEARCH DO BASH DIGITANDO CTRL-R SEGUIDO DO NOME 'PUSH' SEM
    ASPAS

    # arquivo ~/.hgrc
    # referência sobre erro no certificado
    # http://kiln.stackexchange.com/questions/2816/

        HashKnownHosts no
        Compression yes
        #GSSAPITrustDNS yes
        VerifyHostKeyDNS yes # esta opção habilita a busca por nomes no DNS local


		[http_proxy]
		host = http://192.168.1.11:8080/
		[web]
		cacerts = /etc/ssl/certs/ca-certificates.crt
		[ui]
		ssh = ssh -i ~/.ssh/id_rsa.pub -C
		username = sergio araujo <voyeg3r@gmail.com>
		editor = vim
		[paths]
		default = ssh://hg@bitbucket.org/sergio/vimfiles




### Mais sobre o commit

    $ hg commit

Ao chamar o commit o mercurial te leva a um editor de texto para que você possa
escrever uma mensagem descrevendo o commit. Além de escrever a mensagem você
também pode ver mais algumas informações deste commit.

    Adding a new test on ftp module

    HG: Enter commit message. Lines beginning with 'HG:' are removed.
    HG: Leave message empty to abort commit.
    HG: --
    HG: user: Hugo Doria
    HG: branch 'default'
    HG: changed hntool/modules/ftp.py

Se preferir, você pode fazer o commit e passar a mensagem no mesmo comando usando a opção "-m":

    $ hg commit -m "Adding a new test on ftp module"


Para saber qual a atual versão do repositório clonado use:

    $ hg parents


Uma outra forma de obter informações sobre o último
changeset é usando o tip:

    $ hg tip

### Para acompanhar todos os commits

  hg log

### revertendo mudanças

   hg revert -a

   -a --all                 se parâmetros não forem fornecidos, reverte todas as mudanças
   -d --date DATA           revisão mais recente que casa com a data
   -r --rev REV             reverte para a revisão especificada
   --no-backup              não grava backups de arquivos
   -I --include PADRÃO [+]  inclui nomes que casem com os padrões fornecidos
   -X --exclude PADRÃO [+]  exclui nomes que casem com os padrões fornecidos
   -n --dry-run             não realiza ações, apenas imprime a saída

   Para reverter as mudanças em apenas um arquivo

   hg revert file

   Revertendo uma mudança para a qual se tenha feito commit

   hg rollback


   para saber qual a revisão atual digite

   hg tip

   sabendo então qual a revisão pode indicar revisões anteriores

   hg up -r 578


### ver as diferenças entre cada commit

 Como saber em que revisão estamos no projeto?

 hg tip

 Como comparar duas revisões?

  hg diff -r 383 -r 384

  O comando acima mostra as diferenças entre duas versões

===limpando o repositório após um revert===

Caso usemos o comando 'revert' podemos e esqueçamos de usar
--no-backup podemos limpar os arquivos.orig com

   hg clean

Ao usar o comando revert podemos mandar ignorar o backup

    hg revert --no-backup filename.java

### quando você pede um status ao mercurial

hg status  ...... ele retorna algo assim:

 M NEWS : o arquivo NEWS foi modificado
 ? NEWS : o arquivo NEWS é desconhecido pelo mercurial
 A NEWS : o arquivo NEWS será adicionado ao mercurial
 R NEWS : o arquivo NEWS será removido do mercurial


### Para atualizar o repositório local

      hg pull
      hg update -c

      Para fazer as duas coisas simultaneamente

      hg -u pull

