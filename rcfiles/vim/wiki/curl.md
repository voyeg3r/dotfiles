### Referências
* [[@http://bemvindoaolinux.blogspot.com/2009/01/downloads-por-linha-de-comando-curl.html|Download por linha de comando com o curl]]
* IBM [[http://www.ibm.com/developerworks/br/opensource/library/os-curl/index.html]]
* https://curl.haxx.se/docs/manpage.html

    curl -O url

    curl -O http://cdn.designrulz.com/wp-content/uploads/2012/08/pallet-designrulz-[1-33].jpg

cURL é uma ferramenta desenvolvida para a transferência de arquivos pela
Internet pelo próprio terminal de comandos do sistema (Xterm, Konsole, Consola,
etc...). Este aplicativo suporta vários tipos de protocolos diferentes, deste
modo, permitindo downloads de muitas fontes distintas. Outra característica sua
é a utilização de sintaxes e expressões regulares.

**Protocolos suportados por cURL**

Entre os protocolos suportados, podemos citar: FTP, FTPS, HTTP, HTTPS, SCP,
SFTP, TFTP, TELNET, DICT, LDAP, LDAPS e FILE. Além disso, cURL suporta
certificados SSL, HTTP em proxies, cookies, autenticação em diversos sites
(usuários + password). Através desta ferramenta, é possível afirmar, sem
sombras de dúvidas, que a grande maioria dos sites da Web podem ser acessados
por cURL.

**Uso de sintaxe e expressões regulares**

O uso de expressões regulares é muito útil quando todos os arquivos a serem
baixados seguem algum padrão em seus nomes. Assim, como um único comando, você
pode baixar centenas ou milhares de links de só uma vez.  Recomendo fazer a
instalação por meio do gerenciador de pacotes de sua distribuição, cURL está
presente na maioria das distribuições Linux. Se você usar o gerenciador de
pacotes não será necessário fazer este download.

You can specify multiple URLs or parts of URLs by writing part
sets within braces as in:

    http://site.{one,two,three}.com

or you can get sequences of alphanumeric series by using [] as in:

    ftp://ftp.example.com/file[1-100].txt

    ftp://ftp.example.com/file[001-100].txt (with leading zeros)

    ftp://ftp.example.com/file[a-z].txt

Nested sequences are not supported, but you can use several ones next to each other:

    http://example.com/archive[1996-1999]/vol[1-4]/part{a,b,c}.html

You can specify any amount of URLs on the command line. They will
be fetched in a sequential manner in the specified order.

You can specify a step counter for the ranges to get every Nth number or letter:

    http://example.com/file[1-100:10].txt

    http://example.com/file[a-z:2].txt

    --create-dirs

    When used in conjunction with the -o option, curl will create
    the necessary local directory hierarchy as needed. This option
    creates the dirs mentioned with the -o option, nothing else.
    If the -o file name uses no dir or if the dirs it mentions
    already exist, no dir will be created.

### measuring a iso size before downloading it

curl -sI https://static.apricityos.com/iso/apricity_os-09.2016-dev-gnome-i686.iso | grep Content-Length | awk '{print $2}'

### using curl with proxy

# add this line in your ~/.bashrc
alias curl='curl --proxy 192.168.1.11:8080'

### followig redirections

   just use the "-L" option

   curl -L url

### salvando os comandos mais populares do site command-line-fu

curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2500:25] | grep -v _curl_ > comfu.txt

### get external ip

    curl ifconfig.me

### Save mp3 from stream

    curl -sS -o $outfile -m $showlengthinseconds $streamurl

### encurtador de urls do google
* http://vivaotux.blogspot.com/2010/03/encurtador-de-urls-do-google.html

curl -s 'http://ggl-shortener.appspot.com/?url='"$1" | sed -e 's/{"short_url":"//' -e 's/"}/\n/g'

### Exibir IP externo

echo `curl -s sputnick-area.net/ip`

# ou
curl icanhazip.com
curl -s ip.appspot.com

### Dá pra twittar com o curl

curl -u NOMEDEUSUARIO:SENHA -d status=”SUA MENSAGEM AQUI ENTRE AS ASPAS” http://www.twitter.com/statuses/update.xml
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml

# ou
curl -u twitter-username -d status="Hello World, Twitter!" -d source="cURL" http://twitter.com/statuses/update.xml

# ou
#!/bin/bash
curl -u USER:PASS -d status="$*" http://twitter.com/statuses/update.xml > /dev/null
echo "Message sent!"

### upload via ftp

curl -u user:passwd -T /home/dir/local_file_to_upload ftp://your_host.com/subdir/

### baixar todos os pacotes tar.gz

curl http://www.phrack.org/archives/tgz/phrack[1-67].tar.gz -o phrack#1.tar.gz

curl "http://forklift-photos.com.s3.amazonaws.com/[12-48].jpg" -o "#1.jpg"

curl "http://www.ssb.no/english/subjects/06/05/nos_lonn_en/nos_d362_en/tab/tab-[001-131].html" -o "#1.html"

# baixar a transcrição de uma temporada inteira do Two and A Half Men
curl http://www.springfieldspringfield.co.uk/view_episode_scripts.php\?tv-show\=two-and-a-half-men\&episode\=s01e\[01-24\] -o "two-and-a-half-men_#01.txt"

### baixando lições de inglês audio e texto

curl --limit-rate 15k http://learnrealenglish.com/AudioVideo/Tip%20[1-7].zip -o tip_#1.zip
curl --limit-rate 15k http://learnrealenglish.com/AudioVideo/tips/Tip_[1-7].pdf -o tip_#1.pdf

### download all delicious bookmarks

curl -u username -o bookmarks.xml https://api.del.icio.us/v1/posts/all

### extrair tarball remoto sem salvar localmente

curl http://example.com/foo.tar.gz | tar zxvf -

### changing user-agent

    curl -silent -A "iMacAppStore/1.0.1 (Macintosh; U; Intel Mac OS X 10.6.7; en) AppleWebKit/533.20.25" http://ax.search.itunes.apple.com/

    curl -A "Opera/9.80 (Macintosh; Intel Mac OS X; U; en) Presto/2.6.30 Version/10.63" -o file.zip url

Apearing like opera-developer

    curl -A "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.3 Safari/537.36 OPR/46.0.2573.0 (Edition developer)"

chrome:

    curl -A "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/58.0.3029.110 Chrome/58.0.3029.110 Safari/537.36"
