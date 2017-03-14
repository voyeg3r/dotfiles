### Introdução

``` markdown
File:		 pythonsolutions.md
Created:	 qua 11 jan 2017 14:21:22 BRT
Last Change: qua 11 jan 2017 14:21:29 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

# python keyword list

``` python
import keyword
keyword.kwlist
```

# Centralizando uma string no python 3

``` python
s = 'This is my string'
print(s.center(50, '-'))
----------------This is my string-----------------
```

# programando com janelas
* http://www.gustavobarbieri.com.br/eagle/docs/eagle-pt.html

* http://www.caiomoritz.com/2008/01/05/byte-of-python/
* http://www.lightbird.net/py-by-example/platform-module.html
* http://www.lightbird.net/py-by-example/index.html
* http://mail.python.org/pipermail/python-list/2002-August/159344.html
* http://svn.python.org/projects/python/branches/py3k-urllib/Lib/platform.py


### http server on python 3

    python3 -m http.server

### video sobre geração de números randomicos

* www.youtube.com/watch?v=6YweJ63XGGo
* www.youtube.com/watch?v=rp5srgJDozM

### Módulos para acesso a informações do windows

* win32api

### truncar string em N bytes sem truncar nenhuma palavra
+ http://stackoverflow.com/a/250373/2571881

``` python
import textwrap
textwrap.fill(u"string com texto bem maior que oitenta bytes de tamanho, jogar a palavra que está na coluna 80 para próxima linha", 80)
```

I actually wrote a solution for this on a recent project of mine. I've
compressed the majority of it down to be a little smaller.

``` markdown
def smart_truncate(content, length=100, suffix='...'):
    if len(content) <= length:
        return content
    else:
        # return ' '.join(content[:length+1].split(' ')[0:-1]) + suffix
        return content[:length].rsplit(' ', 1)[0]+suffix
```

What happens is the if-statement checks if your content is already less than
the cutoff point. If it's not, it truncates to the desired length, splits on
the space, removes the last element (so that you don't cut off a word), and
then joins it back together (while tacking on the '...').

### imprimir intervalo de linhas

``` python
fp = open("/tmp/file8", "w")
for i, line in enumerate(open("file.txt")):
    if i >= 26 and i < 99:
            fp.write(line)
```

### sequencia de fibonacci
* http://www.petercollingridge.co.uk/blog/python-fibonacci-generator-using-reduce

``` python
a = [1,1]
for i in range(10):
  a.append(a[-1] + a[-2])

a
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
```

### contar linhas de um arquivo
* http://stackoverflow.com/questions/845058/

``` python
def file_len(fname):
  counts = itertools.count()
  with open(fname) as f:
    for _ in f: counts.next()
		return counts.next()
```

# outro exemplo

    pythons = sum(1 for line in open('myfile.txt'))

### função map

``` python
>>> print map(lambda w: len(w), 'It is raining cats and dogs'.split())
[2, 2, 7, 4, 3, 4]

[ len(x) for x in 'It is raining cats and dogs'.split() ]
```

### somar linhas de um arquivo

    lista = ['34\n', '42\n', '11\n', '6\n', '2\n', '99\n', '\n']
    sum([int(i.strip()) for i in lista if i.strip().isdigit()])

    python -c "from fileinput import input; print sum(map(int, input()))" teste.txt

### builtin len

``` python
"minha string".__len__()
```

### remover caracteres de uma string

``` markdown
# fonte: lista python brasil
# Bom dia.
# Como faço para remover os parênteses de uma palavra ?
# Por exemplo :

# Tenho (201.8.205.113) e quero apenas 201.8.205.113
```

``` python
a = '(123.123.123)'
print a.strip('()')
'123.123.123'
```

``` python
"".join([ char for char in string if char not in '()' ])
```

### ler a primeira e ultima linhas de um arquivo

``` python
fp = open('file.txt','r')
data = fp.readlines()
fp.close()
print data[0],
print data[-1],
```

### verificar se há numeros repetidos em uma lista

O jeito mais simples de verificar se há valores repetidos é converter para set
e comparar se o tamanho muda. A explicação para isso é que set não permite itens
repetidos.

``` python
len(a) == len(set(a))
True
b = [1, 2, 3, 3, 4, 5]
len(b) == len(set(b))
False
```

### somente listar repetidos

``` python
[ i for i in set(lista) if lista.count(i) > 1 ]

print 'List has duplicate item %s' % [item for item in set(L) if L.count(item) > 1]

any(i for i in lista if lista.count(i) > 1)
```

### numeros primos
* fonte: http://code.activestate.com/recipes/117119-sieve-of-eratosthenes/

    >>> primes(range(2,40))
    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]

outra implementação bem legal

### imprimir sequencia de binarios

    for i in xrange(16): print '{0:04b}'.format(i)

### enviar e-mails

``` python
import sys, smtplib

fromaddr = raw_input("From: ")
toaddrs  = string.splitfields(raw_input("To: "), ',')
print "Enter message, end with ^D:"
msg = ''
while 1:
    line = sys.stdin.readline()
    if not line:
        break
    msg = msg + line
