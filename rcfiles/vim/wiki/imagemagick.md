### Imagemagick
a sua versão do linux já tem o imagemagick instalado.

``` markdown
File:		 imagemagick.md
Created:	 qua 11 jan 2017 11:07:58 BRT
Last Change: qua 11 jan 2017 11:08:01 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```


### recortando uma imagem grande para impressão

Primeiro exiba as características da imagem

       identify image.png

Se exportou com 300 divida ambos largura e altura por 3

        convert -colorspace CMYK -crop 2415x3425 gameboard.jpg gameboard-tile%03d.tif


### resolvendo o problema das fontes
* http://russia.shaps.hawaii.edu/software/add-to-im.html
* http://www.dicas-l.com.br/dicas-l/20050720.php

Para adicionar legendas em fotos acredito que seja mais adequado fonte de cor
branca circundada por uma borda preta, dessa maneira, não importa qual a imagem
sob a legenda, o texto sempre estará legível.

Isso pode ser conseguido com o comando:

``` sh
convert -font helvetica -fill white -stroke black            \
  -pointsize 12 -draw 'text 10,10 "Fulaninho da Silva - 2005"' \
  -stroke none -draw 'text 10,10 "Fulaninho da Silva - 2005"'  \
  imagem.jpg imagemlegendada.jpg
```

### adicionando sombra e bordas
* http://www.dicas-l.com.br/arquivo/acrescentar_sombras_e_bordas_a_imagens_com_imagemagick.php

``` sh
image-shadow () {
   out=${1%.*}-shadow.${1#*.}
   in=$1
   echo "Converted file : $out"
   if [ ! -z $2 ] ; then
     convert $in -frame $2 $out
     in=$out
   fi
   convert $in \( +clone -background black -shadow 60x5+10+10 \) \
     +swap -background white -layers merge +repage $out
 }
```

### Para adicionar sombra

     image-shadow prettywoman.jpg

### Para adicionar também bordas

     image-shadow prettywoman.jpg

### coloando texto em imagens
* http://www.imagemagick.org/Usage/annotating/

``` sh
convert -caption "Faerie Dragon" dragon.jpg -gravity center \
           -background black +polaroid anno_polaroid.png
```

