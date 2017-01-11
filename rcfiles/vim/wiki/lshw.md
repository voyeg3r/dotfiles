### Introdução
Este comando é muito útil, pois exibe informações detalhadas sobre o hardware,
como a lista pode ser muito longa use em combinação com o comando [[less]]


   lshw | less

### para saber se o sistema é 32 ou 64 bits

sudo lshw -C cpu|grep width

### informações sobre a placa de vídeo

lshw -C display

### seu sistema é 32 ou 64 bits?

sudo lshw -C cpu|grep width

* http://blog.cidandrade.pro.br/tecnologia/hardware-linux-ubuntu/