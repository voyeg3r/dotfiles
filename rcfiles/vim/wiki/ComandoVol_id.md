### Introdução
Para descobrir o código UUID de uma partição do HD, podemos usar o programa vol_id.

Para executá-lo, basta executar no terminal:

 ls -l /dev/disk/by-uuid


A necessidade deste comando se deve ao fato de o
ubuntu estar usando uma identificação de discos
chamada [[http://en.wikipedia.org/wiki/UUID|UUID]]
em seu fstab

Este artigo só foi possível ao ilustre amigo → [[http://jfmitre.blogspot.com/2006/11/descobrindo-o-cdigo-uuid-de-uma-partio.html|J. F. Mitre]]

### um exemplo

# /dev/hdb1
UUID=EE0CFEFE0CFEC09F /media/hdb1 ntfs defaults,umask=007,gid=46 0 1

### Veja também [[blkid]]
### Referências
* [[http://tchellomello.livejournal.com/|Criando devices persistentes com udev]]