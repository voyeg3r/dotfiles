### Introdução
fonte: http://pt-br.gentoo-wiki.com/Tutorial_Samba

smbclient e smbmount

Antes que você possa montar um compartilhamento você precisa saber onde ele está. Liste os compartilhamentos num host estrangeiro com o seguinte comando, substituindo  com o nome do host: smbclient -L  -U%

Você verá algo pareceido com isso:
Código: Compartilhamentos

        Sharename       Type      Comment
        ---------       ----      -------
        public          Disk      shared
        IPC$            IPC       IPC Service
        ADMIN$          IPC       IPC Service

### Linux <span class="highlightedSearchTerm">client</span>e de uma rede Windows
Corpo do texto:
**Colaboração:** Rafael Henrique da Silva Correia

O <span class="highlightedSearchTerm">SAMBA</span> é um auxiliador nas tarefas interoperáveis entre sistemas Linux x Windows ou Windows x Linux. Ele também pode funcionar como um PDC (Primary Domain Controller), mas esse não é o foco de hoje, em outra oportunidade falo mais sobre o que é um PDC.

Bom então mãos a obra....

===1. Instalação dos pacotes do <span class="highlightedSearchTerm">SAMBA</span> (como <span class="highlightedSearchTerm">client</span>e):===

Estando dentro de uma rede Windows em gente! E usando Debian! E que seremos
<span class="highlightedSearchTerm">client</span>e e não servidor, não se esqueçam que isso que vamos fazer agora só
foi testado sob estas condições...

Entrem em um terminal (xterm, gnome-terminal, konsole ou o puro Ctrl+Alt+F1)
loguem-se como usuário root:

$ su root
$ whoami
root


O comando whoami é só pra ter certeza que vocês viraram root mesmo (para os
experientes este post pode parecer chato porém não podemos nunca esquecer
das pessoas iniciantes)!

Prosseguindo...
Como root instale os pacotes necessários:

# apt-get install smbclient smbfs samba-common


Explicando:

- smb<span class="highlightedSearchTerm">client</span> - o pacote do <span class="highlightedSearchTerm">client</span>e <span class="highlightedSearchTerm">samba</span>
- smbfs - sistema de arquivos para mapear as unidades do Rwindows compartilhadas no servidor
- <span class="highlightedSearchTerm">samba</span>-common - pacote com os arquivos que o <span class="highlightedSearchTerm">samba</span> irá usar

caso durante a instalação apareça alguma pergunta, responda a opção default
teclando enter, pois iremos configurar tudo na mão

===2. Configurando o <span class="highlightedSearchTerm">client</span>e <span class="highlightedSearchTerm">samba</span> (smb<span class="highlightedSearchTerm">client</span>)===

Após instalados os pacotes agora vem a parte mais legal configurar o <span class="highlightedSearchTerm">client</span>e
<span class="highlightedSearchTerm">samba</span>! Para esta proeza devemos ter certas coisas em mãos:

O domínio que você quer entrar distribui ips dinamicamente (dhcp) ou não? Se
não você deve ter um ip estático pra usar

Qual o nome (domínio) e os ips dos servidores DNS?

Se você não sabe responder a estas questões você não conseguirá configurar
seu <span class="highlightedSearchTerm">client</span>e <span class="highlightedSearchTerm">samba</span>! Peça ajuda primeiramente a uma pessoa que entenda da rede
que você está usando, e se precisar também posso ajudar no que for possível
pelo email <rafaelhenriqu (a) gmail com br>!

Bom com estas informações de preferência anotadas num papelzinho (não esqueça
de tacar fogo nessa papel depois! Ips da rede perdidos possibilitam invasões de
forma mais fácil), vamos começar a configuração do nosso <span class="highlightedSearchTerm">client</span>e <span class="highlightedSearchTerm">samba</span>, entre
no arquivo smb.conf localizado em /etc/<span class="highlightedSearchTerm">samba</span>/, e altere as seguintes linhas:

[global]
[global]
workgroup = \seu domínio
server string = \qualquer frase que não comprometa sua segurança, que não dê pistas sobre seu host
dns proxy = no

; tire o ; da linha de baixo se seu host pegar o ip automaticamente (dhcp)
; include = /etc/samba/dhcp.conf

log file = /var/log/samba/log.%m
max log size = 1000
syslog = 0
panic action = /usr/share/samba/panic-action %d
encrypt passwords = true
passdb backend = tdbsam
obey pam restrictions = yes
invalid users = root
passwd program = /usr/bin/passwd %u
passwd chat = *Enter\snew\sUNIX\spassword:* %n\n *Retype\snew\sUNIX\spassword:* %n\n *password\supdated\ssuccessfully* .
socket options = TCP_NODELAY


As linhas que não aparecem aqui podem ser excluídas sem problemas!
Pra quem pega o ip por dhcp (quem usa ip estático passe ao próximo passo):
Crie um arquivo /etc/<span class="highlightedSearchTerm">samba</span>/dhcp.conf com o seguinte conteúdo:

wins server = eth0: \ip do seu dns primário eth0: \ip do seu dns secundário

O <span class="highlightedSearchTerm">client</span>e <span class="highlightedSearchTerm">samba</span> está configurado!

===3. Configurando as coisas mais tontas!===

Pra quem usa ip estático:

mude o arquivo /etc/network/interfaces para...

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
address \seu ip
gateway \ip do seu gateway
netmask \sua máscara
broadcast \ip do seu broadcast


mude o arquivo /etc/resolv.conf para:


search \nome do seu domínio
nameserver \ip do dns primário
nameserver \ip do dns secundário


Pra quem pega ip por dhcp (mais fácil um pouco ;-):

mude o arquivo /etc/network/interfaces para...


auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp


===4. Terminando===

Vamos reiniciar o serviço da rede:

#/etc/init.d/networking stop
#/etc/init.d/networking start


Após feito isso já nos podemos considerar dentro do domínio e com conexão a internet! :)

Façam o teste...

# ping www.google.com

Agora é só usar algum utilitário gráfico para que consigamos usar uma área
mapeada no desktop, eu como estou usando Gnome, podemos fazer o seguinte,
menu Locais >> Servidores de Rede >> Rede Windows, as vezes talvez precisemos
nos autenticar no domínio com usuário e senha as vezes não dependendo
da configuração do servidor Rwindows, aí achamos a área compartilhada no
servidor e clicamos com o botão direito em cima da área compartilhada e
clicamos em Conectar a este servidor, está área irá parar no menu locais
como um atalho aí fica mais fácil! ;)

Também podemos usar a forma não gráfica para montarmos as áreas compartilhadas
do Rwindows no Linux com o comando smbmount, mas agora me deu um certo sono
hehehe quem quiser aprender me manda um email que eu ensino ;P .....

Outra dica legal é usar o rdesktop (Linux usando área de trabalho remota
do Rwindows) e compartilhar o servidor cups do Linux para poder imprimir em
impressoras da rede Windows!


### Referências
Acho prudente ler sobre gvfs:
* http://syph0s.wordpress.com/2008/04/09/usando-o-gnomevfs-para-manipular-arquivos/
* http://www.leonardomiranda.com.br/dicas/linux-cliente-de-uma-rede-windows/