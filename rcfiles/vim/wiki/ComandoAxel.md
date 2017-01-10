### introdução
Parecido com o [[wget]] só que estabelece multiplas conexões agilizando os downloads

Axel is a command-line downloader for unix-like
operating systems. Unlike wget, axel includes download
acceleration, whicThis program tries to accelerate the
downloading process by using multiple connections for
one file. Starting from version 0.97, the program can
use multiple mirrors for one download as well. The
program tries to be as light as possible (25-30k in
binary form), so it might be useful as a wget clone
on byte-critical systems.

sudo apt-get install -y axel

### Parâmetros

-s speed
–num-connections=x, -n x
--output=x, -o

This will use the Belgian, Dutch, English and German kernel.org mirrors to download a Linux 2.4.17 kernel image.

axel ftp://ftp.{be,nl,uk,de}.kernel.org/pub/linux/kernel/v2.4/linux-2.4.17.tar.bz2

### Veja também
* [[@http://www.vivaolinux.com.br:443/artigos/impressora.php?codigo=10986|Apt-fast - turbinando o apt-get em distros Debian-like]]
### Referências
* http://www.ubuntugeek.com/list-of-download-managers-available-in-ubuntu.html
