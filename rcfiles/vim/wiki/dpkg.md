 =dpkg=
Instala pacotes no debian / ubuntu

  dpkg -i pacote.deb

Para ver uma lista de todos os pacotes instalados

  dpkg -l

Para pegar somente os nomes dos pacotes instalados

  dpkg -l | awk '{print $2}'

### listar pacotes instalados

dpkg --get-selections | grep -v deinstall | cut -f 1

### remover kernels antigos
* Referência: http://andregondim.eti.br/?p=1162

dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

### manual completo
fonte: http://www.guiadohardware.net/comunidade/comandos-lista/870632/


- Atualizar o banco de dados local do apt-get. Deve-se executar este comando frequentemente (eu executo diariamente) para que o apt-get busque sempre a lista de pacotes DEB mais recente
apt-get update

- Atualiza todos os pacotes que estão instalados no sistema
apt-get upgrade

- Atualiza apenas o pacote especificado
apt-get upgrade nome_do_pacote

- Checa a integridade dos pacotes do sistema, ou seja, verifica se não há dependências quebradas
apt-get check

- Instala um novo pacote solucionando automaticamente os pacotes dos quais o aplicativo a ser instalado depende. Caso o pacote algum-pacote já esteja instalado, o apt-get tentará atualizá-lo
apt-get install pacote

- Para reinstalar um pacote
apt-get install --reinstall nome_do_pacote

- Saber status do cache, como versões distintas, dependências
apt-cache stats

- Para procurar um pacote
apt-cache search nome_do_pacote

- Procurar pacotes apenas pelo nome
apt-cache search --names-only nomedopacote

- Faz uma busca pelo pacote e exibe alguns dados relacionados com o pacote
apt-cache show nome-do-pacote

- Exibe mais detalhes (dependências e versão) sobre um determinado pacote
apt-cache showpkg nome_do_pacote
EX: apt-cache showpkg kmail

- Exibe apenas os pacotes que depende
apt-cache showpkg nome_do_pacote
EX: apt-cache depends kmail

- Instala os pacotes básicos e tenta atualizar todo o sistema
apt-get dist-upgrade

- Remove o pacote e todas as suas dependencias criadas
apt-get remove nome-do-pacote

- Remove o pacote e todas as suas dependencias criadas incluindo arquivos de configuração
apt-get remove --purge nome-do-pacote

- Visualiza os pacotes que voce poderá atualizar
apt-get -s upgrade

- Verifica as dependências automaticamente
apt-get -f install

- Instala o kernel no sistema
apt-get -f install kernel
Com a observação do D.J.:

Citação:
E esses:
Citação:
- Instala o kernel no sistema
apt-get -f install kernel

- Tambem instala o kernel no sistema
apt-get -f install kernel#1:2.2.18-6cl
Não instalam o kernel, precisa especificar o nome do kernel, que dependendo da distro os nomes são linux-image-"versão sem aspas", kernel-image-"versão sem aspas"(as vezes usado) e os headers do kernel, linux-headers-"versão sem aspas".

- Apenas efetua o download do pacote para o diretório '/var/cache/apt/archives' cabendo ao usuário instalá-lo posteriormente
apt-get install -d nome_do_pacote

- Tambem instala o kernel no sistema
apt-get -f install kernel#1:2.2.18-6cl

- Para reinstalar um pacote
apt-get install --reinstall nome_do_pacote

- Para apenas fazer o download de um pacote (A opção "-d" ou "--download-only" no apt-get faz apenas o dowload sem instalar nada)
apt-get --download-only install nome_do_pacote

- Qual pacote devo instalar pra ter o comando import?
apt-file search bin/import imagemagick: usr/bin/import

- Adiciona o suporte ao apt para instalar pacotes via CD-ROM
apt-cdrom add

- Para remover arquivos de pacotes baixados pelo apt-get ou aptitude (que serão armazenados no diretório /var/cache/apt/archives/) digite:
apt-get clean apt-get autoclean

- Para fazer o download do código-fonte de um pacote (OBS: será feito o download para o diretório atual)
apt-get source nome_do_pacote

note que serão copiados/baixados 3 arquivos .orig.tar.gz .dsc .diff.gz - Para descobrir o nome de um pacote (que não está instalado no sistema) que um arquivo pertence
apt-file search nome_do_arquivo

OBS1: Antes disso, por favor, execute o comando apt-file update para atualizar a base de dados dos arquivos que os pacotes contém.

OBS2: Este comando é similar ao 'dpkg -S' mas exibirá os pacotes não instalados que contêm o arquivo. Pode ser usado também para procurar por um pacote que contém arquivos necessários que estejam faltando quando se compila alguns programas

- Para exibir o conteúdo de um pacote
apt-file list nome_do_pacote

Comando dpkg = ferramenta completa para gerenciamento de pacotes utilizando o Sistema de Pacotes Debian (Debian Package System)

- Para instalar um pacote no formato 'deb'
dpkg -i nome_do_pacote.deb
ou
dpkg --install nome_do_pacote.deb

- Para remover um pacote no formato 'deb' mantendo os arquivos de configuração relacionados ao pacote
dpkg -r nome_do_pacote
ou
dpkg --remove nome_do_pacote

- Para remover um pacote no formato 'deb' removendo também todos os arquivos de configuração relacionados ao pacote
dpkg -P nome_do_pacote
ou
dpkg --purge nome_do_pacote

- Para exibir detalhes sobre um determinado pacote
dpkg -p nome_do_pacote
ou
dpkg --print-avail nome_do_pacote

- Para exibir todos os pacotes instalados no computador
dpkg -l
ou
dpkg --list

- Para exibir todos os pacotes que contenham em seu nome a palavra 'mozilla'
dpkg -l | grep mozilla
ou
dpkg --list | grep mozilla

- Para exibir todos os pacotes que comecem com a palavra 'postgre'
dpkg -l postgre*
ou
dpkg --list postgre*

- Para exibir os arquivos que um determinado pacote possui
dpkg -L nome_do_pacote
ou
dpkg -listfiles nome_do_pacote

- Para exibir o nome do pacote que contem os arquivos todos os 'kmail_*.sh'
dpkg -S kmail_*.sh
ou
dpkg --search kmail_*.sh

- Para exibir uma descrição mais detalhada do pacote 'postgresql'
dpkg -s postgresql

- Para exibir o conteúdo de um pacote DEB
dpkg -c nome_do_pacote.deb
dpkg -S /usr/include/locale.h libc6-dev: /usr/include/locale.h

- Para exibir todos os pacotes instalados no sistema
dpkg --get-selections > lista_de_pacotes.txt

- Para obter uma lista de pacotes instalados no sistema:
dpkg --get-selections > lista_de_pacotes.txt

É isso aí, pessoal, espero que tenha contribuído positivamente. Postem os comandos que não estão na lista e que vocês tiverem conhecimento.



