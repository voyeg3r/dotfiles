### Introdução
efetua uma comparação entre os pacotes que estão
instalados em sua maquina e se na lista houver um pacote com a versão
mais nova ele faz o download a faz a atualização.

apt-get upgrade
# /usr/share/debconf/fix_db.pl --> fix debconf
#

### how install apt-proz e prozila
http://ppa.launchpad.net/tahutek-team/prozilla/ubuntu/pool/main/


if you see any dependency related errors during installation process, simply
run following command.

    sudo apt-get -f install

### Instalar apt-fast e apt-metalink

apt-get install -y aria2

# o comando abaixo deverá ser colocado nos scripts de instalação
# testa se o apt-fast está instalado o define como instalador padrão

	command -v apt-fast >/dev/null  && APT="apt-fast" || APT="apt-get"

if ! which apt-fast >/dev/null; then
	wget -c http://va.mu/EL5u -O /etc/bash_completion.d/apt-fast
	wget -c http://va.mu/EL57 -O /usr/bin/apt-fast && chmod 0755 $_
	apt-fast update
fi

wget -c https://raw.github.com/tatsuhiro-t/apt-metalink/master/apt-metalink -O /usr/bin/apt-metalink && chmod +x $_

### ativar a possibilidade de instalar pacotes de repositórios não oficiais via synaptic

sudo update-apt-xapian-index

### resolvendo problemas no apt-get
* http://www.ubuntu-ac.org/archives/319

### atualizar a distribuição

sudo su -

apt-get -qq --print-uris dist-upgrade |  egrep -o -e "http://[^\']+" | \
aria2c -c -d /var/cache/apt/archives -i -; apt-get dist-upgrade

apt-get -qq --print-uris upgrade | awk -F"'" '{print "wget -c", $2}' >> baixar-pacotes.sh


# para pegar os linkd do vim
apt-get -qq --print-uris -y install vim-gnome vim-doc | egrep -o -e "http://[^\']+"

http://br.archive.ubuntu.com/ubuntu/pool/main/v/vim/vim-runtime_7.2.330-1ubuntu3_all.deb
http://br.archive.ubuntu.com/ubuntu/pool/main/v/vim/vim-gnome_7.2.330-1ubuntu3_i386.deb

Sometimes some files you have installed is not cached. If so, you
need to retrieve them from the internet. First we need to generate
the list of files to be downloaded.

# fonte http://xlylith.blogspot.com/
sudo apt-get install $(dpkg -l|grep ^ii|awk '{print $2}') --reinstall --print-uris \
-y |awk '{print $1}'|sed "s/'//g"|grep tp:// > downlist

Then download it using wget

wget -ci downlist -P ~/mydebs


### listar dependências

sudo apt-get –print-uris –yes install PACKAGE_NAME | grep ^\’ | cut -d\’ -f2 >mydownload.txt

wget –input-file mydownload.txt
sudo dpkg -i *.deb

# para baixar os codecs em uma máquina que ainda não tem nada instalado
sudo apt-get --print-uris --yes install ubuntu-restricted-extras | grep ^\' | cut -d\' -f2 >mydownload.txt

Important: the mydownload.txt file will be empty if you run
this command for an application which is already installed and
up to date! Also, you have to create the list on the machine
where you want the packages to be installed, otherwise some
dependencies will not be displayed if they are already installed
on that machine but not on yours.

