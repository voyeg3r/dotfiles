### Introdução
Para detectar o local do cd no ubuntu

  cdrecord -scanbus -dev=/dev/cdrom

### Comando usado para gravar cds via linha de comando

  cdrecord -v -fs=16M speed=8 dev=0,0,0 -data nome_da_imagem.iso

### Comando para gerar uma imagem.iso de um diretório
como root faça:

  mkisofs -r -J -o diretorio.iso diretorio

No meu caso aconteceu de ter que usar dev=ATAPI:0,1,0

 cdrecord -v dev=ATAPI:0,1,0 speed=16 foresight_9918_foresight-1.2.1-x86-disc1.iso

### Gravar uma iso

cdrecord -v dev=/dev/cdrom yourimage.iso

### apagar cdrw

cdrecord -v -blank=all -force


* **-v** : Exibe informações durante a gravação.
* **-fs=16** : Especifica o tamanho do buffer na memória RAM em megabytes. Substitua o 16 por um número menor caso você tenha pouca memória RAM.
* **speed=8** : A velocidade de gravação. Pode ser qualquer número suportado pelo gravador. Graças ao cache de memória e à multitarefa real, o Linux oferece uma tolerância muito maior durante a gravação. Quase sempre você conseguirá gravar a 8x ou mais, mesmo que continue usando o PC normalmente.
* **Dev=0,0,0** : Especifica a localização do gravador. O 0,0,0 é o padrão para gravadores IDE na maioria das distribuições. Se não funcionar, use o comando "cdrecord -scanbus" (como root) para ver onde está instalado o seu gravador.
* **-data** : Especifica o arquivo ISO que será gravado
* **nome_da_imagem.iso** : O nome da imagem que será gravada.
Para gerar uma imagem de cd faça
  dd if=/dev/cdrom of=imagem.iso

### Dica
Seguindo o artigo do site [http://www.slackware-brasil.com.br/web_site/artigos/artigo_completo.php?aid=102
slackware-brasil] para detectar o seu drive faça

 cdrecord dev=ATAPI -scanbus

### Gravando um CD multiseção
Fonte: http://www.vivaolinux.com.br/artigos/impressora.php?codigo=603
Autor: Rogerio Acquadro <rogerio.acquadro at pc2consultoria.com>
Data: 19/01/2004

### O que é multiseção?

Um CD multiseção é um formato de CD gravável, que permite a gravação
em CD ser continuada em mais de uma etapa de gravação. Se há espaço
livre no CD após a primeira seção, dados adicionais podem ser escritos
nele. Cada seção possui sua área específica, ocupando até 20 megabytes
de espaço. Por esse motivo, é menos eficiente do que gravar todos os
dados de uma só vez.

Há alguns anos, apenas alguns drives de CD-ROM eram capazes de ler CDs
multiseção. Hoje em dia, não há mais este tipo de inconveniente.

### A primeira seção
Este artigo usa os softwares mkisofs e cdrecord e parte do princípio
que o leitor já esteja habituado com os comandos mais comuns destes
softwares. Se o leitor não teve ainda contato com estes, é
extremamente recomendado que leia o CD-Writing-HOWTO e as manpages dos
respectivos softwares em questão.

Começando do zero, supondo que queira-se gravar determinados dados no
diretório /home/data, o primeiro passo é inserir o CD virgem no
gravador e executar a gravação:

 mkisofs -R -J -l --quiet /home/data | cdrecord dev=/dev/hdc -v -eject -multi -data -


Para quem não está habituado, a linha acima gera o arquivo ISO
on-the-fly, ou seja, o arquivo ISO é gerado durante a gravação do CD.
As flags novas aqui são:

-data: informa que as trilhas subseqüentes serão gravadas em formato
CD-ROM mode 1 (Yellow Book). Normalmente a flag -data é a default pelo
cdrecord, mas é sempre bom se certificar colocando-a.

