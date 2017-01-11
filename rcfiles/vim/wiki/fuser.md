### Introdução
Mata processos associados a um arquivo ou dispositivo

fuser -k filename

matar processos associados a um diretório

fuser -km /home

kills all processes accessing the file system /home in any way.

para casos em que você tenta desmontar um cdrom e o sistema
não permite o use do comando de desmontagem, ou seja, dá uma mensagem de erro use o comando fuser:

fuser -mkv /media/cdrom0

### Referências
* http://debtux.co.cc/?p=7