### Introdução

### Como montar a pasta /tmp com as opções nodev, nosuid, e noexec

  vim /etc/fstab

  localize a linha /tmp
  UUID=0aef28b9-3d11-4ab4-a0d4-d53daa4 /tmp     ext4  defaults   1 2

  adicione o seguinte texto, nodev, nosuid, noexe
  ao final da 4ª coluna

  salve e feche o arquivo

  agora faça o mesmo para /dev/shm

  Tenha certeza de associar /var/tmp para /tmp (novamente /etc/fstab)
  adicione a seguinte linha

  /tmp /var/tmp none rw,noexec,nosuid,nodev,bind 0 0

Set nodev, nosuid, and noexec options without rebooting the Linux server

   # Bind /var/tmp to /tmp
    mount -o rw,noexec,nosuid,nodev,bind /tmp/ /var/tmp/
   # Remount /tmp
    mount -o remount,noexec,nosuid,nodev /tmp
   # Remount /dev/shm
    mount -o remount,noexec,nosuid,nodev /dev/shm

   Verify new settings:
   # mount
   # mount | less
   # mount | egrep --color -w '^(tmpfs|/tmp)|/tmp'



### Recuperar senha de root sem live-cd
* http://www.dicas-l.com.br/dicas-l/20100604.php
* http://www.vivaolinux.com.br/dica/Recuperando-a-senha-de-root-no-Debian

A dica envolve a remontagem da partição raiz

  # mount -o remount,rw / #Remontar como read-write o /
  # mount -a #Montar tudo em /etc/fstab
  # mount #Mostrar se o / foi remontado como read-write

A partir daqui você poderá editar os arquivos. Como no meu caso as senhas estavam em /etc/shadow tive que editar esse arquivo

  # vi /etc/shadow


Se esse recurso não tiver habilitado altere o /etc/passwd. Apague o conteúdo que estiver no segundo campo depois de root root:$1$fmdlkdjslj¨5$rdgd:14693:0:99999:7::: e deixe assim: root::14693:0:99999:7:::. Salve o arquivo e continue.

  # sync #Escrever o que tiver no buffer em disco
  # umount -a #Desmontar o sistema de arquivos
  # mount -o remount,ro / #Remontar como read-only
  < Ctrl>< Alt>< Del> #Para reiniciar
  login: root # Digite root sem senha
  # passwd #Depois altere a senha do root


### remontar unidade com permissões de leitura e escrita

mount -o remount rw /

### Montar iso em loop
Digamos que você tem uma imagem de cd e quer ver as pastas contidas na mesma,
você poderia descompactar a iso (uma solução possível) mas [[http://vivaotux.blogspot.com/2007/09/usando-o-jigdo-para-obter-nova-verso-do.html|há casos]] em que você precisa mantar a iso para que o sistsema reconheça a mesma como se fosse um cd normal

Lembrando que o comando moutn usa o padrão

  mount oque onde

A barra invertida é um recurso que permite digitar comandos
longos em várias linhas (legibiligade) faz parte de uma [[http://www.ibm.com/developerworks/aix/library/au-badunixhabits.html|série de dicas]]
que eu recomendo.

### descobrindo qual processo impede a desmontagem de um dispositivo

$ fuser -v /media/cdrom

Com o comando acima teríamos uma saída assim:
USER PID ACCESS COMMAND
/media/cdrom: fulano 3838 ..C.. bash
Como **root** você poder usar o parâmetro **k** que serve para matar o processo.


# fuser -k /media/cdrom


Agora sim podemos desmontar o dispositivo:


# eject


### remontando com permissão de leitura e escrita

sudo mount -o remount,rw /


### Montando uma imagem iso para leitura de seu conteúdo

  mount -t iso9660 /caminho/da/imagem/gutsy-7.10-alternate-i386.iso \
/media/cdrom -o loop


### Montando partições windows

sudo mount /dev/hda1 /media/windows/ -t ntfs -o nls=utf8,umask=0222

/dev/hda1       /media/windows  ntfs    nls=utf8,umask=0222  0       0




### Usando o ntfs-3g

/dev/<a sua partição> /media/<local de montagem> ntfs-3g silent,umask=0,locale=utf8 0 0


### Recuperando sessoes de cd
fonte: http://ubuntuforum-br.org/index.php/topic,16765.0.html
### Montando compartilhamento samba
You want to use cifs instead of smbfs. smbfs breaks on newer implementations of SMB on win32, and has been deprecated for a while.

mount -t cifs //$server/share /local/mount -o rw,username=$USER

sudo mount -t cifs -o credentials=/path/to/credenials //hostname/sharename /mount/point


### exibe os sistemas montados atualmente em um layout agradável

mount | column -t



« em: 01 de Março de 2007, 01:19 »
Responder com citaçãoCitar
Se vc por algum motivo de engano na hora de gravar uma sessão no cd-r, esqueceu de ativar a multi sessão e agora so consegue ver o que tem gravado na ultima sessão do cd-r, não precisa ficar desesperado isso tem solução, e muito simples ( por isso amo linux, se fosse windows teria que comprar um programa para fazer isso Sem Graça ) com o seguinte codigo vc pode enxergar a sessão que quiser, por exemplo vamos supor que na primeira sessão eu gravei um filme, e na segunda eu gravei minhas musicas, so que esqueci de ativar o multi sessão e agora na posso ver meu filme, com o seguinte codigo posso ver a primeira sessão onde esta o filme

Código:

sudo mkdir /media/iso
mount -t iso9660 -o ro,session=0 /dev/XXX /mnt/iso


*onde XXX é o seu drive de cd ok,
*0 representa a primeira sessão, 1 a segunda e assim vai..


### Remontando um dispositivo como somente-leitura
fonte: [[http://www.dicas-l.com.br/dicas-l/20080310.php]]

Esta é muito útil quando se desejar ter um //backup// de um sistema de arquivos de um servidor em produção. Nesse caso, para a realização do //backup//, pode-se remontar o sistema de arquivos como somente-leitura, de modo que ninguém possa escrever na partição enquanto o backup estiver acontecendo. Por exemplo, pode-se remontar uma partição já montada /dev/hda5 como somente-leitura executando o seguinte comando:

  # mount -o remount,ro /dev/hda5 /mnt/C/


Uma vez terminado o //backup//, pode-se remontá-la novamente como leitura-e-escrita:

  # mount -o remount,rw /dev/hda5 /mnt/C/


### Referências
* http://www.guiaubuntupt.org/wiki/index.php?title=Ntfs_suporte_com_leitura_e_escrita_ntfs-3g