-multi: é a opção que informa que o CD será do tipo multiseção. Esta
flag deve estar presente em todas as seções do CD, exceto na que se
queira que seja a última seção da mídia. A fixação do disco será feita
de uma maneira que seja possível a continuação posterior do disco. A
TOC (Table Of Contents) é gerada com um link para a próxima futura
seção de dados.

Uma vez gravado o CD, está pronta a primeira seção. O CD deve ser lido
sem problemas em qualquer leitor moderno de CD-ROM e em qualquer
sistema operacional de maneira totalmente transparente.

### Multi-session CDs=

    If doing multi-session CDs, make sure you read the README provided with cdrecord.

    You will need to get the start track with

        	cdrecord -msinfo dev=0,0,0

    and use the value in mkisofs (e.g. 0,53151)

        	mkisofs ... -o yyy.iso -C 0,53151 -M /dev/cdrw /dir/path

    Also you will need to carefully structure the dir path. You can add directories, but not overwrite existing files or dirs on the CD.

### Continuando o CD
Deseja-se agora continuar a gravação com novos dados. A imagem para a
segunda (e as demais seções) é um pouco diferente para ser gerada. O
mkisofs deve saber onde o espaço em branco do CD-R começa. Esta
informação pode ser obtida usando a flag -msinfo do cdrecord.

A informação que o cdrecord retornará serão dois números, separados
por uma vírgula. Estes números representam a posição do início da
última seção e a posição de início da próxima seção, informações de
vital importância para a correta geração da nova imagem ISO.

O comando deverá ser:

# cdrecord -msinfo dev=/dev/hdc 0,17654


 mkisofs -R -J -l --quiet -C 0,17654 -dev /dev/hdc | cdrecord dev=/dev/hdc -v -eject -multi -data -



Existe uma flag extra no comando mkisofs (além, claro da flag -C):

* -dev: especifica o caminho para uma imagem iso9660 para ser continuada. Recebe o mesmo tipo de formato de sintaxe do parâmetro dev= do cdrecord. A saída do mkisofs deverá ser uma nova imagem pronta para ser acrescentada seguindo os parâmetros entrados na flag -M.

A nova seção será novamente criada e o CD estará pronto para leitura, totalmente transparente para o usuário final.


!!Finalizando o CD

Todas as seções entre a segunda e a penúltima recebem o mesmo tratamento explicado no tópico anterior. Para finalizar a última seção do CD, basta retirar a flag -multi do cdrecord:

# cdrecord -msinfo dev=/dev/hdc
17654,34524

# mkisofs -R -J -l --quiet -C 17654,34524 -dev /dev/hdc | cdrecord dev=/dev/hdc -v -eject -data -

A última seção será fechada de uma maneira que não será mais possível continuar o CD.


!!Observações

Neste exemplo, a imagem ISO está sendo gerada on-the-fly, como dito. Não há o menor problema em se gerar a imagem ISO e gravar o CD em etapas separadas.

Outra observação é quanto a flag dev=/dev/hdc dos exemplos usados neste artigo. O parâmetro desta flag deve ser, naturalmente, correspondente ao endereço do gravador de CD de seu sistema.

Para maiores informações, ler o [http://www.tldp.org/HOWTO/CD-Writing-HOWTO.html CD-Writing-HOWTO].



http://www.vivaolinux.com.br/artigos/verArtigo.php?codigo=603


Referências

    * http://www.dicas-l.com.br/dicas-l/20070920.php
    * http://www.vivaolinux.com.br/artigos/impressora.php?codigo=2186
    * http://www.vivaolinux.com.br/artigos/impressora.php?codigo=603
    * http://www.dicas-l.com.br/dicas-l/20051011.php
    * http://www.slackware-brasil.com.br/web_site/artigos/artigo_completo.php?aid=102
    * http://www.guiadohardware.net/dicas/gravar-cds-via-linha-comando-atualizado.html
    * http://cdd.debian-br.org/project/wiki/Download


