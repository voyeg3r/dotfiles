# dicas Sobre python3

``` markdown
File:		 Python3.md
Created:	 sáb 07 jan 2017 07:29:27 BRT
Last Change: ter 10 jan 2017 15:50:19 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

### References
+ http://excript.com/curso-de-python.html
+ [curso-completo](https://youtu.be/j94IGZmwtYI?list=PLesCEcYj003QxPQ4vTXkt22-E11aQvoVj)
+ [lista de aulas](http://excript.com/curso-de-python.html)
+ http://www.discoversdk.com/blog/10-interesting-python-modules-to-learn-in-2016
+ https://www.youtube.com/watch?v=1F_OgqRuSdI
+ https://www.youtube.com/watch?v=ve2pmm5JqmI (renaming files)
+ https://www.youtube.com/channel/UCI0vQvr9aFn27yR6Ej6n5UA
+ https://dbader.org/
+ [f-string](https://cito.github.io/blog/f-strings/)
+ https://pyformat.info/
+ [python para zumbis](https://www.youtube.com/watch?v=_OQEcuGHrxQ)
+ [python para zumbis playlist youtube](https://www.youtube.com/watch?v=6La690qlH5w&list=PLUukMN0DTKCtbzhbYe2jdF4cr8MOWClXc)
+ [python para zumbis site oficial](https://www.pycursos.com/python-para-zumbis/)
+ [socratica python computing science](https://www.youtube.com/playlist?list=PLi01XoE8jYohWFPpC17Z-wWhPOSuh8Er-)

### Dictionary comprehension
+ [about dictionaries](https://www.tutorialspoint.com/python3/python_dictionary.htm)

``` python
first2pairs = {k: mydict[k] for k in mydict.keys()[:2]}
```



### Counting words in a file

``` markdown
with open('alice.txt', 'r') as f:
        f = f.read().lower().split()

result = {i:f.count(i) for i in f if i == 'alice'}

print(f'Alice aparece {result["alice"]} vezes no texto')
```

### Manipulating strings
+ [Read more here](https://docs.python.org/3/reference/lexical_analysis.html#f-strings)
``` python
# only for python 3.6 and above

>>> origin = "London"
>>> destination = "Paris"
>>> f"from {origin} to {destination}"
'from London to Paris'
```

**Padding** (preenchimento)

``` python
# preenche com espaço depois
'{:>10}'.format('test')

# o oposto
'{:10}'.format('test')

'{:_>10}'.format('test')
test__________

# esta opção centraliza
'{:^10}'.format('test')

# Adiciona espaços à esquerda
'{:4d}'.format(42)

# adiciona zeros à esquerda
'{:03d}'.format(55)
```

``` python
names = ["Trey", "Brantly", "Kojo", "Diane"]
"{names[0]} is a name, so is {names[1]} and {number} is a number".format(names=names, number = 45)
'Trey is a name, so is Brantly and 45 is a number'
```
Another way to do the same and more readable is doing this:

``` python
names = ["Trey", "Brantly", "Kojo", "Diane"]
"{} is a name, so is {} and {number} is a number".format(*names, number = 45)
'Trey is a name, so is Brantly and 45 is a number'
```

``` python
name = 'Jose'
"{name!r} is a name".format(name=name)
"'Jose' is a name"
```


### Truncar uma string - Truncating long strings

``` python
'{:.5}'.format('xylophone')
```
### Format numbers printing

 ``` python
 '{:d}'.format(42)

'{:f}'.format(3.141592653589793)
 ```


``` python
# transforma caracteres para chinês
def esconde(msg):
    s = ''
    for c in msg: s += chr(ord(c) + 30000)
    return s

def mostra(msg):
    s = ''
    for c in msg: s += chr(ord(c) - 30000)
    return s
```

colocando zeros à esquerda - leading zeros
``` python
text = "22"
print(text.zfill(4))
0022
```
For numbers
``` python
print('{0:03d}'.format(4))
```

** Formatting options **
``` python
person = {'name': 'Jenn', 'age': 23}
sentence = 'My name is {} and I am {} years old.'.format(person['name'], person['age'])
print(sentence)

person = {'name': 'Jenn', 'age': 23}
sentence = 'My name is {0} and I am {1} years old.'.format(person['name'], person['age'])
print(sentence)

person = {'name': 'Jenn', 'age': 23}
sentence = 'My name is {0[name]} and I am {0[age]} years old.'.format(person)
print(sentence)

l = ['Jenn', 23]
sentence = 'My name is {0[0]} and I am {0[1]} years old.'.format(l)

