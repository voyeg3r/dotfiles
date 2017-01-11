### Introdução
compactador e descompactador do linux

### Descompactar durante um download

    wget http://example.com/archive.tar.bz2 -O - | tar -xj

    curl http://example.com/archive.tar.bz2 | tar -xj

### Descompactando tar.bz2

tar jxvf pacote.tar.bz2

Tem uma variação legal que é inciar o local onde você quer descompactar (você
tem que ter permissões de escrita no diretório de destino)

tar jxvf pacote.tar.bz2 -C $HOME/tmp

### Deixando o tar descobrir como descompactar

  Em geral usamos "tar zxvf" para tar.bz
  e "tar jxvf" para tar.bz2, mas se usarmos a opção "tar axvf"
  o tar irá detectar pela extensão qual programa usar:

    tar axvf somefile.tar.bz?

### apagando arquivos descompactados indevidamente numa pasta
Fonte: dicas-l http://va.mu/A6Erx

    rm -rf $(tar ztf arquivo.tar.gz)

### descompactando e descartando a pasta pai

tar jxvf pacote.tar.bz2 --strip 1

veja também: http://ur1.ca/0253w from stack overflow
### criando um pacote tar.bz2

tar cjvf nome.tar.bz2 ./pasta

### listando o conteúdo de um pacote tar

tar -tf conf-sys.21-08-2009-113639.tar.bz2  | awk '{print $6}'

### Empacotar arquivos locais em um host remoto

tar -czf - * | ssh example.com "cat > files.tar.gz"

|| criar pacote tar.gz || tar czvf nomedopacote.tar.gz /pasta ||
|| extrair pacote tar.gz || tar zxvf pacote.tar.gz [ -C /caminho/opcional/para/extracao/ ] ||
|| criar pacote tar.bz2 || tar cjvf nomedopacote.tar.bz /pasta ||
|| extrair pacote tar.bz2 || tar jxvf pacote.tar.bz2 -C /pasta/ ||

### Compactando tudo menos pastas

tar -cvzf arch.tgz $(find /path/dir -not -type d)

tar -cvf /path/dir.tar /path/dir* --exclude "/path/dir/name" --exclude "/path/dir/opt"

### como construir um pacote tar do stdin?
Qualquer comando que produza uma lista de arquivos pode ser usado

tar cvzf archive.tgz `ls -1 *`

### criando pacotes tar com 7z

tar cf - /path/to/data | 7z a -si archivename.tar.7z

Using 7z to create archives is OK, but when you use tar, you preserve all
file-specific information such as ownership, perms, etc. If that's important to
you, this is a better way to do it.

### para instalar o 7zip no ubuntu faça

sudo apt-get install p7zip 7zip-full p7zip-rar lzma lzma-dev
