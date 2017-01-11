###9 Awesome SSH Trics
http://tychoish.com/rhizome/9-awesome-ssh-tricks/

# considere este trecho do ~/.ssh/config

    AddressFamily inet
    #HashKnownHosts no
    StrictHostKeyChecking no
    Compression yes
    Ciphers arcfour,blowfish-cbc
    #GSSAPITrustDNS yes
    VerifyHostKeyDNS yes
    #LoginGraceTime 2m
    #MaxStartups 3:50:6

	Host teco
		HostName 192.168.0.2
		User smith
		Port 22

	Host *
		Compression yes
		CompressionLevel 7
		Cipher blowfish
		ServerAliveInterval 600
		ControlMaster auto
		ControlPath /tmp/ssh-%r@%h:%p

Control Master/Control Path

	This is probably the coolest thing that I know about in SSH. Set the
	"ControlMaster" and "ControlPath" as above in the ssh configuration.
	Anytime you try to connect to a host that matches that configuration a
	"master session" is created. Then, subsequent connections to the same host
	will reuse the same master connection rather than attempt to renegotiate
	and create a separate connection. The result is greater speed less
	overhead.

	This can cause problems if you' want to do port forwarding, as this must be
	configured on the original connection, otherwise it won't work.

Se a máquina que você vai acessar mudar de ip o ssh
dá erro, o que fazer então?

ssh-keygen -R ip
ssh-keygen -R 192.168.1.217

### descobrindo servidores ssh ativos na rede local

    nmap -p 22 --open -sV 192.168.0/24
    nmap -p 22 10.3.1.1/16 | grep -B 4 "open"

### usando o ssh com o comando screen
* http://www.commandlinefu.com/commands/view/2844/ssh-and-attach-to-a-screen-in-one-line
### Executando um sed sobre ssh

ssh coordenador@host "sed -i '10s/^/#/g' /etc/X11/xorg.conf"

### sincronizando a data de um servidor com outro

sudo date -s "$(ssh user@server.com "date -u")"

# ajustar a hora com o servidor da escola
# coloque as linhas abaixo no arquivo /etc/rc.local
# obs: para funcionar exporte a chave do ssh
date +%Y%m%d%T -s "`ssh manager@192.168.1.11 'date "+%Y%m%d %T"'`"

### restaurando backup tar.bz2 via ssh

ssh user@host "cat /path/to/backup/backupfile.tar.bz2" |tar jpxf -

### Enviar som via ssh

arecord -f dat | ssh -C user@host aplay -f dat

### manter conexão ativa evitando timeout

echo 'ServerAliveInterval 60' >> /etc/ssh/ssh_config

### Como criar aliases no ssh para facilitar o acesso