```

##### The actual mail send

``` python
server = smtplib.SMTP('localhost')
server.sendmail(fromaddr, toaddrs, msg)
server.quit()
```

### Ordenar uma matriz pelo segunda coluna

Vamos lá...

A decisão de usar lista.sort(...) ou sorted(...) é influenciada pela
sua decisão de querer
manter a lista original intacta. Se você usar o lista.sort(...), a
ordenação acontece na própria lista.

Quanto à duvida se você deve fazer cmp=.... ou key=...., veja o que diz o help:

"In general, the key and reverse conversion processes are much faster
than specifying an equivalent cmp function. This is because cmp is
called multiple times for each list element while key and reverse
touch each element only once."

Ou seja, a tua versão usando key=lambda x:x[1] é mais rápida.

Entretanto, você pode também fazer uso do módulo operator, que contém
diversas funcões implementadas em C e que, como o nome já diz, têm
alguma correspondência com os operadores do Python. Com isso você pode
ganhar um pouco mais de velocidade:

# imprimindo uma lista ordenada pelo tamanho

		print(sorted(colors, key=len))

### Ordenar strings pelo tamanho

    string.sort(key=len)

``` python
>>> print sorted("This is a test string from Andrew".split(), key=len)
['a', 'is', 'This', 'test', 'from', 'string', 'Andrew']
```

# Agradecimentos ao Rodrigo Hübner http://rodrigohubner.blogspot.com/

### imprimir tags populares do delicious

* instale o pydelicious

``` sh
sudo su -
easy_install -z http://pydelicious.googlecode.com/files/pydelicious%2Btools-0.5.3.zip
```

### Limpando a tela

# source: http://stackoverflow.com/questions/517970/

``` python
import os
def cls():
    os.system(['clear','cls'][os.name == 'nt'])
```

# now, to clear the screen

    cls()

### iteradores

``` python
>>> s = 'casa'
>>> it = iter(s)
>>> it.next()
... c
>>> it.next()
... a
```

### acessando favoritos do delicious usando a biblioteca pydelicios

    >> import pydelicious
    >>> populares = pydelicious.get_popular(tag="python")
    >>> print "\n".join([ x.get('url') for x in populares ])

### Como testar se existe uma chave em um dicionário?

    print d.get('key','not found')

### contar quantos numeros 9 existem entre 1 e 100

    str([x for x in xrange(1,101)]).count('9')

# ou

    str(range(1,1001)).count('9')

### Extranct range

``` python
>>> fp = open("/tmp/file8","w")
>>> for i,line in enumerate(open("file.txt")):
...     if i >= 26 and i < 99 :
...             fp.write(line)
```

### Snippets - códigos de exemplos prontos
* http://www.ubuntugeek.com/acire-browse-python-code-snippets-quickly-and-easily.html

### Print raw of 50 hyphens

# source: http://www.commandlinefu.com

     python -c 'print "-" * 50'

### imprimir itens de uma lista sem laço for

recent_presidents = ['George Bush', 'Bill Clinton', 'George W. Bush']
print 'The three most recent presidents were: %s.' % ', '.join(recent_presidents)
prints 'The three most recent presidents were: George Bush, Bill Clinton, George W. Bush.

### fizzbuzz
fonte: http://kodumaro.blogspot.com/2010/01/fizzbuzz.html

A brincadeira consiste em imprimir uma sequência de números, tradicionalmente de 1 a 100. Porém os números múltiplos de 3 devem ser substituídos por //fizz// e os números múltiplos de 5 por //buzz//. Os números que são divisíveis por 3 e por 5 devem ser substituídos por //fizzbuzz//.

    print "\n".join('fizzbuzz' if x%15==0 else 'fizz' if x%3==0 else 'buzz' if x%5==0 else str(x) for x in xrange(1, 101))

### atribuição condicional

    n1 = float(raw_input("Por favor digite o primeiro numero: "))
    n2 = float(raw_input("Por favor digite o segundo numero: "))

    resultado = 'O denominador não pode ser zero!' if n2 == 0 else 'Resultado: '+str(n1/n2)

    print resultado

Mais um exemplo

    x = 3 if (y == 1) else 2

``` python
>>> x
>>> x = 1 and 2 or 3
>>> 2
```

### Como uma atribuição condicional pode me ajudar?
Imagine a seguinte situação

``` python
if not minha_var:
    minha_var = 'default'
```

Que tal então fazer assim

    minha_var = minha_var or 'default'

### Imprimir as variáveis de ambiente

``` python
import os
print("\n".join([ "%s=%s" % (k,v) for k,v in os.environ.items()]))
```

### imprimir um intervalo de linhas

``` python
fp = open("/tmp/file8","w")
for i,line in enumerate(open("file.txt")):
    if i >= 26 and i < 99 :
        fp.write(line)
```

### Somar números em um arquivo

``` python
>>> sum = 0
>>> lines = open("/tmp/file.txt", "r").readlines()
>>> lines
['286\n', '255564800\n', '609\n', '146\n', '671290\n']
>>> for line in lines:
...     sum+=eval(line)
...
>>> sum
256237131
```

### testar se string contém substring

``` python
if 'word' in var:
    print "a variavel existe"
