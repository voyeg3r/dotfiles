this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
this is only a test^[]
### Introdução
O squid é um excelente filtro de conteúdo para intranets, com ele podemos restringir
extensões de arquivos, [[expressões regulares]], além disto ele é uma forma de manter
em cache (armazenados) sites frequentemente visitados, recurso que se bem configurado
aumenta a velocidade da navegação numa intranet.
### cache do apt
* http://www.linuxjournal.com/content/presenting-squid-deb-proxy-speed-your-update-downloads

sudo apt-get install squid-deb-proxy avahi-tools

### Cache de videos do youtube
Para que seu squid possa fazer cache dos vídeos do YouTube, adicione as linhas abaixo ao seu squid.conf, essa alteração não só faz cache do youtube, mas qualquer site que utilize a mesma tecnologia flash com extensão .flv

########### Cache Videos ###########
refresh_pattern -i \.(mp3|mp4|m4a|ogg|mov|avi|wmv)$ 10080 90% 999999 ignore-no-cache override-expire ignore-private

acl youtube dstdomain .youtube.com

cache allow youtube
################################
# Como os arquivos de vídeo são grandes, é necessário também aumentar o maximum_object_size

maximum_object_size 102400 KB (100MB)


* http://wiki.squid-cache.org/ConfigExamples/DynamicContent/YouTube
* http://lucianopinheiro.net/portal/?q=node/115


### balanceamento de carga
* http://www.gulbf.com.br/?q=node/28

### dicas
* http://linuxadm.blogspot.com/2008/06/squid-tuning-mais-dicas-aumentando.html
* local das páginas de erro /usr/share/squid/errors/English

### bloqueio do emeesseene

gpedit.msc >> modelos administrativos >> sistema

clicando na palavra sistema ele exibirá à direita uma lista
dentre os itens veja:

"Não executar aplicativos windows especificados"
Inclui os seguintes arquivos:

msmsgs.exe
msnmsg.exe
msnmsgr.exe
Install_MSN_Messenger.exe
Install_Messenger.exe
WLinstall.exe
WLsetup.exe

Você pode remover o messenger


Feche todos os programas de mensagens e navegadores do micro, fecha também os que ficam na
 área de notificação, ao lado do relógio.
Em Iniciar, Executar digite o comando abaixo e tecle Enter.

RunDll32 advpack.dll,LaunchINFSection %windir%\INF\msmsgs.inf,BLC.Remove

Uma nova janela vai abrir pedindo para fechar todos os programas continue.

Na proxima janela vai pedir para reiniciar.


Depois de reiniciar o PC , vá em: Iniciar\ Painel de controle\ Adicionar ou remover
 programas \Adicionar ou remover componentes do Windows Remova o Windows messenger


### proxy transparente

### Redirecionmento de portas no iptables
da porta 80 do navegador para 3128

Adicone as linhas abaixo ao final do arquivo

/etc/init.d/bootmisc.sh



Regra para redirecionamento do iptables
[[code] format="bash"]
#!/bin/bash

#   1. scritp para iniciar firewall
#   2. adicione estas linhas ao final do arquivo /etc/init.d/bootmisc.sh


modprobe iptable_nat
modprobe ip_nat_ftp
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 80 -j REDIRECT --to-port 3128


### Ativando o proxy transparente no squid
na linha http_port do arquivo 'squid.conf' adicione 'transparent'

http_port 3128 trasnparent

### squid.conf

#1. /etc/squid/squid.conf

# http_port 3128 transparent vhost vport
http_port 3128 transparent
# alway_direct allow all

# http_port 168.30.34.1:3128 transparent vhost vport=80
# http_port 127.0.0.1:3128 transparent vhost vport=80
# http_port 3128
visible_hostname proxy

# cache_mem 80 MB
# maximum_object_size_in_memory 1024 KB
# maximum_object_size 40 MB
# cache_swap_low 80
# cache_swap_high 85

cache_mem 128 MB
maximum_object_size_in_memory 128 KB
maximum_object_size 512 MB
cache_swap_low 80
cache_swap_high 85
half_closed_clients off

