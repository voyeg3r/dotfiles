### Introdução
Após uso intensivo da memória pode-se libera-la assim

swapoff -a ; swapon -a

When you run a memory intensive application (VirtualBox, large java application, etc) swap area is used as soon as memory becomes insufficient. After you close the program, the data in swap is not put back on memory and that decreases the responsiveness. Swapoff disables the swap area and forces system to put swap data be placed in memory. Since running without a swap area might be detrimental, swapon should be used to activate swap again.

Both swapoff and swapon require root privileges.


### usando seu pendrive como memória swap

Formate ele usando o gparted
depois descubra onde está a partição com o comando

fdisk -l

Por fim ative a partição assim

sudo swapon -p 1000 -v /dev/sdc1

a opção -p 1000 aumenta a prioridade de seu uso
e opção -v mostra a saída do comando mais detalhada

### Montando swap usando UUID

  UUID é a identificação única do dispositivo, ou seja, independente
  de qual entrada ele estiver montado ele será idenficado do mesmo
  modo

 Abaixo o UUID do meu pendrive que está formatado como swapoff

    0de2281f-1544-4eb0-800f-91282e15edf6

    sudo blkid | awk -F: '/0de2281f-1544-4eb0-800f-91282e15edf6/ {print $1}'

 Para montar a memória swap com base no UUID basta fazer

    sudo swapon -U UUID

 Para determinar a prioridade, o que fará com o que cada vez que o sitema
 necessite usar swap ele priorize uma determinada partição use a opção -p

 Abaixo estou montando o meu pendrive pelo seu UUID e com uma prioridade
 alta, o que confere ao meus sistema mais agilidade uma vez que a
 velocidade de acesso do pendrive é mairo do que a do HD

    sudo swapon -p 1000 -U 0de2281f-1544-4eb0-800f-91282e15edf6


 Uma explicação em inglês do forum do ubuntu


 If you use the nofail option in /etc/fstab, the system will look for
 your disk (and partition) on boot time. If the device is plugged, the
 filesystem will be mounted. If not, the boot will continue as normal.

 See arch wiki: https://wiki.archlinux.org/index.php/Fstab

 Example

 UUID=XXXXXXXXXXXXXXX    /myhdd ntfs  nofail,auto,noatime,rw,user    0   0

 Conclusão, para o meu caso a linha no fstab ficará assim:

    UUID=0de2281f-1544-4eb0-800f-91282e15edf6 swap swap defaults,nofail 0 0

