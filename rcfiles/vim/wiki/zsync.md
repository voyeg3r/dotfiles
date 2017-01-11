zsync is another implementation of the same algorithm that rsync uses, but does not require special software
To download or update an image with zsync:

### atualizando a iso do ubuntu para 10.04
Ideal para o caso de você já ter a versão beta, ele atualiza uma pequena parte e pronto

zsync http://mirror.globo.com/ubuntu/releases/10.04/ubuntu-10.04-desktop-i386.iso.zsync

### Para testar a integridade da imagem

md5sum -c <(grep -i alternate-i386 MD5SUMS)

### lista de espelhos "mirros" ubuntu
* http://www.ubuntu.com/getubuntu/downloadmirrors#mirrors