```

### impressão inusitada

recent_presidents = ['George Bush', 'Bill Clinton', 'George W. Bush']
print 'The three most recent presidents were: %s.' % ', '.join(recent_presidents)
# prints 'The three most recent presidents were: George Bush, Bill Clinton, George W. Bush.

### Numeros abaixo de um certo valor

    numbers = [1,2,3,4,5]
    numbers_under_4 = [number for number in numbers if number < 4]
    # Now, numbers_under_4 contains [1,2,3]

### nova forma de usar o print
* http://aprenda-python.blogspot.com/2009/10/nova-formatacao-de-strings.html

``` python
nome = 'Fernando'
sobrenome = 'Silva'
idade = 9
```

# Campo simples.

``` python
print "meu nome é %s" % (nome)
print "meu nome é {nome}".format(nome=nome)
```

# 2 campos mudando o nome da substituicao ("n" e "s").

``` python
print "meu nome completo é %s %s" % (nome, sobrenome)
print "meu nome completo é {n} {s}".format(n=nome, s=sobrenome)
```

# Numero com 2 algarismos e zero à esquerda.

``` python
print "minha idade é %02d anos" % (idade)
print "minha idade é {idade:02d} anos".format(idade=idade)
```

# Argumento posicional.

``` python
print "eu sou {0} e eu tenho {1} anos".format(nome, idade)
```

### Converter para minúsculas ou maiúsculas

```python
normal = open(”usuarios.txt”).read()
lower_string = normal.lower()
upper_string = normal.upper()
```

### Servidor simples http

    python -m SimpleHTTPServer

Disponibiliza o conteúdo do directório actual em http://$hostname:8000/
### Python: Introspeção de atributos e métodos com vars(), locals() e dir()

Para descobrir os atributos de um objeto podemos utilizar:

objeto.__dict__

vars(objeto)

Para descobrir os atributos de uma classe:

vars(Classe())

Se utilizar vars() sem argumentos, funciona como locals(), listando todas as variáveis.
Para listar métodos e atributos de um objeto:

dir(objeto)

### algoritmo de ordençaão bubblesort
* http://www.phpavancado.net/node/302

``` python
def bsort(a):
    sorted = False
    while not sorted:
        sorted = True
        for i in range(1, len(a)):
            if a[i-1] > a[i]:
                sorted = False
                t = a[i-1]
                a[i-1] = a[i]
                a[i] = t

a = [4,5,2,1,3,7,5]
print repr(a)
bsort(a)
print repr(a)
```

### atribuição condicional

    x = 3 if (y == 1) else 2

### testar se é número

    type("a")

``` python
def is_number(x):
    try:
        x + 1
        return True
    except TypeError:
        return False
```

Outro método
* python isinstance site:http://stackoverflow.com/

 ```python
 result = []
 for key, value in data.items():
    if isinstance(value, int):
        result.append(dict(name=key, value=value, type='int'))
    elif isinstance(value, float):
        result.append(dict(name=key, value=value, type='float'))
    elif isinstance(value, bool):
        result.append(dict(name=key, type='bool',
                           value=value and 'true' or 'false'))
 ```

Mais um exemplo

```python
>>> s = "A Simple String"
>>> print isinstance(s, basestring)
True
>>> print isinstance(s, dict)
False
>>>
```

``` python
if type(obj) is int:
    return True
else:
    return False
```

```python
if type(obj) is int
if type(obj) is str
if type(obj) is list
```

### testar o sistema operacional

```python
def get_memory_size():
   if platform.system() == "Linux":
     print "você está no GNU/Linux"
   elif platform.system() == "Windows":
     print "aprenda a usar GNU/Linux"
```

### detectar arquivos duplicados
fonte: http://stackoverflow.com/questions/748675/

``` python
import sys
import os
import hashlib
```

``` python
def chunk_reader(fobj, chunk_size=1024):
    """Generator that reads a file in chunks of bytes"""
    while True:
        chunk = fobj.read(chunk_size)
        if not chunk:
            return
        yield chunk
```

``` python
def check_for_duplicates(paths, hash=hashlib.sha1):
    hashes = {}
    for path in paths:
        for dirpath, dirnames, filenames in os.walk(path):
            for filename in filenames:
                full_path = os.path.join(dirpath, filename)
                hashobj = hash()
                for chunk in chunk_reader(open(full_path, 'rb')):
                    hashobj.update(chunk)
                file_id = (hashobj.digest(), os.path.getsize(full_path))
                duplicate = hashes.get(file_id, None)
                if duplicate:
                    print "Duplicate found: %s and %s" % (full_path, duplicate)
                else:
                    hashes[file_id] = full_path

if sys.argv[1:]:
    check_for_duplicates(sys.argv[1:])
else:
    print "Please pass the paths to check as parameters to the script"
```

### Argumentos
fonte: http://infog.casoft.info/?p=498

#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
for param in sys.argv :
    print(param)

No site citado acima há um desafio a ser cumprido

### conceitos

### Permutações
fontes:
* http://silveiraneto.net/tag/python/
* http://www.builderau.com.au/program/python/soa/Lazy-list-builders-Generators-in-Python/0,2000064084,339279708,00.htm

``` python
def all_perms(str):
    if len(str) <=1:
        yield str
    else:
        for perm in all_perms(str[1:]):
            for i in range(len(perm)+1):
                yield perm[:i] + str[0:1] + perm[i:]

>>> for p in all_perms(['a','b','c']):
    print p
['a', 'b', 'c']
['b', 'a', 'c']
['b', 'c', 'a']
['a', 'c', 'b']
['c', 'a', 'b']
['c', 'b', 'a']
```

outro exemplo

    [ (x,y) for x in palavra for y in palavra if x != y ]

### Mais um exemplo usando a biblioteca itertools
* http://stackoverflow.com/questions/104420/

    import itertools

``` python
print list(itertools.product([1,2,3], [4,5,6]))
[(1, 4), (1, 5), (1, 6),
(2, 4), (2, 5), (2, 6),
(3, 4), (3, 5), (3, 6)]

print list(itertools.product([1,2], repeat=3))
[(1, 1, 1), (1, 1, 2), (1, 2, 1), (1, 2, 2),
(2, 1, 1), (2, 1, 2), (2, 2, 1), (2, 2, 2)]
```

Outro exemplo:

``` python
def permute(items, i):
    items = items[:]
    n = len(items)
    m = factorial(n)
    while n:
        c = (i%m) * n / m
        yield items[c]
        items.pop(c)
        m /= n
        n -= 1