# Open **Synaptic Package Manager** from **System**-**Administration** Menu.
> [[image:http://2.bp.blogspot.com/_a6LMj16lz7g/SfXicge8QpI/AAAAAAAAAP0/qvamVoe117M/s320/synapticpackagemanager.png width="320" height="246" link="http://2.bp.blogspot.com/_a6LMj16lz7g/SfXicge8QpI/AAAAAAAAAP0/qvamVoe117M/s1600-h/synapticpackagemanager.png"]]
# Select the packages you want to install.
# Go to **File** and select **Generate Package Download Script**
> [[image:http://1.bp.blogspot.com/_a6LMj16lz7g/SfXic-lKMAI/AAAAAAAAAP8/Ba9tWi72w3Y/s320/synapticpackagemanagerfilemenu.png width="320" height="158" link="http://1.bp.blogspot.com/_a6LMj16lz7g/SfXic-lKMAI/AAAAAAAAAP8/Ba9tWi72w3Y/s1600-h/synapticpackagemanagerfilemenu.png"]]
# Save the file and bring it to the computer that has Internet.
# Run that file.
# It will download all the packages and its dependencies.
# Put them in a removable drive.
# Bring the drive back to the old machine.
# Open **Synaptic Package Manger** again.
# From **File** menu choose **Add Downloaded Packages**.
You're done. That's 10 easy steps to install software and add packages to Ubuntu box which doesn't have Internet.

To update your system follow the same above procedures but instead of 'step 2' Go to Edit and Mark all Upgrades.

### cache do apt
* http://www.linuxjournal.com/content/presenting-squid-deb-proxy-speed-your-update-downloads

sudo apt-get install squid-deb-proxy avahi-tools

### Como instalar pacotes contendo um padrão no nome?

# como instalar todos os estilos de ícones disponíveis para o openoffice?

# primeiro faça a busca por todos os pacotes de estilo
# apt-cache search openoffice.org-style.*

# agora vamos filtrar para mostrar somente o nome, é só jogar para o awk
# apt-cache search openoffice.org-style.* | awk '{print $1}'

# agora vamos fazer todo o comando anterior virar argumento do comando "apt-get install"
# basta colocar o comando dentro de `crases`

apt-get install `apt-cache search openoffice.org-style.* | awk '{print $1}'`

### Para atualizar os repositórios consumindo pouca banda

sudo apt-get -o Acquire::http::Dl-Limit=30 upgrade

### Instalar um pacote consumindo pouca banda

sudo apt-get -o Acquire::http::Dl-Limit=25 install <package>

### Referências:
* [[@http://www.gdhpress.com.br/blog/dicas-apt-get-aptitude/]]


deb http://archive.ubuntustudio.org/ubuntustudio feisty main
wget http://archive.ubuntustudio.org/ubuntustudio.gpg -O- | sudo apt-key add -
ubuntustudio-icon-theme


### Mostrar meta informação de um pacote (distribuições derivadas do debian) (dependências, status etc)


apt-cache show Your_package


### listar pacotes instalados

dpkg --get-selections > pacotes.txt

Para instala todos os pacotes de uma lista prévia faça:

dpkg --set-selections < pacotes.txt


### descomentando os repositórios universe e multiverse

sed -i.backup -r '/^#\s?deb\s?(http|ftp|-src).*(partner|multiverse|universe)/s/^#\s?//g' /etc/apt/sources.list


### Limitar download do apt
* fonte: http://fredim.wordpress.com/2008/11/10/limitar-banda-do-apt/
Primeiramente edite o arquivo /etc/apt/apt.conf ,
acrescentando os seguintes dados:

//
//
Acquire
{
http {
Dl-Limit "x";        // x Kb/sec maximum download rate
}

}
//
//

* Onde x é a quantidade de Kb/sec máxima de download.

### via comando direto

sudo apt-get -o Acquire::http::Dl-Limit=25 install <package>


### Resolvendo problema com o aptitude
* fonte: http://andregondim.eti.br/?p=574

wget http://launchpadlibrarian.net/19491146/aptitude-defaults.pt_BR -O /usr/share/aptitude/aptitude-defaults.pt_BR


### auto apt
* fonte: http://www.linuxacessivel.org/2008/05/26/usando-o-auto-apt/

O que é o auto-apt?

O auto-apt é uma ferramenta que possibilita a instalação de
pacotes durante a compilação de um programa. Por ex., se você
for compilar, por exemplo um programa que necessite de bibliotecas
relacionadas com áudio ou qualquer outra coisa, o auto-apt
automaticamente instala para você caso não as encontre no sistema.

Como instalar

via terminal, digite:

sudo apt-get install auto-apt


Após a instalação, é necessário rodar alguns comandos antes
de usá-lo. digite-os na sequência em que é mostrado.


sudo auto-apt update
sudo auto-apt updatedb
sudo auto-apt update-local


Pronto, o auto-apt está pronto para ser usado!

Compilando um programa

para compilar um programa com o auto-apt simplesmente
faça. (vou pegar como exemplo o apache 2)


cd apache-2.2
auto-apt run ./configure

daí em diante, se faltar alguma biblioteca, o gerenciador de
pacotes padrão da distribuição que se está usando é chamado
para instalar o que se está faltando para a compilação do programa.


Obs: em alguns casos o auto-apt fica meio perdido, mas, de modo geral ele funciona bem!


### Adicionando chaves gpg ao apt-get
No ubuntu karmic

sudo add-apt-repository ppa:<Repository_Name>

# novo gimp
sudo add-apt-repository ppa:matthaeus123/mrw-gimp-svn

Um script já pronto

#!/bin/bash
# script para adicinar chaves ao apt

# permitindo a execução apenas pelo root
if  [ "$(id -u)" != "0" ];  then
  echo "  Este script precisa ser executado como root"
  exit  1
fi

# permite só uma instância de um script
LOCK_FILE=/tmp/.lock

(set -C; :  > $LOCK_FILE) 2> /dev/null
if [  $? != "0" ];  then
  echo "Lock File exists - exiting"
   exit 1
fi


usage ()
{
        echo
        echo "  =================================="
    echo "  programa $0"
    echo "  Adiciona chaves gpg ao apt"
    echo "  uso: $0 id-chave-gpg"
    echo "  você tem que digitar o identiciador da chave"
    echo
        echo "  =================================="
}

# Testando se o usuário digitou um argumento
if [ $# != 1 ]
then
    usage
    exit
fi



# read -p "  Digitie a assinatura da chave: "  chave

 gpg --keyserver subkeys.pgp.net --recv-keys "$1"
 gpg --export --armor "$1" | apt-key add -

read -p "   Atualizar lista de pacotes?   "  resp
if [ "$resp" = "s" ] || [ ]"$resp" = "S"  ]; then
    apt-get update
fi

rm -f /tmp/.lock



### Códigos ainda não prontos para uso


#!/bin/bash
# script para adicionar chaves ao gpg + apt

# Permitindo a execução somente pelo root
# Check the script is being run by root
if  [ "$(id -u) " != "0" ];  then
  echo "This script must be run as root"
  exit  1
fi

# permite só uma instância de um script
LOCK_FILE=/tmp/.lock

(set -C; :  > $LOCK_FILE) 2> /dev/null
if [  $? != "0" ];  then
  echo "Lock File exists - exiting"
   exit 1
fi

Principal() {
   clear
   echo "Adicionar chaves ao apt ou repositórios para UBUNTU 7.04 "
   echo "------------------------------------------------------"
   echo "Opções:"
   echo
   echo "1. Adicionar chaves"
   echo "2. Adicionar repositórios"
   echo "3. Sair"
   echo
   echo -n "   Qual a opção desejada? "
   read opcao
   case $opcao in
      1) Adic_chaves ;;
      2) Adic_repositorios ;;
      3) exit ;;
      *) "   Opção desconhecida." ; echo ; Principal ;;
   esac
}


Adic_chaves (){

 read -p "  Digitie a assinatura da chave: "  chave

 gpg --keyserver subkeys.pgp.net --recv-keys "$chave"
 gpg --export --armor "$chave" | apt-key add -
}

Adic_repositorios () {
  read -p "  Digite o endereço a ser adicionado ao sources.list"  url
  echo "$url" >> /etc/apt/apt/sources.list


}

Principal
echo
echo "  Atualizando a lista de pacotes..."
echo "  Lista de pacotes atualizada"
sleep 3
exit 0



### Adicionando repositórios ao apt
No ubuntu karmic há uma nova opção

udo add-apt-repository ppa:<Repository_Name>


* http://wiki.ubuntubrasil.org/AdicionandoRepositorios/Edgy
Autenticação de chaves são geralmente obtidas do mantenedor do repositório de software. O mantenedor colocará frequentemente uma cópia da chave de autenticação em um servidor de chaves pública (keyserver). A chave pode ser recebida usando o comando:

gpg --keyserver [keyserver] --recv-keys [keyhash]

No exemplo acima, você importaria a chave de autenticação do mantenedor da seguinte forma:

gpg --keyserver subkeys.pgp.net --recv-keys 1135D466

Então, adicione a chave à base de dados segura de chaves apt do Ubuntu, com o seguinte comando:

gpg --export --armor 1135D466 | sudo apt-key add -

Note que no final da linha existe um - (traço)

### Testes para scripts

# permite só uma instância de um script
 LOCK_FILE=/tmp/.lock

(set -C; :  > $LOCK_FILE) 2> /dev/null
if [  $? != "0" ];  then
  echo "Lock File exists - exiting"
   exit 1
fi

# Permitindo a execução somente pelo root
# Check the script is being run by root
if  [ "$(id -u) " != "0" ];  then
  echo "This script must be run as root"
  exit  1
fi



### Aptviaproxy

sudo vim /etc/apt/apt.conf.d/02proxy

# cole
Acquire::http::Proxy "http://fulano:senha@ip.do.proxy:porta";
Acquire::ftp::Proxy "ftp://fulano:senha@ip.do.proxy:porta";

# agora update
sudo apt-get update




#!/bin/bash
# script para ativar o apt via proxy
# Criado: Sex 09/Fev/2007 hs 13:50
# Last Change: Seg 05 Mar 2007 11:26:10 BRT
# Autor: Sergio Luiz Araujo Silva
#
# Serao editados os arquivos
# /etc/profile
# /etc/bashrc
# /etc/apt/apt.conf
# /etc/environment

clear
echo " "
echo "==========================================="
echo   Script para configuracao do apt via proxy
echo "==========================================="

if [ ! $USER = "root" ]; then
   read -p "  Voce sabe a senha de root? [S/n]  " resp
   resp=$(echo "$resp" | tr [[:upper:]] [[:lower:]] | cut -c1)
      if [ "$resp" != "s" ] ; then
          echo "  Este script tem que ser rodado como root"
          echo "  saindo"
          sleep 2
          exit
      else
           echo "  Digite a senha de root"
           su
      fi
fi

if cat /etc/profile | grep "\(http_proxy\|ftp_proxy\)" > /dev/null; then
   echo "   O proxy ja esta configurado em /etc/profile"
   echo "   Os valores sao: "
   echo
   cat /etc/profile | grep "\(http_proxy\|ftp_proxy\)"
   sleep 3

   read -p "   Deseja atualizar a lista de pacotes? [N/s] " resp
   resp=$(echo "$resp" | tr [[:upper:]] [[:lower:]] | cut -c1)
   if [ "$resp" = "s" ]; then
       echo "   Atualizando os repositÃ³rios"
       sleep 1
       apt-get update

   fi
fi


# as linhas abaixo pegam os dados necessÃ¡rios para configurar o seu proxy
echo
read -p "   O proxy necessita usuario e senha?  [s/N] " proxysenha
proxysenha=$(echo $proxysenha | tr [[:upper:]] [[:lower:]] | cut -c1)

   if [ "$proxysenha" = "s" ]; then
     read -p "   Digite o nome do usuario para o proxy: " usuario
     read -p "   Digite a senha para o proxy: " senha
   fi

   read -p "   Digite o ip do servidor proxy: " ip_servidor
   read -p "   Digite a porta do proxy: " porta
   echo

   if [ "$proxysenha" = "s" ]; then
      PROXY="${usuario}:${senha}@${ip_servidor}:${porta}"
   else
      PROXY="${ip_servidor}:${porta}"
   fi


# configuraÃ§Ã£o do /etc/profile
cat <<-EOF >> /etc/profile

http_proxy="http://${PROXY}"
ftp_proxy="http://${PROXY}"
export http_proxy ftp_proxy
EOF

# configuraÃ§Ã£o do /etc/apt/apt.conf
cat <<-EOF >>  /etc/apt/apt.conf

Acquire {
HTTP::PROXY=${PROXY};
FTP::PROXY=${PROXY};
}
EOF


# Configuracao do /etc/environment
cat <<-EOF >> /etc/environment

http_proxy="http://${PROXY}"
ftp_proxy="http://${PROXY}"

Acquire {
HTTP::PROXY=${PROXY};
FTP::PROXY=${PROXY};
}

alias wget="wget -Y on"

EOF

### se o proxy tiver senha o wget tem que ter senha tambÃ©m
if [ "$proxysenha" = "s" ]; then
# configuracao do wget
cat <<-EOF >> /etc/bashrc


alias wget="wget --proxy-user=${usuario} --proxy-passwd=${senha}"
EOF

fi

echo
echo "   1 - Feche o konsole atual"
echo "   2 - Abra um novo terminal e"
echo "   3 - Rode o apt-get update como root"
echo
sleep 2
exit



### HowTo: See Contents of A .DEB Debian / Ubuntu Package File
* http://www.cyberciti.biz/faq/view-contents-of-deb-file/

apt-get update && apt-get install apt-file

# apt-file list packageName
# apt-file list wget

### How Do I See foo.deb Contents?

# dpkg-deb -c foo.deb
# dpkg-deb -c acct_6.4~pre1-6_amd64.deb

You read the contents of a installed package:

# dpkg -L packageName

### Referências
* http://www.mariusb.net/blog/2009/10/apt-get-performance-improvement/
* http://www.webupd8.org/2009/11/get-list-of-packages-and-dependencies.html
* http://techspalace.blogspot.com/2009/04/offline-update-ubuntu.html
* script para gerar script de atualização http://pastebin.com/CscKBpYr
