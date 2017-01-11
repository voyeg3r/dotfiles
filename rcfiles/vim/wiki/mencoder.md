### Introdução
MEncoder é uma ferramenta que usa linha de comando para codificação de vídeos sob a Licença Pública Geral GNU.
O MEncoder é distribuido juntamente com o MPlayer e permite converter de todos os formatos de vídeo aceitos pelo MPlayer para um grande número de outros. Possui diversos filtros de aúdio e vídeo para a manipulação dos arquivos.
Devido a enorme quantidade de opções o MEncoder pode parecer pouco amigável no começo, mas ele é uma ferramenta extremamente poderosa para conversão de vídeo. Alguns frontends foram desenvolvidos para torná-lo mais acessível. fonte Wikipedia.

### fix corrupted avi index

mencoder -forceidx -oac copy -ovc copy corruptvideo.avi -o fixedvideo.avi


### ripar dvd

mencoder dvd://1 -alang en -slang pt -oac mp3lame -lameopts \
mode=0:br=128:vol=10 -ovc lavc -lavcopts \
vcodec=msmpeg4:vbitrate=800 -vf lavcdeint,scale \
-zoom -xy 352 -o video.avi


### ogv to avi

mencoder -idx file.ogv -ovc lavc -oac mp3lame -o file.avi


### avi to mpeg

mencoder input.avi -of mpeg -ovc lavc -lavcopts vcodec=mpeg1video \ -oac copy other_options -o output.mpg



### converter rmvb para avi

mencoder -oac mp3lame -lameopts cbr=128 -ovc xvid -xvidencopts \
 bitrate=1200 inputfile.rmvb -o output.avi

### FLV to AVI with subtitles and forcing audio sync

mencoder -sub subs.ssa -utf8 -subfont-text-scale 4 -oac mp3lame \
 -lameopts cbr=128 -ovc lavc -lavcopts vcodec=mpeg4 -ffourcc xvid \
 -o output.avi YqC73omSk4o.flv

### Convert video type from mpg to wmv

mencoder -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1000:vhq -oac mp3lame -lameopts br=98 -o output.wmv input.mpg

### Convert virtually any video into a DVD-valid MPEG2 stream

mencoder -oac lavc -ovc lavc -of mpeg -mpegopts format=dvd -vf scale=720:480,harddup -srate 48000
-af lavcresample=48000 -lavcopts
codec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=9800:vbitrate=5000:keyint=18:aspect=16/9:acodec=ac3:abitrate=192
-ofps 30000/1001 -o output.mpg input.extension




mencoder -oac lavc -ovc lavc -of mpeg -mpegopts format=dvd -vf pp=lb,scale=720:480,harddup -srate 48000 -af lavcresample=48000 -lavcopts vcodec=mpeg2video:vrc_buf_size=10000:vrc_maxrate=9800:vbitrate=5000:keyint=18:acodec=ac3:abitrate=192 -ofps 30000/1001 -o ARQUIVO_DE_SAIDA.mpg ARQUIVO_DE_ORIGEM.rmvb


### converter rmvb para mpeg


mencoder name.rmvb -oac mp3lame -lameopts br=192 -ovc\
 lavc -lavcopts vcodec=mpeg4:vhq -o name.mpeg




mencoder -oac lavc -ovc lavc -of mpeg -mpegopts format=dvd:tsaf -vf scale=720:480,harddup\
 -srate 48000 -af lavcresample=48000 -lavcopts vcodec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=9800:vbitrate=5000:keyint=18:vstrict=0:acodec=ac3:abitrate=192:aspect=4/3\
 -ofps 30000/1001 -o $filmempeg $filme

### Referências
* http://www.ubuntudicas.com.br/?p=2288


