##como baixar videos do youtube com melhor qualidade?
*
##comando para atualizar o youtube-dl

  sudo pip3 install youtube-dl --upgrade

## Baixando de uma lista 
   Se você tem um arquivo com as url's use:

     youtube-dl -a links.txt

##preservando o título do vídeo

	youtube-dl -t link

## Limiting bandwidth

    youtube-dl -r 30k https://www.youtube.com/watch\?v\=XnrAM9QZ90U

    youtube-dl  --rate-limit 20k

##determinando a qualidade do video a ser baixado
Pesquise neste link http://en.wikipedia.org/wiki/YouTube#Quality_and_codecs
OBS: Por padrão o youtube-dl irá baixar o video na melhor qualiade possível

	youtube-dl -f 34 "http://www.youtube.com/watch?v=2_VFKqw1q2Q"

##baixando video com legenda


    youtube-dl --write-srt --sub-lang en LINK

    Você pode criar um arquivo de configuração ...

        vim .config/youtube-dl.conf

    e nele colocar as opções que desejar, caso queira ignorar
    o arquivo de configuração você pode colocar a seguinte opção
    na linha de comando:

        --ignore-config

##convertendo videos do youtube para mp3
Fonte:

	youtube-dl -t --extract-audio --audio-format mp3 YOUTUBE_URL_HERE

##baixar um playlist completo
Antes de executar o comando certifique-se que a versão do youtube-dl é a mais nova

	youtube-dl -U

Agora pode executar algo como...

	youtube-dl -cit http://www.youtube.com/playlist?list=PLBACC77E2173B4280&feature=mh_lolz

