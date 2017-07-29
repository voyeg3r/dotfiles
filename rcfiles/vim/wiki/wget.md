### Introdução
Permite baixar arquivos sem riscos, ou seja,
mantém um resumo do que foi baixado

### referências
* http://codesnippets.joyent.com/tag/wget

    wget -m --restrict-file-names=nocontrol --user-agent="direct download -- `uname -a`" --no-parent --referer=http://DigitalK7.com/ "http://digitalk7.com/mus/Brazil/"

### Downloading a single page with wget with styles and images
+ https://gist.github.com/dannguyen/03a10e850656577cfb57

    wget -E -H -k -K -nd -N -p -P thepageslug http://www.oldradioworld.com/shows/X_Minus_One.php

    --adjust-extension, -E
    --span-hosts, -H

Even though we're trying to mirror a single page, that page may link to offsite
assets (such as images or stylesheets) located on a CDN (i.e. a different
domain, such as s3.thissite.amazon.aws.com). However, since we're only
mirroring a single page, this shouldn't cause wget to crawl past the foreign
hosts that are hosting these asset files.

    --convert-links, -k

When mirroring the target webpage, we create a self-contained folder of all of
its external dependencies, so that you can disconnect your computer from the
Internet, open that target webpage, and see it (mostly) function in its own
non-Internet-aware environment.


    --page-requisites, -p


This option causes Wget to download all the files that are necessary to
properly display a given HTML page. This includes such things as inlined
images, sounds, and referenced stylesheets.

    --directory-prefix=someprefix, -P someprefix,

Saves the mirrored page and its contents in a folder named someprefix

### How do I pipe a downloaded file to standard output in bash?
source: https://serverfault.com/questions/25779/how-do-i-pipe-a-downloaded-file-to-standard-output-in-bash/25780#25780

How is it possible to pipe out wget's downloaded file? If not what alternatives should I use?

    wget -O - -o /dev/null  http://google.com

### Adjusting the extension

    wget --adjust-extension

### baixar licença gplv3

 wget -O LICENSE.txt http://www.gnu.org/licenses/gpl-3.0.txt

Se desejar baixar um arquivo com o wget direto para um local faça:

  wget http://endereco/do/arquivo/vimrc -O ~/.vimrc
  wget --limit-rate=15k -i links.txt

### pegando seu ip externo

    wget -qO- ifconfig.me/ip

### agendando um download

    echo 'wget -c url' | at 12:00

### tradutor