###############################
#  local e tamanho do cache ##
###############################
# cache_dir ufs /var/spool/squid 4096 16 256
# cache_dir ufs /var/spool/squid 192 20 394
# cache_dir diskd /var/spool/squid 2048 64 256 Q1=64 Q2=72

cache_dir ufs /var/spool/squid/cache1 512 16 256
cache_dir ufs /var/spool/squid/cache2 512 16 256
cache_dir ufs /var/spool/squid/cache3 512 16 256
cache_dir ufs /var/spool/squid/cache4 512 16 256
cache_dir ufs /var/spool/squid/cache5 512 16 256

cache_access_log /var/log/squid/access.log

# Resolve um problema com conexões persistentes que ocorre com certos servidores,
# e que provoca delays em nosso cache.

detect_broken_pconn on

#  Provoca um ganho de performance ao usar conexões Pipeline (requisições em
#  paralelo)

pipeline_prefetch on

acl all src 0.0.0.0/0.0.0.0
acl manager proto cache_object
acl localhost src 127.0.0.1/255.255.255.255
acl to_localhost dst 127.0.0.0/8
acl SSL_ports port 443 563 # https, snews
acl SSL_ports port 873 # rsync
acl Safe_ports port 80 # http
acl Safe_ports port 21 # ftp
acl Safe_ports port 443 563 # https, snews
acl Safe_ports port 70 # gopher
acl Safe_ports port 210 # wais
acl Safe_ports port 1025-65535 # unregistered ports
acl Safe_ports port 280 # http-mgmt
acl Safe_ports port 488 # gss-http
acl Safe_ports port 591 # filemaker
acl Safe_ports port 777 # multiling http
acl Safe_ports port 631 # cups
acl Safe_ports port 873 # rsync
acl Safe_ports port 901 # SWAT
acl purge method PURGE
acl CONNECT method CONNECT

#######################################################
 # LIMITANDO O TAMANHO DOS DOWNLOADS ##################
#######################################################

# acl que define arquivos do tipo "texto puro" e "html":

acl html rep_mime_type text/html

# download sem restrições para a acl html:

reply_body_max_size 0 allow html

### 100Mb para os usuários administradores:
### reply_body_max_size 104857600 allow adminUsers


# 10Mb para os demais usuários:

reply_body_max_size 10485760 allow all
#######################################################

# bloquei ao msn

# acl msn_req req_mime_type ^application/x-msn-messenger$
# acl msn_rep rep_mime_type ^application/x-msn-messenger$
# acl msngw url_regex -i gateway.dll
# http_access deny msn_req
# http_access deny msn_rep
# http_access deny msngw

acl msn rep_mime_type ^application/x-msn-messenger$
http_reply_access deny msn

# bloqueio exe
# acl exe req_mime_type ^application/octet-stream
# http_access deny exe


acl webmail url_regex -i "/etc/squid/webmail"
http_access allow webmail

# acl ad src 168.30.34.155
# http_access allow ad

acl liberados url_regex -i "/etc/squid/liberados"
http_access allow liberados

# bloqueia msn pelo tipo mime
# acl reqmime req_mime_type -i "/etc/squid/mimes"
# http_reply_access deny reqmime


# tambem pode usar esta lista para libera a um grupo
# especifico de ips, neste caso precisa criar um arquivo
# com a lista de IPs a liberar,
# acl mime-ip src 192.168.254.150 ...
# acl mime-ip req_mime_type -i "/etc/squid/mime-ip"
# http_reply_access allow mime-ip


# tentativa de usar delay_pools - controle da banda

acl lento url_regex -i "/etc/squid/lento.txt"
acl interno url_regex 168.30.34.0

redirect_program /usr/bin/squidGuard -c /etc/squid/squidGuard.conf
redirect_children 8
redirector_bypass on

delay_pools 2

delay_class 1 2
delay_parameters 1 -1/-1 1200/1800
delay_access 1 allow lento

delay_class 2 2
delay_parameters 2 -1/-1 -1/-1
delay_access 2 allow interno

acl redelocal src 192.168.254.0/24 168.30.34.0/255.255.255.0
http_access allow localhost
http_access allow redelocal