# another example
tag = 'h1'
text = 'This is a headline'

sentence = '<{0}>{1}</{0}>'.format(tag, text)
print(sentence)


class Person():

    def __init__(self, name, age):
        self.name = name
        self.age = age

p1 = Person('Jack', '33')

sentence = 'My name is {0.name} and I am {0.age} years old.'.format(p1)
```

Using kwords
``` python
sentence = 'My name is {name} and I am {age} years old.'.format(name='Jenn', age='30')
print(sentence)
```
Umpacking dictionaries
``` python
person = {'name': 'Jenn', 'age': 23 }
sentence = 'My name is {name} and I am {age} years old.'.format(**person)
```
Formatting numbers print
``` python
for i in range(1,11):
    sentence = 'The value is {}'.format(i)
    print(sentence)
```

``` python
for i in range(1,11):
    sentence = 'The value is {:02}'.format(i)
    print(sentence)
```

**Printing decimal numbers**
``` python
import math
pi = math.pi

sentence = 'Pi is equl to {:.2f}'.format(pi)
```

** Printing dates **
``` python
import datetime
my_date = datetime.datetime(2006, 9, 24, 12, 30, 45)
sentence = '{:%B %d, %Y}'.format(my_date)

Semptember 24, 2016
```


``` python
import datetime

my_date = datetime.datetime(2006, 9, 24, 12, 30, 45)

sentence = '{0:%B %d, %Y} fell on a {0:%A} and was the {0:%j} day of the year'.format(my_date)
print(sentence)
```

**getting pipe input**

    python3 -c 'import sys; print( sys.stdin.read().lower() )'

### Removing accents

``` python
import sys
import sunicodedata

s = u"Klüft skräms inför på fédéral électoral große"
print(unicodedata.normalize('NFKD', s).encode('ascii','ignore'))
```

### counting words in python
+ https://gist.github.com/voyeg3r/25247763865f0cd7b5a12691fe94c222

``` python
# file use to count words: http://www.gutenberg.org/cache/epub/11/pg11.txt
# lynx -dump http://www.gutenberg.org/cache/epub/11/pg11.txt > alice.txt

with  open('alice.txt', 'r') as f:
    texto = f.read().lower()

import string
for c in string.punctuation:
    texto = texto.replace(c, ' ')

texto = texto.split()

dic = {}
for p in texto:
    if p not in dic:
        dic[p] = 1
    else:
        dic[p] += 1

print(f'Alice aparece {dic["alice"]} vezes no texto')

```

### Better completion at console
+ https://github.com/jonathanslenders/ptpython/
+ http://brandon.invergo.net/news/2014-03-21-Enhancing-the-Python-interpreter-with-a-start-up-script.html

    sudo pip install ptpython
    sudo pip install ipython
    sudo pip install prompt_toolkit
    sudo pip install pyreadline

Embedding the REPL in any Python application is easy:

    from ptpython.repl import embed
    embed(globals(), locals())

### Python libs
+ [manipulatin strings](https://docs.python.org/2/library/string.html)
+ [natural sorting](https://pypi.python.org/pypi/natsort)
+ [clipboard manipulation](https://pypi.python.org/pypi/pyperclip)
+ [python3 libs](https://pypi.python.org/pypi?:action=browse&c=533&show=all)
+ os module
+ [memory cache] from functools import lru_cache
+ [fix code layout] pip install flake8
+ [srt translator] sudo pip install pysrttranslator
+ [open excel spreadsheets] openpyxl

3y g00 *pi 畱畹疪疑疃疩畲畽略畤疉疏疠疨疪疒疣畨疩疡畲疖畨疢疤疥疟畱畽疣疂疚畦疙畦疇疦畣疧

### fixing code layout

    flake8 file.py

** Os Mudule **

``` python
import os
print(dir(os))
```

**Natual sorting list items**

    sudo pip install natsort


When you try to sort a list of strings that contain numbers, the normal python
sort algorithm sorts lexicographically, so you might not get the results that
you expect:

``` python
a = ['a2', 'a9', 'a1', 'a4', 'a10']
sorted(a)
['a1', 'a10', 'a2', 'a4', 'a9']
```


Notice that it has the order (‘1’, ‘10’, ‘2’) - this is because the list is
being sorted in lexicographical order, which sorts numbers like you would
letters (i.e. ‘b’, ‘ba’, ‘c’).

natsort provides a function natsorted that helps sort lists “naturally”, either
as real numbers (i.e. signed/unsigned floats or ints), or as versions. Using
natsorted is simple:

``` python
from natsort import natsorted
a = ['a2', 'a9', 'a1', 'a4', 'a10']
natsorted(a)
['a1', 'a2', 'a4', 'a9', 'a10']
```
### Reading files

Using this approach the file is automatically closed
``` python
with open('test.txt' 'r') as f:
    f_contents = f.read()
    print(f_contents)
