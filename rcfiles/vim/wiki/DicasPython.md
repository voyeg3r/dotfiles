Arquivo: dicas sobre python
Criado: Ter 18/Dez/2012 hs 18:57
Last Change: dom 08 jan 2017 12:03:28 BRT
autor: Sérgio Luiz Araújo Silva
site: vivaotux
twitter: voyeg3r
email: voyeg3r -- gmail

{{{

Curso do professor Ronaldo Ramos no Youtube: http://goo.gl/n4NxP

### Consertando legengas srt com python

source: http://tuxbalaji.wordpress.com/2013/10/05/how-to-fix-subtitles-delay-or-ealier-with-your-movies-by-python-code/

>>> subs.shift(seconds=-2) # Move all subs 2 seconds earlier
>>> subs.shift(minutes=1)  # Move all subs 1 minutes later

Passando parâmetro para o script

		import sys
		str(sys.argv[1])

#! usr/bin/python
import pysrt
subs=open("/home/bala/Pirates of the Caribbean -The Curse of the Black Pearl(2003).srt")
subs.shift(minutes=-2) # Move all subs 2 minutes earlier
subs.save('/home/bala/new.srt', encoding='utf-8')#saves file with new.srt in your home directory

### baixando legendas com o subliminal

# no caso do ubuntu ou debian use...

    sudo apt-get install python-pip
    sudo pip install subliminal

    subliminal -l en -- The.Big.Bang.Theory.S05E18.HDTV.x264-LOL.mp4



[[}}}]]