# linha abaixo adicionad pelo sergio em 05-11-2008

# always_direct allow all
http_access deny all


### sites para bloqueio
http://www.mrjogos.com.br/

### bloquear msn no próprio windows
[[code] format="bash"]
edite c:\windows\system32\drivers\etc\hosts

code format="txt"
@echo off
Attrib -r -s -h %WINDIR%\system32\drivers\etc\hosts
echo 127.0.0.1 www.orkut.com >> %SystemRoot%\system32\drivers\etc\hosts
echo 127.0.0.1 www.youtube.com >> %SystemRoot%\system32\drivers\etc\hosts
Attrib +r +h %WINDIR%\system32\drivers\etc\hosts
code

### zerando o cache

/etc/init.d/squid stop
rm -rf /var/spool/squid/*
squid -z
/etc/init.d/squid start

### Filtrando os logs do squid

tail -f /var/log/squid/access.log | awk '{print $3" "$7}'


 Recomendado:* http://www.squidguard.org/Doc/configure.html* http://squidguard.shalla.de/faq/ (faq do squidGuard)==Evitando spam== * http://www.squid-cache.org.br/index.php?option=com_content&task=view&id=75&Itemid=27==noatime==

/dev/sda3 /var/spool/squid reiserfs defaults,noatime 0 2

# ou

chattr -R +A /var/spool/squid
#(Onde o -R é para recursividade, e o +A para especificar o noatime)


 ==Aumentando a segurança do squid== * http://gilbertosilva.wordpress.com/2008/03/06/aumentando-seguranca-do-squid/header_accessEssa configuração permite que o Squid não forneça uma série de informações para os sites acessados. Com elas você pode criar um servidor de proxy igual ao conhecido Anonymizer. Irei falar apenas as principais, as restantes você irá encontrar no manual do squid. As configurações abaixo servem para não ser passadas informações do seu servidor, como versão do sistema e ip.

header_access From deny all
header_access Via deny all
header_access Server deny all


 existem mais duas que podem ser desligadas, mas alguns sites podem não abrir. Eu tive problemas com sites seguros com as configurações abaixo. A primeira não envia a versão do navegador e a segunda o site de referencia.

header_access User-Agent deny all
header_access Referer deny all


 ==Sites bloqueados== [[bloqueados]]
### desempenho do squid
* http://linuxadm.blogspot.com/2008/06/squid-tuning-mais-dicas-aumentando.html
* http://www.vivaolinux.com.br/dicas/impressora.php?codigo=9192

 Para melhorarmos o tempo de resposta de acesso ao cache do Squid,
 podemos usar o acesso a múltiplos caches.

 O que ocorre é que o Squid "encontra" mais rapidamente
 um objeto procurando em vários diretórios "rasos" do que em um único diretório "profundo".

 E se este arranjo for distribuído por diversos discos o desempenho é ainda maior.

 Em seu squid.conf coloque o seguinte para o método UFS:

cache_dir ufs /var/spool/squid/cache1 512 16 256
cache_dir ufs /var/spool/squid/cache2 512 16 256
cache_dir ufs /var/spool/squid/cache3 512 16 256
cache_dir ufs /var/spool/squid/cache4 512 16 256
cache_dir ufs /var/spool/squid/cache5 512 16 256
cache_dir ufs /var/spool/squid/cache6 512 16 256



 5 caches de 512 dá mais ou menos 2,5 GB para cache, teste pra ver
 se isto é o ideal para sua necessidade.

 Caso deseje usar o daemon diskd, a configuração seria como abaixo:

cache_dir diskd /var/squid/cache/1 2900 128 512 Q1=64 Q2=72
cache_dir diskd /var/squid/cache/2 2900 128 512 Q1=64 Q2=72
cache_dir diskd /var/squid/cache/3 2900 128 512 Q1=64 Q2=72
cache_dir diskd /var/squid/cache/4 2900 128 512 Q1=64 Q2=72
cache_dir diskd /var/squid/cache/5 2900 128 512 Q1=64 Q2=72


### Configurando o squid para não fazer cache de alguns sites
 fonte: http://brfedora.wordpress.com/2008/05/18/configurando-squid-para-nao-fazer-cache-para-alguns-sites/
 Adicione as linhas abaixo no arquivo {{/etc/squid/squid.conf}}:

acl NOCACHEDOMAIN dstdomain www.redhat.com
no_cache deny NOCACHEDOMAIN


 Ele não criará cache para os acesso feitos para o dominio www.redhat.com.
 No {{/var/log/squid/access.log}}, ele apresentará a seguinte mensagem “TCP_MISS” nas visitas consecutivas.

197363963.721    892 127.0.0.1 TCP_MISS/200 11813 GET
http://www.redhat.com/ - DIRECT/209.132.177.50 text/html
1197364100.832    906 127.0.0.1 TCP_MISS/200 11813 GET
http://www.redhat.com/ - DIRECT/209.132.177.50 text/html



### Dicas
 Durante a configuração do squid você pode ter que habilitar
 o proxy ou não no navegador, usa uma extenão para desabilitar:
* https://addons.mozilla.org/pt-BR/firefox/addon/1557

 O squidGuard ao redirecionar pode enviar informações preciosas

redirect http://www.kernel-panic.it/error.html&ip=%a&url=%u

* %a: the IP address of the client.
* %n: the domain name of the client or "unknown" if not available.
* %i: the user ID or "unknown" if not available.
* %s: the matched source group or "unknown" if no groups were matched.
* %t: the matched destination group or "unknown" if no groups were matched.
* %u: the requested URL.
* %p: the path and the optional query string of %u but without the leading "/".
* %%: a single "%".

application/x-executable exe com scr
application/octet-stream bin dms lha lzh exe com scr class
text/plain asc txt bat pif
application/zip zip



### Zerar o cache do squid

procedimento q eu sigo pra zerar o cache é o seguinte:

- Páro o serviço;
- Removo os diretórios de cache do squid ("rm -rf /var/cache/squid/*
- Recrio a arvore de diretórios do squid (squid -z)
- Inicio novamente o serviço.




### squid.conf

1. /etc/squid/squid.conf
2. cache_dir ufs /var/cache/squid3 512 16 256
3. a linha acima define
4. * local do cache
5. * espaço em disco máximo
6. * número de diretórios de 1º nível
7. * número de diretórios de 2º nível


#############################

# acl para bloquear msn

acl msn rep_mime_type -i ^application/x-msn-messenger
http_access deny msn

acl msnmessenger url_regex -i gateway.dll
http_access deny msnmessenger
#################################

# você pode prover proxy para duas subredes

acl redeslocais src 172.20.19.0/255.255.254.0 192.168.254.0/24



### squidGuard.conf

 Para verificar:

tail /var/log/squid/squidGuard.log




# consertar permissões
chown proxy:proxy /etc/squid/squidGuard.conf
chown -R proxy:proxy /var/lib/squidguard/db
chown -R proxy:proxy /var/log/squid/
chmod 644 /etc/squid/squidGuard.conf
chmod -R 640 /var/lib/squidguard/db
chmod -R 644 /var/log/squid/
chmod 755 /var/log/squid
find /var/lib/squidguard/db -type f | xargs chmod 644
find /var/lib/squidguard/db -type d | xargs chmod 755




 O caminho padrão para as blacklists:

/usr/local/squidGuard/db





# código de exemplo

# °v° Sérgio Luiz araújo Silva
# /(_)\ voyeg3r em gmail
# ^ ^


# se editar alguma lista negra faça:
# squidGuard -C all
# squid -k reconfigure


# Referências:
# * http://www.squidguard.org/Doc/configure.html
# * http://www.gdhpress.com.br/servidores/leia/index.php?p=cap2-22


# /etc/squid/squidGuard.conf

dbhome /var/lib/squidguard/db
logdir /var/log/squid

# coloque aqui os endereços das máquinas liberadas

src admin {
ip 192.168.254.99
}

# coloque aqui o endereço das suas redes

src redelocal {
ip 172.30.34.0/255.255.254.0
ip 192.168.254.0/255.255.255.0
}

# um arquivo com expressões barradas
# algo como: (\.exe$|\.bat$|\.cmd$|\.pif$|\.scr$|\.sct$|\.dll$|\.vbe$|\.vbs$)

dest virus {
expressionlist expressions
}

dest porn {
domainlist blacklists/porn/domains
urllist blacklists/porn/urls

# (^|[-\?+=/_])(bondage|boobs?|busty?|hardcore|porno?|sex|xxx+)([-\?+=/_]|$)
expressionlist blacklists/porn/expressions
}

dest porn2{
domainlist BL/porn/domains
urllist BL/porn/urls
}

dest spyware {
domainlist blacklists/spyware/domains
urllist blacklists/spyware/urls
}

acl {
# todos do grupo admin acessam tudo
admin {
pass all
}

# na rede local acesso negado para alguns destinos
redelocal {
pass !virus !porn !porn2 !spyware all
}

default {
pass none
redirect http://www.google.com.br
}
}



### Personalizando a mensagem de erro
* http://www.cybershark.net/tutoriais/squid/


# http://www.cyberciti.biz/faq/squid-content-filter-block-files/

acl blockfiles urlpath_regex "/etc/squid/blocks.files.acl"

# Deny all blocked extension

deny_info ERR_BLOCKED_FILES blockfiles
http_access deny blockfiles

# a mensagem de erro é esta
# não feche as tags html e body

<HTML>
<HEAD>
<TITLE>ERROR: Tipo de arquivo bloqueado</TITLE>
</HEAD>
<BODY>
<H1>File is blocked due to new IT policy</H1>
<p>Por favor entre em contato com o suporte técnico para mais detalhes:</p>
Telefone: sergio -- 3105-1293 <br>
Email: voyeg3r no gmail <br>




### Criando regras

acl nome src 192.168.254.0/24
http_access allow nome


### Bloqueando pelo tipo mime
* http://www.squid-cache.org/mail-archive/squid-users/200511/0534.html

acl downloads req_mime_type application/octet-stream application/zip
audio/mpeg audio/wav video/mpeg video/avi video/quicktime video/x-msvideo video/x-ms-wmv

acl usuarios_de_castigo_sem_download ident fulano beltrano sicrano

http_access deny usuarios_de_castigo_semdownload downloads

acl downloads application/octet-stream application/zip video/.* audio/.* msi/.*
acl msnmime req_mime_type -i ^application/x-msn-messenger$


### Exemplos de acl's - regras
 acl HORARIO_ALMOCO time MTWHF 12:00-13:30

 Segue tabela de abreviação dos dias.

|| Abreveação || Dia da semana ||
|| S || domingo ||
|| M || segunda-feira ||
|| T || terça-feira ||
|| W || quarta-feira ||
|| H || quinta-feira ||
|| F || sexta-feira ||
|| A || sábado ||

### Limpando os comentários do squid
 Usando o vim:

:%g/^#\|^$/d


 Usando o SED

sed -i.backup '/^#\|^$/d' /etc/squid/squid.conf


### Links para estudo
* http://www.guiadohardware.net/comunidade/squid-autentica/246578/
* http://www.linuxman.pro.br/squid/

===Para autenticar no active directory===
* http://www.vivaolinux.com.br/artigos/verArtigo.php?codigo=4774
* http://www.linuxchix.org.br/?q=node/15
* http://www.andersonleite.net/tutoriais/squid_ad.htm

### bloqueando no próprio windows
 coloque cada entrada descrita abaixo precedidade de 0.0.0.0
 em c:\windows\system32\drivers\etc\hosts


### Referências
* http://under-linux.org/forums/proxy-nat-firewall/111431-windows-vista-spk1-nao-acessa-atraves-de-proxy-transparente-3.html
* http://www.guiadohardware.net/comunidade/regras-criando/205856/
* [[http://www.squid-cache.org.br/]]
* [[http://www.linuxman.pro.br/squid/|Configurando um squid ninja]]
* http://www.inf.ufes.br/~proinfo/docs/proxy/ar01s02.html