```

# Example:

``` python
>>> import permute
>>> items = [1,2,3]
>>> for i in range(permute.factorial(len(items))):
…     print list(permute.permute(items, i))
…
[1, 2, 3]
[1, 3, 2]
[2, 1, 3]
[2, 3, 1]
[3, 1, 2]
[3, 2, 1]
```

### Módulo para aleatoriedade
aleatório - embaralhando

#!/usr/bin/env python
# -*- coding: utf-8 -*-
# importando o módulo random
import random
# criando uma lista
lista = ["joão", "maria", "josé", "ana"]
# embaralhando a lista
random.shuffle(lista)
print(lista)

import random
randrange(1,10)

>>> random.choice('abcdefghij')  # Choose a random element
'c'

>>> print random.choice(['pergunta','duvida','discussao'])

# fonte: http://groups.google.com.br/group/python-em-portugues/browse_thread/thread/a8550e5c6857725c/9a47252ebad18b92?show_docid=9a47252ebad18b92

    >>> [ random.randint(1,100) for i in xrange(10)]
    [37, 15, 36, 57, 65, 87, 63, 26, 97, 13]

# fonte: python-brasil http://bit.ly/dAmCPC
# Se você estiver fazendo algo sério, e quiser uma implementação decente pra
# essa geração de um vetor aleatório, deveria usar o Numpy.
#
# Postei um benchmark das soluções propostas e adicionei uma utilizando o
# Numpy (http://paste.pocoo.org/show/187702/), seguem os tempos que deram para
# mim:
#
# Tempo total (teste #1): 10.1679s
# Tempo total (teste #2): 3.1838s
# Tempo total (teste #3): 9.7410s
# Tempo total (teste #4): 3.5267s
# Tempo total (teste #5): 0.1241s --> este é o tempo utilizando o Numpy
#
# - Christian S. Perone

from timeit import Timer
from random import randint, shuffle, randint, sample
from numpy.random import randint as numpy_randint

SIZE  = 200000
TIMES = 20

def test1():
   vetor = []
   for i in range(SIZE):
      i = randint(1, SIZE)
      vetor.append(i)

def test2():
    vetor = shuffle(range(1, SIZE+1))

def test3():
    vetor = [randint(1, SIZE) for i in xrange(1, SIZE+1)]

def test4():
    vetor = sample(xrange(SIZE),  SIZE)

def test5():
    vetor = numpy_randint(1, SIZE, SIZE)

def test_method(num, times):
    t = Timer("test%d()" % num, "from __main__ import test%d" % num)
    print "Tempo total (teste #%d): %.4fs" % (num, t.timeit(times))

if __name__=='__main__':
    [test_method(i, TIMES) for i in xrange(1,6)]

===parser===
Um Parser é um programa de computador (ou apenas um componente de um programa) que serve para analisar a estrutura gramatical de uma entrada, manipulando os tokens, que são segmentos de texto ou símbolos que podem ser manipulados. Em XML, o parser pode ser um leitor que ajuda na conversão do arquivo para manipulação dos dados contidos no mesmo.
Fonte: http://pt.wikipedia.org/wiki/Parser

### testar a existência de uma variável
* fonte: lista python brasil
Se você realmente precisa checar se uma VARIÁVEL foi criada antes, sua
lógica tem algum problema...

>>> try:

...     print c
... except NameError:
...     print "Essa variavel nao existe"

substitua o "print c" pelo bloco que vc que verificar a existencia da variavel
e o "print "Essa variavel nao existe" pela mensagem de erro caso ela nao exista.

Mas vou ser solidário... faz tempo, mas também cheguei no Python vindo
do PHP, e esta foi uma dúvida minha. Normalmente precisa-se checar
isto em chaves de arrays associativos (o que, em Python, chamamos de
dicionário ;-)). Se este for o seu caso - e eu torço para que sim, já
que nunca realmente precisei checar se uma variável existe no Python
-, sugiro o seguinte:

>>> x = {'a': 1, 'b': 2}
>>> x.has_key('a')
True
>>> x.has_key('d')
False

Mas o método has_key, se não me engano, será removido no Python 3k. O
jeito certo e novo de se fazer esta checagem é:

>>> x =  {'a': 1, 'b': 2}
>>> 'a' in x
True
>>> 'd' in x

Thiago F. Pappacena

As variáveis quando usadas vao para 'vars()'.

### ler arquivo csv e mostrar
fonte: http://aprenda-python.blogspot.com/2008/10/exemplo-3-ler-arquivo-csv-e-mostrar.html

1 """ Le um arquivo delimitado e mostra os campos na tela. """
2 import csv
3
4 print __doc__
5 f = csv.reader(open('fones.txt'), delimiter=';')
6 for [nome,nasc,fone] in f:
7     print 'nome=%s | nasc=%s | fone=%s' % (nome,nasc,fone)
8
9 print f.line_num, 'linhas lidas'
10 print '--- fim'

Vamos analisar o programa:

* Linha 2: importa o pacote csv necessário. Visite o link e veja alguns exemplos.
* Linha 4: veja a docstring. (Use-a sempre!).
* Linha 5: usa o método csv.reader(), dizendo que o arquivo é delimitado por ponto-e-vírgula.
* Linha 6: (o pulo do gato!) a iteração no retorno do csv.reader() retorna sempre uma lista. Portanto, eu disse ao iterator que queria jogar o resultado nas variáveis nome, nasc e fone.
* Linha 7: mostrando o conteúdo formatado.
* Linha 9: veja que temos um contador automático! :-D

### trocar extensão de arquivos

import os

target_dir = "."

for path, dirs, files in os.walk(target_dir):
    for file in files:
        filename, ext = os.path.splitext(file)
        new_file = filename + ".htm"

        if ext == '.html':
            old_filepath = os.path.join(path, file)
            new_filepath = os.path.join(path, new_file)
            os.rename(old_filepath, new_filepath)

1 '''Transforma string delimitada em lista'''
2
3 print __doc__
4 f = open('emails.txt')
5
6 emails = []
7 for linha in f:
8     emails.extend(email.lower().strip() for \
9         email in linha.split(';'))
10 f.close()
11
12 emails.sort()
13 for email in emails:
14     print email

### Mover arquivos
* fonte: lista python-br

shutil.move:

def move(src, dst):
     """Recursively move a file or directory to another location.

     If the destination is on our current filesystem, then simply use
     rename.  Otherwise, copy src to the dst and then remove src.
     A lot more could be done here...  A look at a mv.c shows a lot of
     the issues this implementation glosses over.

     """

     try:
         os.rename(src, dst)
     except OSError:
         if os.path.isdir(src):
             if destinsrc(src, dst):
                 raise Error, "Cannot move a directory '%s' into
itself '%s'." % (src, dst)
             copytree(src, dst, symlinks=True)
             rmtree(src)
         else:
             copy2(src,dst)
             os.unlink(src)

### Imprimindo uma sequência invertida

  for i in reversed(xrange(1,11)):

colors = list('red green blue yellow'.split())
for color in reversed(colors):
   print(color)

### imprimindo uma string invertida

s[::-1]

outro modo

a = ["Python", "Java", "Microsoft"]
a.reverse()

### Resolvendo problemas com acentuação
fonte: http://naotemmosquito.blogspot.com/2008/09/processando-texto-em-portugus-usando.html

>>> import locale
>>> locale.setlocale(locale.LC_CTYPE, ('pt_BR', 'iso8859-1'))
'pt_BR.ISO8859-1'
>>> print 'água'.capitalize()
Água

### regex - expressões regulares
Um caso em que não usamos regex por conta do desempenho

# No caso, o seu problema é:
# dado "TTqqcoisaAAA", eu quero tirar o "TT" do começo e tirar o "AAA" do final.
#"traduzindo" de português para python:

>>> "TTqqcoisaAAA".strip("TT").rstrip("AAA")

'qqcoisa'

Na verdade strip() e rstrip() removem caracteres e não sub-cadeias.
Nesse caso funciona, por coincidência.

Por exemplo:

>>> s = 'aposasopa'
>>> s.strip('apos')

''

Ops!

Abraços,
-- Nilton

Claramente, você tem um problema a resolver. Por pouco não tem dois!

Diz aí, esses prefixos são fixos? Se forem, basta

>>> "TTqqcoisaAAA"[len("TT"):-len("AAA")]

'qqcoisa'

> Obrigado

>> import re
 >> re.search('TT(.*)AAA','TTkkamsdkamslkdmalsmdAAA').groups()
('kkamsdkamslkdmalsmd',)

A[]'s

### combinando listas
fontes:
* http://bytes.com/forum/thread673891.html
* http://www.ibm.com/developerworks/library/l-prog.html

lista1=['1','2','3']
lista2=['4','5','6']
zip(lista1,lista2)

print [(x,y) for x in (1,2,3,4) for y in (10,15,3,22) if x*y > 25]

### Métodos de strings
* fonte: Eu podia estar matando
* http://defpython.blogspot.com/2007/01/trabalhando-com-strings_15.html

>>> 'www.google.com'.split('.')
['www', 'google', 'com']
>>> ‘19:16:23′.split(’:')
['19', '16', '23']
>>> hora, minuto, segundos = ‘19:16:23′.split(’:')
>>> hora
‘19′
>>> minuto
‘16′
>>> segundos
‘23′
#
# para juntar uma lista
# primeiro criamos a lista
lista = 'www.google.com'.split('.')
".".join(lista)

Em casos em que você receber uma data no estilo norte americano faça:

  "/".join(reversed(data_mysql.split("-")))

### formatando datas

import time
print time.localtime()
[2008,9,23,16,24,1,267,0]

# atribuindo datas de forma rápida
ano,mes,dia,hora,minuto,segundo=time.localtime()[:6]

# se quizer como string:
ano,mes,dia,hora,minto,segundo= [ str(x) for x in time.localtime()[:6] ]

ano, mes, dia, hora, minuto, segundo = time.strftime("%Y-%m-%d-%H-%M-%S").split("-")

data=time.strftime("%m-%d-%Y")
hora=time.strftime("%H:%M:%S")

### criando um timer

import time
time.sleep(10)

### Brincando com datas

>>> from datetime import date
>>> today = date.today()
>>> print "A data de hoje é %s" % today
A data de hoje é 2009-12-03
>>>
>>> today.year
2009
>>> today.month
12
>>> today.day
3

Hum, tá começando a ficar interessante..
vejam só o timetuple come ele temos uma maneira interessante de acessar os mesmos dados acima mas em uma tupla..

>>> today.timetuple()
(2009, 12, 3, 0, 0, 0, 3, 337, -1)

Ok digamos que eu queira saber quantos dias já se passaram esse ano?
fácil é o oitavo carinha da nossa tupla, então pra acessar podemos fazer simplesmente assim:

>>> today.timetuple()[7]
337
>>>

Ué mas eu não tinha dito o oitavo item?
sim disse mas lembrem-se que uma tupla assim como uma lista em python é indexada em 0!
podemos aproveitar agora pra formatar a saida de uma data, para isso vamos usar o

>>> print today.strftime("Ano com 4 digitos: %Y, agora com dois:: %y, mes: %m, dia: %d")
Ano com 4 digitos: 2009, agora com dois:: 09, mes: 12, dia: 03
>>>

Bom assim fica tranquilo formatar nossas datas né…
para maiores detalhes sobre formatação e assuntos relacionados aconselho a dar uma olhada aqui

Outra coisa corriqueira que temos que faze é transformar uma data no padrão DMYHMS em timestamp
vamos a mais um exemplo:

>>>
>>> now = datetime.datetime.now()
>>> print now
2009-12-03 20:31:23.894353
>>>
>>> print "Timestamp:", time.mktime(now.timetuple())
Timestamp: 1259879483.0
>>>

e claro muitas vezes temos que fazer a operação contrária, transformar um timestamp em uma data

>>> timestamp = time.mktime(now.timetuple())
>>> data = time.localtime(timestamp)
>>> data
(2009, 12, 3, 20, 31, 23, 3, 337, 1)
>>>

Bom nessa tupla temos
Ano, mes, dia, hora, minuto, segundos, dias transcorridos no ano etc…
Bom pra finalizar esse post mas não o assuntos vamos subtrair duas datas

>>> dias_vividos = datetime.date(2009, 12, 03) - datetime.date(1976, 03, 21)
>>> print dias_vividos
12310 days, 0:00:00
>>>

### Criando uma lista à partir de uma string

 lista = 'jonas marcos maria fernanda isabele'.split()
 lista
 ['jonas','marcos','maria','fernanda','isabele']
 for x, y in enumerate(lista):
     print x, y

Se desejasse transformar novamente a lista em uma string faria:

 texto = ' '.join(lista)

### Criando uma string a partir de uma lista

texto = []
for item in range(10):
    texto.append(str(item))

print texto
['0','1','2','3','4','5','6','7','8','9']
# transformei isto em inteiros usando lambda
texto = map(lambda x : int(x), texto)
# usando list compreensions
[ str(x) for x in range(10) ]

### somando itens de um dicionario (strings)
Referência: http://selinap.com/2009/05/how-to-sum-the-values-of-a-python-dictionary/

se você tem um dicionário assim:
dic = {'a':'10','b':'20','c':'30','d':'40','c':'50'}
sum([ int(x) for x in dic.values() ])

===outros métodos úteis===

  string.replace("isto","aquilo") # troca caracteres de posição
  '  um texto com espacos '.strip() # remove espaços no inicio e no fim

### contador de troco
* link: http://wille.wordpress.com/2008/08/28/programando-em-python-contador-de-troco/
###árvore binária em python
fonte: http://medeubranco.wordpress.com/2008/07/05/brincando-de-arvore-binaria-com-python/

#! /usr/bin/env python
# -.- encoding: utf-8 -.-

class arvbin:
    def __init__(self, Valor):
        self.Menor=None
        self.Maior=None
        self.conta=1
        self.valor=Valor

    def add(self,valor):
        if valor>self.valor:
            self.addmaior(valor)
        elif valor<self.valor:
            self.addmenor(valor)
        else:
            self.conta=self.conta+1

    def addmenor(self,valor):
        if self.Menor:
            self.Menor.add(valor)
        else:
            self.Menor=arvbin(valor)

    def addmaior(self,valor):
        if self.Maior:
            self.Maior.add(valor)
        else:
            self.Maior=arvbin(valor)

    def busca(self,valor):
        if valor>self.valor:
            if self.Maior:
                return self.Maior.busca(valor)
            else :
                return None
        elif valor<self.valor:
            if self.Menor:
                return self.Menor.busca(valor)
            else :
                return None
        else:
            return self

    def ordena(self):
        listamenor=[]
        listamaior=[]
        if self.Menor:
            listamenor=self.Menor.ordena()
        if self.Maior:
            listamaior=self.Maior.ordena()
        return listamenor + [ (self.valor, self.conta) ] + listamaior

### Funções lambda
São funções abrevidas e que podems ser usadas em alguns locais
em que uma função normal não poderia ser usada. Uma função normal seria:

  def pot(x):
      return x**2

a mesma função usando lambda:

 pot = lambda x : x**2

Veja um local em que uma função normal não poderia ser usada:

  map(lambda x : x**2, range(1,11))
  # a função map mapeia uma função em função da outra, ou seja para cada item
  # do intervalo "range(1,11)" acontece a função lambda, que neste caso
  # não foi sequer atribuida a nenhuma variável

### Equação do segundo grau
* fonte: http://blog.elcio.com.br/resolvendo-equacoes-do-segundo-grau-com-python/

# -*- encoding: utf-8 -*-
'''
Funções matemáticas para equações do segundo grau.
'''
from math import sqrt

def baskara(a,b,c):
  '''
  Função que fornece as raízes de uma equação do segundo grau.
  No caso de não haver raízes, retorna uma tupla vazia.
  Exemplos:
  >>> baskara(1,5,4)
  (-1.0, -4.0)
  >>> baskara(1,4,4)
  (-2.0,)
  >>> baskara(4,4,4)
  ()
  >>> baskara(0,4,2) # se a é zero, temos uma equação do primeiro grau
  (-0.5,)
  '''
  a,b,c=float(a),float(b),float(c)
  if(a==0):return (-c/b,)
  delta=b**2-4*a*c
  if delta<0:return ()
  if delta==0:return (-b/(2*a),)
  return ((-b+sqrt(delta))/(2*a),(-b-sqrt(delta))/(2*a))

if __name__=="__main__":
  # Se rodou o  arquivo diretamente, sem importar, roda os testes.
  import doctest
  doctest.testmod()

### Como setar o path do python no windows

To set the PYTHONPATH variable:

   1. Go to Control Panel -> System-> Advanced.
   2. Click 'Environment Variables' button.
   3. In the 'System Variables' panel that appears, click New and enter

PYTHONPATH in the 'Variable Name' field. In the 'Variable Value'
field enter path  c:\my\path

Usando o DOS

 C:\> SET PYTHONPATH=c:\my\path

Uma forma mais inteligente de configurar o path para um projeto

import sys;sys.path.insert(0,'/home/user/projetos')

### função boleana

def isDivisible(x,y):
  return x % y == 0

### Adicionando ~/bin ao path

import os
import sys
sys.path.append(str(os.path.expanduser("~/bin")))
del os
del sys
'''
print "\vseu path agora é \n" + "\n".join(sys.path)
'''

### imprimir o path

import sys
print("\n".join(sys.path))

### codificação de strings

'''> Bom, sou iniciante em Python(não em programação) e nessa lista, e estou com
> o seguinte problema:

> Tenho uma string que recupero em um xml que contém caracteres como '%20' no
> lugar do espaço, e outros iniciados por '%' no lugar de caracteres
> acentuados e gostaria de saber se posso obter uma string com os caracteres
> corretos.

> Tentei várias combinações dos métodos unicode(), encode() e decode() após
> ler tudo que achei na net sobre codificação em Python, mas não houve
> resultado.

Acho que a questão não é codificação dos caracteres (unicode, latin1,
etc), mas sim quote/unquote de caracteres escapados para xml. Acho que
o urllib pode resolver seus problemas. Tente assim:
'''

from urllib import unquote

# ... seu programa aqui ...

unquoted_str = unquote(xml_escaped_string)

### palavras reservadas

import keyword
print keyword.kwlist

### Dicas para listas

  numeros=[1,5]
  numeros[1:1]=[2,3,4]
  print numeros
  [1,2,3,4,5]

 fazendo o inverso

 range(1,6)
 [1,2,3,4,5]
 numeros[1:4]= []

### criando um path sob demanda

'''> Em suma, gostaria de poder chamar
> os.mkdir('/home/gustavo/dir1/dir2') e ao inves de um erro ser
> gerado, os diretorios dir1 e dir2 serem criados.

Use a função makedirs do módulo os. Essa função cria todos os
diretórios em um path que ainda não existam. Nesse caso, pre-
cisaria apenas fazer algo como'''

import os
os.makedirs('/home/gustavo/dir1/dir2/')

### closures
Funções que constroem outras funções

   def calcular(valor1,valor2):
       def somar():
           return valor1 + valor2
       return somar()
   print calcular(2,4)

### Abrindo arquivos
Obs: a notação no corpo do laço evita que se imprima
a quebra de linha original.

for line in file('some_file.txt'):
    print line[:-1]

### testes

if __name__ == '__main__' :
   # Este trecho do código só executa se o arquivo
   # estiver sendo executado diretamente a partir da linha
   # de comando.
   # Se o módulo for importado, o main não executará.
   ...

# Um exemplo em que se rodar o módulo diretamente ele mostrará
# na verdade como usa-lo:

if __name__=="__main__":
        print __doc__

### Python Decorators
* http://ruivaldo.blogspot.com/2008/09/python-decorators.html

### Expressões geradoras

s = sum(item for item in aList if item > 0)
print s

O que, usando funções geradoras, seria equivalente a escrever...

def positive(aList):
    for item in aList:
        if item > 0:
            yield item

s = sum(positive(aList))
print s

### dicas

my_object = 'Test' # True example
# my_object = '' # False example

if len(my_object) > 0:
    print 'my_object is not empty'

if len(object):  # 0 will evaluate to False
    print 'my_object is not empty'

if object != '':
    print 'my_object is not empty'

if object: # an empty string will evaluate to False
    print 'my_object is not empty'

Conclusão: Você não precisa chegar o tamanho de uma string ou igualdade
se quer saber apenas se a string está vazia

===veja também:===
http://www.dmat.furg.br/~python/diferente.html
Este mecanismo faz com que and e or se comportem como os operadores booleanos que implementam, mas eles também permitem escrever expressões condicionais muito curiosas. Por exemplo, o código

    if a:
        print a
    else:
        print b

Poderia ser substituído por:

    print a or b

### Droopy - receba arquivos via http

### setando o path
Referências: * http://vivaotux.blogspot.com/2008/09/adicionando-sua-pasta-bin-ao-path-do.html
* http://code.activestate.com/recipes/52662/

def AddSysPath(new_path):
    import sys, os

    # standardise
    new_path = os.path.abspath(new_path)

    # MS-Windows does not respect case
    if sys.platform == 'win32':
        new_path = new_path.lower()

    # disallow bad paths
    do = -1
    if os.path.exists(new_path):
        do = 1

        # check against all paths currently available
        for x in sys.path:
            x = os.path.abspath(x)
            if sys.platform == 'win32':
                x = x.lower()
            if new_path in (x, x + os.sep):
                do = 0

        # add path if we don't already have it
        if do:
            sys.path.append(new_path)
            pass

    return do

if __name__ == '__main__':
    # test
    import sys

    print 'Before:'
    for x in sys.path:
        print x

    if sys.platform == 'win32':
        print AddSysPath('c:\\Temp')
        print AddSysPath('c:\\temp')
    else:
        print AddSysPath('usr/lib/my_modules')

    print 'After:'
    for x in sys.path:
        print x

### Trabalhando com codificações diversas

try:
    texto = texto.encode("ISO-8859-1")
except:
    pass

### copiar arquivos
http://python-blog.blogspot.com/
leia sobre o módulo nmap

# So para dar um ultimo toque, tem um jeito mais simples
# ainda de fazer isso, que eh usar a funcao 'copyfileobj' do modulo 'shutil':

input = open(sys.argv[0], 'rb')
output = open(sys.argv[1], 'wb')
shutil.copyfileobj(input, output)

# Quando eu precisei recuperar um backup de minhas
# fotos em umas mídias "bixadas" eu precisava percorrer
# arquivos binários (10 arquivos de 650MB) de um lado para outro (índice no final, pedaços de arquivo espalhado, etc...)

# Usando file.read() e .seek() deixou o programa
# extremamente ineficaz. Solução: mmap (http://docs.python.org/lib/module-mmap.html).

#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

    try:
    origem = sys.argv[1]
    destino = sys.argv[2]
    except IndexError:
    print "Modo de usar: copyfile.py origem destino"
    sys.exit(1)

    #Exemplo de leitura e gravação de arquivos grandes - usando modo binário
    input = file(origem, 'rb')
    output = file(destino, "wb")
    for line in input:
    output.write(line)

    #Fechando os arquivos
    input.close()
    output.close()

### informação de hardware
Importando comandos

import os, commands
print os.system("ipconfig")
print os.system("hostname")

import os
for k in os.environ: print "%s: %s" %(k, os.environ[k])

import os; print os.uname()[1]

import socket
socket.gethostname()

ip = socket.gethostbyaddr(socket.gethostname())
# returns: ('hostname.domain', ['hostname'], ['192.168.0.2'])
ip = str(ip[2])
# returns: "['192.168.0.2']"
ip = ip[2:-2]
# returns: '192.168.0.2'

### iterando sobre um dicionário

*>>> b = {'a':3,'b':8,'c':4,'d':7,'e':17}
 >>> [b[k] for k in b]
[3, 4, 8, 17, 7]
 >>>*

>>> b = {'a':3,'b':8,'c':4,'d':7,'e':17}
>>> b.values()
[3, 4, 8, 17, 7]

### Plataforma

python -c "import platform; print platform.node()"

# python
>>> import platform
>>> print platform.system(), platform.release()
Windows XP

# python
>>> import platform
>>> print platform.system(), platform.release()
Linux 2.4.18-3

>>> from sys import platform
>>> print platform
win32

win32
>>> import os
>>> print os.name
nt
>>> os.environ['OS']
'Windows_NT'
>>>

### Descobrindo o home do usuário

import os
print os.path.expanduser("~")

### Imprimindo data e hora

import time
print time.strftime('%H:%M:%S')
time.strftime('%d-%m-%Y')

usando o módulo datetime

from datetime import datetime
print datetime.now()

outro método

#!/usr/bin/env python
from time import localtime, strftime, sleep
while True:  # rodar para sempre
    print strftime('%H:%M:%S',localtime())
    sleep(1) # aguardar 1 segundo

### trocando variáveis
O jeito antigo

  if ( a > b){
     tmp = a
     a = b
     b = tmp
   }

O jeito novo

 if a > b:
   a , b = b ,a

### Contador de troco
http://wille.wordpress.com/2008/08/28/programando-em-python-contador-de-troco/

### Exibindo documentação de módulos

>>> print os.__doc__
OS routines for Mac, NT, or Posix depending on what system we're on.

This exports:
  - all functions from posix, nt, os2, mac, or ce, e.g. unlink, stat, etc.
  - os.path is one of the modules posixpath, ntpath, or macpath
  - os.name is 'posix', 'nt', 'os2', 'mac', 'ce' or 'riscos'
  - os.curdir is a string representing the current directory ('.' or ':')
  - os.pardir is a string representing the parent directory ('..' or '::')
  - os.sep is the (or a most common) pathname separator ('/' or ':' or '\\')
  - os.extsep is the extension separator ('.' or '/')
  - os.altsep is the alternate pathname separator (None or '/')
  - os.pathsep is the component separator used in $PATH etc
  - os.linesep is the line separator in text files ('\r' or '\n' or '\r\n')
  - os.defpath is the default search path for executables
  - os.devnull is the file path of the null device ('/dev/null', etc.)

Programs that import and use 'os' stand a better chance of being
portable between different platforms.  Of course, they must then
only use functions that are defined by all platforms (e.g., unlink
and opendir), and leave all pathname manipulation to os.path
(e.g., split and join).

### Meu módulo de data

#!C:\\Python25\\python.exe
#-*- coding: ISO-8859-1 -*-
"""
        Este modulo quando importado disponibiliza a data e
        a hora em formatos apropriados

        mydata() --> dd-mm--yy
        mydata.dia() --> dd retorna o dia do mês com dois digitos
        mydata.mes() --> mm retorna o número do mês com dois dígitos
        myadata.ano() --> yyyy retorna o ano com quatro dígitos
        mydata.datacompleta() --> Segunda 23 de junho de 2008
"""

import time

def main():
        print "\n"
        print "   data atual:"
    print "   "+time.strftime("%d-%m-%Y")
        print "   "+time.strftime("%A %d de %B de %Y - %H:%M:%S")

def mydata():
        ''' retorna a data no formato dd-mm-yyy'''
    return time.strftime("%d-%m-%Y")

def datacompleta():
        ''' retorna a data no formato: segunda 23 de maio de 2008'''
        return "   "+time.strftime("%A %d de %B de %Y - %H:%M:%S")

def dia():
        ''' retorna o dia do mês com dois dígitos'''
    return time.strftime("%d")

def mes():
        ''' retorna o numero do mes com dois digitos'''
    return time.strftime("%m")

def ano():
        ''' retorna o ano com quatro digitos'''
    return time.strftime("%Y")

def hora():
        ''' retorna a hora no formato:  HH:MM:SS'''
    return time.strftime("%H:%M:%S")

if __name__=="__main__":
        print __doc__
        main()

### Teste de paridade

#!C:\\Python25\\python.exe
#-*- coding: ISO-8859-1 -*-
"""
  este script testa a paridade de um número dado
"""
while True:
    try:
        numero = int(raw_input("Informe um numero : "))
        if numero % 2 == 0:
           print 'O numero e par'
           break
        else:
           print 'O numero e impar'
           break
    except ValueError:
           print "Esta função só aceita números.  Tente novamente..."

# retorna False ou True
def par(x):
    return x % 2 == 0

### Referências
* http://www.onlamp.com/pub/a/python/2001/05/17/docstrings.html
* http://www.siafoo.net/article/52#quick-tricks
