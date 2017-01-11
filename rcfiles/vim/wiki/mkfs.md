### Introdução
fonte: http://br-net.org/post/formatando-o-pendrive-no-linux

Utilizando a ferramenta mkfs.vfat, foi possível formatar o pendrive em FAT32, de forma que ele funcionasse tanto no Linux quanto no Windows.

**Obs: Todos os comandos devem ser executados como root.**

Ex: Se seu pendrive é detectado como /dev/sda (se não for, troque no exemplo abaixo), basta rodar o seguinte:

//mkfs.vfat -c -v /dev/**sda**1//

A opção **"-c"** faz com que seja verificado se existem blocos defeituosos.

//Obs: se no seu sistema não existir a ferramenta mkfs.vfat, talvez precise instalar o pacote **dosfstools** .//

Se você só queria formatar o pendrive, está feito. Porém, não era o meu caso...

Meu problema era um pouco mais complicado. A tabela de partições estava incorreta, como se a partição fosse maior que o pendrive. Descobri isso, depois de rodar o comando:

//cfdisk /dev/**sda**//

Que reportou o erro. Para consertar isso, fiz o seguinte:

//cfdisk -z /dev/**sda**//

A opção **"-z"**, faz com que seja criado uma tabela de partições vazia, assim podemos criar ela manualmente.

Depois disso, vamos em **"New"**, escolhemos **"Primary"** e apenas pressionamos Enter, para indicar que vamos utilizar o espaço todo.

Com a partição criada, é necessário ir em **"Type"** e digitar **"b"** (sem as aspas), para que a partição seja do tipo FAT32.

Depois disso, basta ir na opção **"Write"** e digitar **"yes"** para gravar. Vá em **"Quit"** para sair.

Pronto, o pendrive agora está com a tabela de partições correta. Não esqueça de formatá-lo, com o comando mostrado antes:

//mkfs.vfat -c -v /dev/**sda**1//

Lembre de trocar **sda** pelo dispositivo correto.

Agora seu pendrive está pronto para usar, sem perigo de corromper os dados, que nem ocorria no meu :P