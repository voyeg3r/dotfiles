# Arquivo: dicas sobre python

```
Criado: Ter 18/Dez/2012 hs 18:57
Last Change: dom 08 jan 2017 12:03:28 BRT
autor: Sérgio Luiz Araújo Silva
site: vivaotux
twitter: voyeg3r
email: voyeg3r -- gmail
```

Curso do professor Ronaldo Ramos no Youtube: http://goo.gl/n4NxP

### python keylogger
+ https://sourceforge.net/p/pyhook/wiki/PyHook_Tutorial/
+ http://www.thesnoopybub.com/blog/basic-keylogger-in-ubuntu/
+ https://lifestohack.com/how-to-make-very-simple-keylogger/
+ http://www.codelecture.com/wp/python-3-keylogger-w-subs/
+ https://github.com/theju/linux-keylogger/blob/master/keylogger.cpp
+ http://www.tecmint.com/how-to-monitor-keyboard-keystrokes-using-logkeys-in-linux/
+ http://porterhau5.com/blog/xkeyscan-parse-linux-keylogger/
+ https://github.com/porterhau5/xkeyscan
+ https://github.com/kernc/logkeys
+ http://www.securitybydefault.com/2013/09/listado-de-keyloggers-windows-linux.html
+ http://jeffhoogland.blogspot.com.br/2014/10/pyhook-for-linux-with-pyxhook.html

### Invertendo uma lista no python3
+ https://dbader.org/blog/python-reverse-list
Se tentar-mos usar "reversed" diretamente o python criará um objeto
como se vê no código a seguir...

    >>> reversed(mylist)
    <list_reverseiterator object at 0xb71a584c>

No entanto se chamar-mos a mesma função dentro de "list()"
obteremos o resultado desejado.

    >>> list(reversed(mylist))
    [5, 4, 3, 2, 1]

### Consertando legengas srt com python

source: http://tuxbalaji.wordpress.com/2013/10/05/how-to-fix-subtitles-delay-or-ealier-with-your-movies-by-python-code/

``` python
>>> subs.shift(seconds=-2) # Move all subs 2 seconds earlier
>>> subs.shift(minutes=1)  # Move all subs 1 minutes later
```

Passando parâmetro para o script

		import sys
		str(sys.argv[1])

``` python
#! usr/bin/python
import pysrt
subs=open("/home/bala/Pirates of the Caribbean -The Curse of the Black Pearl(2003).srt")
subs.shift(minutes=-2) # Move all subs 2 minutes earlier
subs.save('/home/bala/new.srt', encoding='utf-8')#saves file with new.srt in your home directory
```

### baixando legendas com o subliminal

# no caso do ubuntu ou debian use...

    sudo apt-get install python-pip
    sudo pip install subliminal

    subliminal -l en -- The.Big.Bang.Theory.S05E18.HDTV.x264-LOL.mp4



