**São algumas das opções deste comando**
<span style="font-family: arial;">**-r** ou **--show** : exibe a data e a hora do relógio da máquina.</span>
<span style="font-family: arial;"> </span>
<span style="font-family: arial;">**-w** ou **--systohc** : copia a hora do sistema para o relógio da máquina.</span>
<span style="font-family: arial;">**-s** ou **--hctosys** : copia a hora da máquina para a hora do sistema.</span>
<span style="font-family: arial;">**--set --date=novadata** : modifica a data e a hora do relógio da máquina.</span>
|| **Comentários sobre as opções do comando** ||
<span style="font-family: arial;">Por exemplo, o comando</span>

<span style="font-family: arial;">hwclock --set --date="9/22/01 18:55:10"</span>
<span style="font-family: arial;">define a nova data como 22 de setembro de 2001 e a nova hora como 18:55:10.</span>
|| **Observações** ||
<span style="font-family: arial;">Na realidade, o comando **hwclock** é uma versão melhorada do antigo comando **clock**. Normalmente, o comando **clock** é apenas um link para o comando **hwclock**. </span>

###fonte
* http://www.uniriotec.br/~morganna/guia/hwclock.html