translate(){ wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" | sed 's/.*"translatedText":"\([^"]*\)".*}/\1\n/'; }


translate <phrase> <source-language> <output-language>

### ignorando robots

    wget -m -nd -A.avi -erobots=off -i urls.txt


### baixar uma página inteira

    wget --random-wait -r -p -e robots=off -U mozilla http://www.example.com

    --------------------------------------------------
    Lembre-se que algumas opções fazem os links locais
    --------------------------------------------------

    wget -nc -k -r $(echo /moc.hsolevets.yawdrahehttpircsmivnrael//:ptth | rev)

### Baixando e descompactando sem deixar o tarball no disco

wget -qO - http://example.com/path/to/blah.tar.gz | tar xzf -



Algumas opções do Wget:

    * Fazer mirror de site:
      wget -m http://www.site.com
    * Fazer mirror de site que possui o arquivo robots.txt não permitindo esta ação (*):
      wget -e robots=off -m http://www.site.com

     wget -r -erobots=off -A “.gif” http://www.umsitequalquer.com.etc

wget –header=”User-Agent: Mozilla/4.0 (compatible; MSIE 5.0; WindowsNT; DigExt)” http://so.url.msie/aqui

wget -P Slides -r -nd -t5 -H --domains=.blogger.com,kaspere.blogpost.com http://kaspere.blogspot.com/ -A.jpg,.jpeg,.jpg.1,.jpeg.1 -erobots=off




wget -P /tmp/pastaespecifica -r -p http://www.unicamp.br –accept=JPG,jpg,GIF,gif,png,PNG


### baixando arquivos por extensão

wget -r -l1 -A *.jpg www.urldosite.com.br

   -r recursividade
   -l1 nível 1 (profundidade)
   -A *.jpg  extensão aceita

### Veja também o comando curl

curl --limit-rate 15k http://learnrealenglish.com/AudioVideo/Tip%20[1-7].zip -o tip_#1.zip
curl --limit-rate 15k http://learnrealenglish.com/AudioVideo/tips/Tip_[1-7].pdf -o tip_#1.pdf


### Man page traduzida
fonte: http://www.dicas-l.com.br/dicas-l/19991119.php

Colaboração: Felipe Machado Cardoso

Data de Publicação: 19 de Novembro de 1999

  GNU Wget 1.5.3.1, um recuperador não interativo de rede.
  Uso: WGET [OPCAO]... [URL]...

  Argumentos exigidos para opções longas são exigidos para opções curtas também.

  Inicialização:
    -V,  --version           exibe  informação de versão do Wget e sai.
    -h,  --help              imprime esse help.
    -b,  --background        executa em segundo plano.
    -e,  --execute=COMMAND   executa um comando `.wgetrc'.

  Logging e arquivo de entrada:
    -o,  --output-file=FILE     loga a saída em FILE.
    -a,  --append-output=FILE   acrescenta saída em FILE.
    -d,  --debug                exibe  informações de debug.
    -q,  --quiet                quieto (sem saída).
    -v,  --verbose              ser detalhista na saída (padrão).
    -nv, --non-verbose          não ser nem detalhista nem 'quieto'.
    -i,  --input-file=FILE      ler URL-s de entrada a partir de FILE.
    -F,  --force-html           tratar entrada como HTML.

  Download:
    -t,  --tries=NUMBER           configurar tentativas igual a NUMBER (0=ilimitado).
    -O   --output-document=FILE   gravar documento como FILE.
    -nc, --no-clobber             don't clobber existing files.
    -c,  --continue               continuar arquivo existente.
         --dot-style=STYLE        ajusta estilo de exibição da recuperação (retrieve).
    -N,  --timestamping           não recuperar arquivos remotos mais antigos que os locais.
    -S,  --server-response        exibir as respostas do servidor.
         --spider                 não baixar (download) nada.
    -T,  --timeout=SECONDS        ajusta o tempo de expiração para SECONDS.
    -w,  --wait=SECONDS           aguarda SECONDS entre retentativas.
    -Y,  --proxy=on/off           torna o proxy ligado/desligado.
    -Q,  --quota=NUMBER           ajusta a cota de recuperação para NUMBER.

  Diretórios:
    -nd  --no-directories            não criar diretorios.
    -x,  --force-directories         força criação de diretorios.
    -nH, --no-host-directories       não criar diretorio do hospedeiro (host).
    -P,  --directory-prefix=PREFIX   salvar arquivos em PREFIX/...
         --cut-dirs=NUMBER           ignorar NUMBER componentes de diretorios remotos.

  Opções HTTP:
         --http-user=USER      ajustar usuário http para USER.
         --http-passwd=PASS    ajustar senha http para PASS.
    -C,  --cache=on/off        permite/inibe dados de cache do servidor (normalmente
  permitido).
         --ignore-length       ignorar campo de cabeçalho `Content-Length'.
         --header=STRING       inserir STRING entre o cabeçalho.
         --proxy-user=USER     ajusta USER como usuario proxy.
         --proxy-passwd=PASS   ajusta PASS como senha proxy.
    -s,  --save-headers        salvar cabeçalhos HTTP para arquivo.
    -U,  --user-agent=AGENT    idtentifica-se como AGENT em vez de Wget/VERSION.

  Opções FTP:
         --retr-symlinks   recuperar links simbólicos do FTP.
    -g,  --glob=on/off     turn file name globbing on or off.
         --passive-ftp     usar modo de transferência "passivo".

  Recuperação recursiva:
    -r,  --recursive             chupador-web recursivo -- use com cuidado!.
    -l,  --level=NUMBER          nível máximo de profundidade (0=ilimitado).
         --delete-after          excluir arquivos após baixar.
    -k,  --convert-links         converter links não relativos para relativos.
    -m,  --mirror                ligar opções apropriadas para espelhamento.
    -nr, --dont-remove-listing   não remover arquivos `.listing'.

  Opções de aceitação/rejeição recursivas:
    -A,  --accept=LIST                lista de extensões aceitas.
    -R,  --reject=LIST                lista de extensões rejeitadas.
    -D,  --domains=LIST               lista de domínios aceitos.
         --exclude-domains=LIST       lista (separada por vírgula) de domínios rejeitados.
    -L,  --relative                   seguir apenas links relativos.
         --follow-ftp                 seguir links FTP a partir de documentos HTML.
    -H,  --span-hosts                 ir para hospedeiros estrangeiros quando em modo
  recursivo.
    -I,  --include-directories=LIST   lista de diretórios permitidos.
    -X,  --exclude-directories=LIST   lista de diretórios excluídos.
    -nh, --no-host-lookup             não faça a procura de DNS.
    -np, --no-parent                  não subir para diretórios pais.

  Envie relatórios de erros ee sugestões para <bug-wget@gnu.org>.

   ------- Notas do tradutor --------
  Como estamos acostumados a conhecer o significado de algumas palavras do inglês sem pensar
  na tradução, inclui abaixo uma tabela de alguns termos e como os trabuzi.
  Retrieve -           recuperação
  Foreing -            estrangeiro
  Host -               hospedeiro
  DNS-Lookup -         procura de DNS
  Parent directories - diretórios pai
  Append -             acrescentar


  Tradução: Felipe Machado Cardoso <felipemc@faesa.br>