```

This way we can iterate over all lines
without risk of getting an error
``` python
with open('test.txt' 'r') as f:

    for line in f:
        print(line, end='')
```

[source](https://www.youtube.com/watch?v=Uh2ebFW8OYM)
``` python
with open('test.txt', 'r') as rf:
    with open('test_copy.txt', 'w') as wf:
        for line in rf:
            wf.write(line)
```
In case of binary files like images we have to use binary mode

### Natural sorting filenames
[stackoverflow](http://stackoverflow.com/q/4836710/)

DOES PYTHON HAVE A BUILT IN FUNCTION FOR STRING NATURAL SORT?

Using Python 3.x, I have a list of strings for which I would like to perform
a natural alphabetical sort.

Natural sort: The order by which files in Windows are sorted.
For instance, the following list is naturally sorted (what I want):

    ['elm0', 'elm1', 'Elm2', 'elm9', 'elm10', 'Elm11', 'Elm12', 'elm13']

And here's the "sorted" version of the above list (what I have):

    ['Elm11', 'Elm12', 'Elm2', 'elm0', 'elm1', 'elm10', 'elm13', 'elm9']

I'm looking for a sort function which behaves like the first one.


``` python
data = ['elm13', 'elm9', 'elm0', 'elm1', 'Elm11', 'Elm2', 'elm10']
```

Let's analyse the data. The digit capacity of all elements is 2. And there are
3 letters in common literal part 'elm'. So, the maximal length of element is 5.
We can increase this value to make sure (for example, to 8).

Bearing that in mind, we've got a one-line solution:

    data.sort(key=lambda x: '{0:0>8}'.format(x).lower())

without regular expressions and external libraries!

    print(data)

    >>> ['elm0', 'elm1', 'Elm2', 'elm9', 'elm10', 'Elm11', 'elm13']

Explanation:

``` python
for elm in data:
    print('{0:0>8}'.format(elm).lower())

>>>
0000elm0
0000elm1
0000elm2
0000elm9
000elm10
000elm11
000elm13
```


### Renaming files
[from stackoverflow](http://stackoverflow.com/q/2759067/)

Say I have a file called CHEESE_CHEESE_TYPE.*** and want to remove CHEESE_ so
my resulting filename would be CHEESE_TYPE


Assuming you are already in the directory, and that the "first 8 characters"
from your comment hold true always. (Although "CHEESE_" is 7 characters... ? If
so, change the 8 below to 7)

``` python
from glob import glob
from os import rename
for fname in glob('*.prj'):
    rename(fname, fname[8:])
```


``` python
import os
for fileName in os.listdir("."):
    os.rename(fileName, fileName.replace("CHEESE_CHEESE_", "CHEESE_"))
```


``` python
import os
for dpath, dnames, fnames in os.walk('/path/to/directory'):
    for f in fnames:
        os.chdir(dpath)
        if f.startswith('cheese_'):
            os.rename(f, f.replace('cheese_', ''))
```

### Regex in python

``` python
def strip_html(text):
    """Remove todo o html de uma determinada string. [2]
    """
    import re
    s = re.sub('<[^>]*>', '', text)
    return s
```

### Getting rid of string punctuation

``` python
s = "Uma string com set's ação e à erros!"