[[image:http://www.imagemagick.org/Usage/annotating/anno_polaroid.png caption="http://www.imagemagick.org/Usage/annotating/anno_polaroid.png"]]

outro exemplo

``` sh
convert dragon.jpg \
          -size 1x18 xc:Yellow  -background Yellow  -append \
          -gravity South -draw "text 0,0 'Faerie Dragon'" \
          anno_append.jpg
```

[[image:http://www.imagemagick.org/Usage/annotating/anno_append.jpg caption="http://www.imagemagick.org/Usage/annotating/anno_append.jpg"]]

 ``` sh
 convert dragon.jpg \
          -fill '#0008' -draw 'rectangle 5,128,114,145' \
          -fill white   -annotate +10+141 'Faerie Dragon' \
          anno_dim_draw.jpg
 ```

[[image:http://www.imagemagick.org/Usage/annotating/anno_dim_draw.jpg caption="http://www.imagemagick.org/Usage/annotating/anno_dim_draw.jpg"]]

### Modificação Seletiva

Num dos artigos citados abaixo peguei uma dica para modificar apenas arquivos com um determinado tamanho.

    identify -format '%f %wx%h n' *.jpg

### convertendo para escala de cinza

    convert test.jpg -modulate 100,0 grey_test.jpg

Para colocar muitas imagens em escala de cinza faça:
``` sh
for i in *; do
    convert $i -modulate 100,0 grey_$i
done
```

### Convertendo muitas imagens

    mogrify -format jpg *.gif

### Criando uma miniatura (trumbnail)
    convert -sample 25%x25% input.jpg output.jpg

Para fazer isto em um grupo de imagens faça:

``` sh
for img in `ls *.jpg`
do
convert -sample 25%x25% $img thumb-$img
done
```

### resolvendo o problema das fontes
* http://russia.shaps.hawaii.edu/software/add-to-im.html
* http://www.dicas-l.com.br/dicas-l/20050720.php

Para adicionar legendas em fotos acredito que seja mais adequado fonte de cor
branca circundada por uma borda preta, dessa maneira, não importa qual a imagem
sob a legenda, o texto sempre estará legível.

Isso pode ser conseguido com o comando:

``` sh
convert -font helvetica -fill white -stroke black            \
  -pointsize 12 -draw 'text 10,10 "Fulaninho da Silva - 2005"' \
  -stroke none -draw 'text 10,10 "Fulaninho da Silva - 2005"'  \
  imagem.jpg imagemlegendada.jpg
```

### coloando texto em imagens
* http://www.imagemagick.org/Usage/annotating/

``` sh
convert -caption "Faerie Dragon" dragon.jpg -gravity center \
           -background black +polaroid anno_polaroid.png
```

[[image:http://www.imagemagick.org/Usage/annotating/anno_polaroid.png caption="http://www.imagemagick.org/Usage/annotating/anno_polaroid.png"]]

### outro exemplo

``` sh
convert dragon.jpg \
          -size 1x18 xc:Yellow  -background Yellow  -append \
          -gravity South -draw "text 0,0 'Faerie Dragon'" \
          anno_append.jpg
```

[[image:http://www.imagemagick.org/Usage/annotating/anno_append.jpg caption="http://www.imagemagick.org/Usage/annotating/anno_append.jpg"]]

``` sh
convert dragon.jpg \
         -fill '#0008' -draw 'rectangle 5,128,114,145' \
         -fill white   -annotate +10+141 'Faerie Dragon' \
         anno_dim_draw.jpg
```

[[image:http://www.imagemagick.org/Usage/annotating/anno_dim_draw.jpg caption="http://www.imagemagick.org/Usage/annotating/anno_dim_draw.jpg"]]

### Modificação Seletiva

Num dos artigos citados abaixo peguei uma dica para modificar apenas arquivos com um determinado tamanho.

    identify -format '%f %wx%h n' *.jpg

### convertendo para escala de cinza

    convert test.jpg -modulate 100,0 grey_test.jpg

### Para colocar muitas imagens em escala de cinza faça:
``` sh
for i in *; do
convert $i -modulate 100,0 grey_$i
done
```

### Convertendo muitas imagens

    mogrify -format jpg *.gif

###Criando uma miniatura (trumbnail)

    convert -sample 25%x25% input.jpg output.jpg

###Para fazer isto em um grupo de imagens faça:

``` sh
for img in `ls *.jpg`
    do
    convert -sample 25%x25% $img thumb-$img
done
```

### Redimensionando fotos e modificando a resolução rapidinho

``` sh
    #!/bin/bash
    # Script para redimensionar e modificar
    # a qualidade de fotos
    #
    # Agradecimentos: JFMitre
    # http://jfmitre.blogspot.com/2006/05/imagemagick-convert.html

    # Renomeando as fotos para tirar os espaços

    for i in *.jpg; do mv "$i" `echo $i | tr ' ' '_'`; done

    for i in *.jpg; do
    convert -quality 70 -resize 30% $i $i-70.jpg;
    done
```

### Para fazer isto em uma única linha:

      convert -quality 70 -resize 10% *.jpg images.jpg

### Para fazer uma montagem

       montage *.jpg -shadow -geometry +10+10 montagem.jpg

### redimensionamento simples

    mogrify -geometry 800x600 *.jpg
    # -geometry (preserves values of height and width given, and aspect ratio)

    mogrify -resize 640x480! *.jpg

### Redimensionando apenas

    mogrify -resize 1024x768! *.jpg

### Rotacionando uma imagem

    convert -rotate 90 input.jpg output.jpg

### Criando uma montagem

    montage *.jpg -shadow -geometry +10+10 montagem.jpg

### Criando bordas em imagens com o comando convert

    convert -border 2x2 old.jpg new.jpg

outra opção

    convert -border 2x2 -bordercolor "#FF0000" old.jpg new.jpg

### Para colocar bordas em muitas imagens faça
``` sh
for i in *; do
    convert -border 10x10 -bordercolor "#000000" $i border_$i
done
```

Ou ainda

    convert -border 50x50 -bordercolor "#ffffff" *.jpg images.jpg

### Exibindo um grupo de imagens

    display *.jpg

para visualizar a próxima imagem pressione a barra de espaços

### Capturando um screenshot (imagem de tela)

    sleep 5; import -window root tela.png
    sleep 5; import -window root tela.png; gimp tela.png

O 'sleep' faz o sistema esperar 5 segundos, o suficiente para abrir-mos o menu
ou programa, edite de acordo com sua necessidade, ao final chamamos o gimp já
editando a imagem capturada.

### Artigo sobre imagemagick

mogrify pode ser usado para colocar bordas em um arquivo e muitas outras operações

### colocando texto na imagem

``` sh
convert -font helvetica -fill white -pointsize 36
-draw 'text 10,50 "Floriade 2002, Canberra, Australia"'
floriade.jpg comment.jpg
```

### Flip: inverte a posição da foto na vertical:

      convert -flip foto_source.jpg foto_dest.flip.jpg

### Flop: inverte a direção da foto na horizontal (espelhamento):

      convert -flop foto_source.jpg foto_dest.flop.jpg

No site: http://linuxbr.stikipad.com/slackware/show/Dicas+do+ImageMagick

Encontrei mais um detalhe interessantes do comando convert, veja o trecho que recortei:
``` sh
for i in *.png; do convert -antialias -font "helvetica-narrow"
-fill red -pointsize 30
```

# Renomeando as fotos para tirar os espaços
for i in *.jpg; do mv "$i" `echo $i | tr ' ' '_'`; done

for i in *.jpg; do
convert -quality 70 -resize 30% $i $i-70.jpg;
done

Para fazer isto em uma única linha:

  convert -quality 70 -resize 10% *.jpg images.jpg

Para fazer uma montagem

   montage *.jpg -shadow -geometry +10+10 montagem.jpg

### redimensionamento simples

mogrify -geometry 800x600 *.jpg
# -geometry (preserves values of height and width given, and aspect ratio)

mogrify -resize 640x480! *.jpg

### Redimensionando apenas

mogrify -resize 1024x768! *.jpg

### Rotacionando uma imagem
convert -rotate 90 input.jpg output.jpg

### Criando uma montagem

montage *.jpg -shadow -geometry +10+10 montagem.jpg

### Criando bordas em imagens com o comando convert
convert -border 2x2 old.jpg new.jpg
outra opção
convert -border 2x2 -bordercolor "#FF0000" old.jpg new.jpg

Para colocar bordas em muitas imagens faça
for i in *; do
convert -border 10x10 -bordercolor "#000000" $i border_$i
done

Ou ainda
convert -border 50x50 -bordercolor "#ffffff" *.jpg images.jpg

### Exibindo um grupo de imagens
display *.jpg
para visualizar a próxima imagem pressione a barra de espaços

### Capturando um screenshot (imagem de tela)
sleep 5; import -window root tela.png
sleep 5; import -window root tela.png; gimp tela.png

O 'sleep' faz o sistema esperar 5 segundos, o suficiente para abrir-mos o menu
ou programa, edite de acordo com sua necessidade, ao final chamamos o gimp já
editando a imagem capturada.

### Artigo sobre imagemagick
mogrify pode ser usado para colocar bordas em um arquivo e muitas outras operações

### colocando texto na imagem

convert -font helvetica -fill white -pointsize 36
-draw 'text 10,50 "Floriade 2002, Canberra, Australia"'
floriade.jpg comment.jpg

Flip: inverte a posição da foto na vertical:

  convert -flip foto_source.jpg foto_dest.flip.jpg

Flop: inverte a direção da foto na horizontal (espelhamento):

  convert -flop foto_source.jpg foto_dest.flop.jpg

No site: http://linuxbr.stikipad.com/slackware/show/Dicas+do+ImageMagick

Encontrei mais um detalhe interessantes do comando convert, veja o trecho que<br>
recortei: <br>
<verbatim>
for i in *.png; do convert -antialias -font "helvetica-narrow"
-fill red -pointsize 30

* adicionar bordas e sombras a imagens
http://www.dicas-l.com.br/arquivo/acrescentar_sombras_e_bordas_a_imagens_com_imagemagick.php