fonte: [[@http://www.dicas-l.com.br/dicas-l/20091204.php]]Alias válido apenas
para usuário Efetuar estas configurações com usuário diferente do usuário root,
neste exemplo utilizarei o usuário smith. Caso o diretório .ssh não exista,
basta cria-lo com comando abaixo

  $ mkdir ~/.ssh

Conceder a permissão necessária

  $ chmod 700 ~/.ssh

Criar aliases

  $ vim ~/.ssh/config

**//Conteúdo do arquivo config://**

  Host teco
	HostName 192.168.0.2
	User smith
	Port 22

        chmod 0700 ~/.ssh

        # https://wiki.archlinux.org/index.php/SSH#Speed_up_SSH
		AddressFamily inet
		HashKnownHosts no
		StrictHostKeyChecking no
		Compression yes
		Ciphers arcfour,blowfish-cbc
        #GSSAPITrustDNS yes
		VerifyHostKeyDNS yes
		#LoginGraceTime 2m
		#MaxStartups 3:50:6

        #Host fulano
        # HostName 192.168.1.102
        # Port 22
        # User fulano
        # IdentityFile ~/.ssh/id_rsa.pub

		Host *
		ControlPath ~/.ssh/master-%l-%r@%h:%p
		ControlMaster auto

O arquivo **config** deve ter permissão 600, ou seja, deve estar acessível apenas para o usuário dono do arquivo.

### Otimização do acesso
edite o arquivo /etc/ssh/ssh_config
comente as duas linhas

GSSAPIAuthentication yes
GSSAPIDelegateCredentials no

set "GSSAPIKeyExchange no" in your client configuration file which is usually in /etc/ssh_config

Pode-se também comprimir e forçar o uso de IPV4

ssh -4 -C user@host

### Enviando mensagem tipo net send
fonte: http://andregondim.eti.br/?p=619

Depois de logado na máquina destino por ssh, é só fazer:
    xmessage Mensagem Desejada -display :0 &

Exemplo:

    $ xmessage Teste http://andregondim.eti.br -display :0 &

### tunel reverso

ssh -R 2001:localhost:22 [username]@[remote server ip]

Allows you to establish a tunnel to your home pc froma company pc. Then from your home pc you can use the command `ssh localhost -p 2001` to ssh to your company PC.
### definindo um range de acesso
fonte: [[http://forums.opensuse.org/archives/novell-archives/308388-how-define-ip-ranges-etc-hosts-allow.html|forum do opensuse]]
No arquivo /etc/hosts.deny negue o acesso de todos os hots e todos os protocolos

ALL:PARANOID
ALL:ALL

===Liberando um range===

sshd: 10.3.0.*

Outra forma seria

sshd: 10.3.0.0/255.0.0.0

### Para liberar o acesso apenas para alguns hosts

sshd: ALL EXCEPT 195.168.26.56, 85.216.25.368

### acessando arquivos gráficos remotamente

ssh -C -X user@remotehost gui_command

### configurando o atalho do putty

C:\tmp\PUTTY\putty.exe -load proxy

### hosts.allow

sshd: 127.0.0.1
sshd: 10.1.1.2
sshd: 10.1.1.5
sshd: 10.1.1.15

### Acesso pelo modo gráfico
ssh significa secure shell, ou shell seguro pois os dados trafegam criptografados. Podemos acessar graficamente pelo konqueror usando:

  fish://usuario@ip

onde usuario tem que existir no sistema e ip tem que ser o da máquina a ser acessada. A máquina a ser acessada tem que estar com o servidor ssh instalado e rodando.

  /etc/init.d/ssh start

Se for acessar usando o linux ubuntu, a forma de conexão muda um pouco pois a interface gráfica é o Gnome e portanto o gerenciador de arquivos é outro, no caso o nautilus. Faça:
ssh://usuario@ip
no kurumin

No kurumin para ativar o serviço faça

service ssh start

Acesso pela linha de comando

ssh usuario@ip

Para saber quem está logoado em sua máquina usando ssh

zago@speedy zago$ echo $SSH_CLIENT
192.168.1.53 33033 22

### pegando variável remotamente

versao="$(ssh $servidor cat $arquivo)"

### copiando arquivos remotamente pelo ssh

scp opções origem destino

veja agora como seria

  scp -Crp dirlocal user@IP:/dirremoto

Em caso de falha de conexão

testar se a máquina a ser acessada tem

* servidor rodando
* um ip ativo, use o comando ping --> ping ip
* em último caso apague nas duas máquinas ~/.ssh

### copiando a chave pública para a area de transferência

  Esse procedimento serve para adicionar sua chave pública ao
  github por exmeplo

  pbcopy < ~/.ssh/id_rsa.pub

  Caso não tenha o pbcopy pode colocar esses dois aliases no seu
  zshrc ou bashrc


  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'

### Exportando a chave do ssh

ssh-keygen -b 1024 -t dsa
ssh-copy-id -i ~/.ssh/id_dsa.pub usuario@maquina_remota

Backup de uma partição em rede usando dd, gzip e ssh

1. A partição a ser copiada deve ser desmontada.

2. O comando a seguir faz o truque:

dd if=/dev/partition_to_be_backed_up | gzip | ssh user_name@backup_server dd
of=name_of_backup_file.gz

O exemplo seguinte mostra como fazer o backup de um disquete:

dd if=/dev/fd0 | gzip | ssh [[mailto:user_name@backup.server|user_name@backup.server]] dd of=floppy.img.gz

3. Para restaurar a partição "backupeada" (a partir do servidor de backup, lembre-se que a partição de destino deve estar desmontada):

dd if=name_of_backup_file.gz | gzip -d | ssh [[mailto:user_name@target.server|user_name@target.server]] dd of=/dev/target_partition

Para completar nosso exemplo do disquete:

dd if=floppy.img.gz | gzip -d | ssh [[mailto:user_name@target.server|user_name@target.server]] dd of=/dev/fd0

Como melhorar a segurança do ssh

/etc/hosts.deny:

ALL:ALL

Isso vai negar o acesso de qualquer host a qualquer serviço. Parece
muito restritivo à primeira vista, mas depois disso você pode
adicionar hosts no arquivo /etc/hosts.allow para permitir o acesso aos
serviços. Abaixo você encontra um exemplo que permite a alguns hosts
conectar ao SSH:

sshd: 192.168.0.1 #permite o host 192.168.0.1 acessar o SSH
sshd: foo.bar.com #permite o acesso do host foo.bar.com ao SSH

Colaboração: Ederson L. Corrêa
Fonte: http://www.dicas-l.com.br/dicas-l/20050113.php

Sabemos que o ssh é uma forma de acesso remoto razoalvelmente segura,
bem mais segura que nosso velho conhecido telnet.

Entretanto, na net encontram-se disponiveis diversos scripts de "brute
force" para tentar se obter acesso pelo ssh, e como não faltam idiotas
metidos a crackers para tentarem essas coisas, sempre é bom se cercar
de todo o cuidado.

Aqui listarei algumas sugestões coletadas de várias fontes
(agradecimentos especiais ao Alejandro Flores, que me deu boas
idéias), que ajudam a aumentarmos nossa segurança.

1. Use senhas fortes: Não use senhas fáceis, muito menos pequenas, de
preferência assimétricas e sem padrão (nada de "letra numero letra
numero ..." ou "numero letra numero letra ...") e faça bom uso dos
caracteres como @,#,$,&, ...;

2. Mude a porta do ssh: Só com isso minimizamos problemas com um
ataque automatizado, ou ataques de script kiddies que não sabem mudar
a porta do ssh no exploit que baixaram da internet. Isso pode ser
feito através da opção 'Port' do /etc/ssh/sshd_config.

3. Bloqueie o acesso como usuário root: Assim, evita-se problemas de
alguém conseguir quebrar a senha do root e já acessar com plenos
poderes. Com isso, o 'atacante' teria que descobrir o login e password
de um usuário e depois a senha do root. Isso pode ser feito
adicionando 'PermitRootLogin no' no /etc/ssh/sshd_config.

4. Certifique-se de o sshd estar rodando com separação de privilegios:
Dessa forma, o sshd cria um processo não privilegiado para tratar as
conexões iniciais. Após sucesso na autenticação, cria um outro
processo que tem os provilegios necessários. Isso é default no ssh,
mas devemos garantir que NÃO exista uma linha com
'UsePrivilegeSeparation no' no /etc/ssh/sshd_config.

5. Permita acesso a apenas um usuário: Isso é possivel através da
opção 'AllowUsers' do /etc/ssh/sshd_config. Bastaria acrescentar uma
linha com 'AllowUsers nome_do_usuario_autorizado_a_logar_via_ssh'.

6. Crie um usário com o máximo de restrições possiveis e que você só
use para o shh: Exemplos de restrições:

* Não o inclua em nenhum outro grupo além do users;
* Edite o /etc/ftpusers e acrescente o nome desse usuário. Assim bloqueamos o acesso dele ao ftp.
* Evite que ele possa se tornar root (adicione uma linha com 'root:nome_usuario_do_ssh:DENY' no /etc/suauth). Assim, vc deverá se tornar outro usuário e ai sim se tornar root. Exemplo, suponhamos que 'teste' seja o usuario criado para o acesso por ssh, e que 'elcorrea' seja um outro usuário cadastrado na máquina, assim para se tornar root estando logado com teste teriamos que fazer:

$ (aqui somos teste)
$ su - elcorrea (aqui nos logamos como usuario elcorrea)
Password: (password do elcorrea)
$ (agora somos elcorrea)
$ su - (aqui nos tornamos root)
Password: (password do root)
# (agora somos root)

Assim, vemos que alguém teria que descobrir dois nomes de
usuário e três senhas para conseguir se tornar root.

* Utilize algum programa pós-login para efetuar um 'challenge' para
certificar de que você é você mesmo. Essa foi uma grande idéia do
Alejandro. O que ele quis dizer é para criarmos um programa ou
script que faz uma pergunta, a qual pode ser um gerador de
caracteres baseado na hora ou uma simples pergunta de carater
pessoal, que só você saberia responder. E caso o usuário erre ou
tente fechar o programa/script (ctrl+c) a sessão é fechada. Um
exmeplo bem simplista seria:

* Crie (ou edite acrescentando no inicio) um .bash_profile para o usuário do ssh com o seguinte conteudo:

#!/bin/bash
trap '' SIGINT SIGTERM
./eu.sh
if [ -e sou_eu.txt ]; then
   echo "Acesso Autorizado"
   rm -f sou_eu.txt
else
   echo "Acesso Negado"
   logout
fi
trap SIGINT SIGTERM

Crie um arquivo chamado eu.sh no home do usuário do ssh, com:

#!/bin/bash
echo "Qual a senha do seu cartao?"
read resp
if [ "$resp" == "123456" ]; then
 touch sou_eu.txt
fi

E não se esqueça de torna-lo executavel: chmod +x eu.sh

7. Se possivel, limite os endereços IPs que podem acessar a maquina
por ssh: Caso você sempre acesse a máquina através de um número
limitado de maquinas, ou então somente internamente a rede, você pode
limitar o acesso ao ssh a somente essas maquinas.

Isso pode ser feito de diversas formas, com regras no iptables,
através da dupla /etc/hosts.allow e /etc/hosts.deny, e, o que eu acho
mais fácil, através da opção AllowUsers na forma user@host.

Assim, suponhamos que eu sempre acesso a maquina remoatamente através
de uma máquina de IP 10.0.0.5 e que eu criei o usuário 'teste' para
acesso por ssh, assim eu acrescentaria uma linha com 'AllowUsers
teste@10.0.0.5' no /etc/ssh/sshd_config, e limitaria o acesso a apenas
esse usuário e de apenas essa maquina.

Se você não pode limitar os endereços, por qualquer razão, é bom
utilizar um script que detecte uma tentaiva de acesso por brute force
e que bloqueie o IP do atacante. Veja também um script desse tipo,
criado pelo Mastah listado abaixo:

  #!/bin/bash
  # Shellscript criado para bloquear os corriqueiros bruteforce probes
  # feitos para a porta do ssh. Pega as ultimas 20 tentativas ilegais na porta do ssh.
  # Verifica se voce já bloqueou o mané e se voce quer adicionar na regra do iptables.
  # Caso queira usar no crontab, é so mudar o valor da var $MODE pra "AUTO"...
  # Abracos, Mastah

  MODE="AUTO"
  #MODE="MANUAL"

  if [ -f /var/log/messages ] ; then
    ips=$(cat -n /var/log/messages | tail -n 20 | grep -i Illegal | grep -i sshd | awk -F" " {'print $11'})
    attempts=1
    for ip in $ips ; do
       lastip=$ip
       if [ "$lastip" == "$ip" ] ; then
          attempts=$(expr $attempts + 1)
          if [ $attempts -ge 5 ] ; then
             echo "Brute force SSHD attack detected from $ip"
             attempts=1
             lastip=""
             blocked=$(iptables -L INPUT | grep -i $ip | grep -i DROP)
                    if [ "$blocked" ] ; then
                echo "> Ip Already Blocked. Continuing with scan"
                echo " "
             else
                if [ $MODE == "MANUAL" ] ; then
                   echo "> Do You Want to add this IP to INPUT DROP in IPTABLES rules? (y/n)"
                   read resp
                   if [ "$resp" == "y" ] ; then
                      iptables -A INPUT -s $ip -j DROP
                      echo "> IP $ip ADDED TO IPTABLES INPUT DROP ruleset"
                      echo " "
                   fi
                else
                   iptables -A INPUT -s $ip -j DROP
                   echo "> IP $ip ADDED TO IPTABLES INPUT DROP ruleset"
                   echo " "
                fi
             fi
          fi
       fi
    done
  fi

Assim, utilizando apenas algumas dessas dicas já aumentamos
enormemente a nossa segurança.

Caso não tenha ficado claro, todas as alterações mencionados aqui
devem ser feitas na maquina que será acessada remotamente.

### acessando ssh através de proxy autenticado
* http://www.dicas-l.com.br/arquivo/acessando_ssh_atraves_de_um_proxy_autenticado.php#.T4Vkf-LLWjs

Instalar os seguintes pacotes

   proxychains vidalia tor

   proxychains ssh usuario@servidor.externo

### Referências
* http://www.zago.eti.br/ssh/ssh.html
* http://br-linux.org/tutoriais/002249.html (rsync sem senha)