exclude = set(string.punctuation)
s = ''.join(ch for ch in s if ch not in exclude)
```

Another method

``` python
string = "Special $#! characters   spaces 888323"
''.join(e for e in string if e.isalnum())
'Specialcharactersspaces888323'
```

One more

``` python
import re
cleanString = re.sub('\W+','', string )
```



#### curso completo no youtube

* [canal ignorancia zero](https://www.youtube.com/channel/UCmjj41YfcaCpZIkU-oqVIIw)
* [python course in English](https://www.youtube.com/watch?v=R6wQmWMDiB4)
* [aula 001](https://www.youtube.com/watch?v=sC6mqcLSkZo&index=2&list=PLfCKf0-awunOu2WyLe2pSD2fXUo795xRe)
* [another course](https://www.youtube.com/watch?v=f6ji-QcOo_U)
* [another one](https://www.youtube.com/watch?v=QSzqiGeyU5s)
* [Programming Foundations with Python](https://www.youtube.com/watch?v=X0FoelOIZM0&list=PLAwxTw4SYaPnYajEbZvqtcVWQ6XGhvtOW)
* [Zero to Hero with Python Tutorial FULL Easy](https://www.youtube.com/watch?v=TV9tSHFAFjg)
* [livro think python](https://upload.wikimedia.org/wikipedia/commons/1/1b/Think_Python.pdf)
* [byte of python](http://files.swaroopch.com/python/byte_of_python.pdf)

### um desafio interessante baseado em python2
**Learn Python Through Public Data Hacking**

* [PyCon 2013 Video](http://pyvideo.org/pycon-us-2013/learn-python-through-public-data-hacking.html)
* http://www.dabeaz.com/pydata/
* https://www.youtube.com/watch?v=RrPZza_vZ3w

#### to be able to import turtle in python
[read on this link](https://opentechschool.github.io/python-beginners/en/simple_drawing.html)

    sudo pacman -S community/python-pmw

#### assigning a range or printing

    To print a list [1, 3, 5, 7, 9, 11]

    print(list(range(1,12,2)))

#### Converting python2 to python3

   2to3 python2script.py

   to write changes use -w

   2to3 -w python2script.py

#### Access to the clipboard

    import pyperclip

#### print clipboard contente

``` python
pyperclip.paste()
var = pyperclip.paste()
print(var)
```

#### random numbers

``` python
iport random
random_num=random.randrange(0,100)

while(random_num != 15):
    print(random_num)
    random_num = random_num.range(0,100)
```

** Sorteando um número de uma lista **
``` python
from random import choice
l = rnage(100)
print(choice(l))
```

#### addnumbers function

``` python
def addNumber(fNum, lNum):
    sumNum = fNum + lNum
    return sumNum

print(addNumber(1,4))
```

#### Getting user input

``` python
import sys
print('What is your name?')
name = sys.stadin.readline()
print('Hello', name)
```

### Manipulation the clipboard
+ https://github.com/asweigart/pyperclip

On Linux, this module makes use of the `xclip` or `xsel` commands, which should
come with the os. Otherwise run "`sudo apt-get install xclip`" or
"`sudo apt-get install xsel`" (Note: xsel does not always seem to work.)

``` python
import pyperclip
pyperclip.copy('The text to be copied to the clipboard.')
pyperclip.paste()
'The text to be copied to the clipboard.'
```

### Métodos comuns a str and list


``` python
sorted(set(dir('abc')) & set(dir([])) )

['__add__', '__class__', '__contains__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'count', 'index']

```

### Print list items in python3

``` python
l = range(100)
print(*l)

# imprime valores como string não como lista
```

``` python
from random import shuffle

l = list(range(100))
shuffle(l) #  << shuffle before print or assignment
print(l)

[67, 12, 44, 86, 39, 74, 36, 70, 1, 14, 90, 71, 47, 81, 41, 95, 92, 15, 7, 17, 9, 85, 25, 10, 34, 38, 24, 63, 52, 65, 66, 6, 43, 97, 54, 78, 77, 32, 35, 80, 8, 87, 5, 13, 73, 76, 82, 93, 26, 18, 79, 45, 46, 49, 2, 3, 96, 75, 40, 4, 61, 31, 55, 62, 37, 50, 30, 48, 22, 28, 23, 69, 56, 57, 20, 88, 53, 83, 64, 91, 21, 98, 51, 16, 94, 11, 72, 29, 27, 84, 59, 99, 68, 33, 0, 42, 60, 58, 89, 19]
```

### Dictionary comprehension

``` python
import string
{ c:ord(c) for c in string.ascii_letters }

{'a': 97, 'b': 98, 'c': 99, 'd': 100, 'e': 101, 'f': 102, 'g': 103, 'h': 104, 'i': 105, 'j': 106, 'k': 107, 'l': 108, 'm': 109, 'n': 110, 'o': 111, 'p': 112, 'q': 113, 'r': 114, 's': 115, 't': 116, 'u': 117, 'v': 118, 'w': 119, 'x': 120, 'y': 121, 'z': 122, 'A': 65, 'B': 66, 'C': 67, 'D': 68, 'E': 69, 'F': 70, 'G': 71, 'H': 72, 'I': 73, 'J': 74, 'K': 75, 'L': 76, 'M': 77, 'N': 78, 'O': 79, 'P': 80, 'Q': 81, 'R': 82, 'S': 83, 'T': 84, 'U': 85, 'V': 86, 'W': 87, 'X': 88, 'Y': 89, 'Z': 90}
```
