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
+ http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html
+ https://github.com/cobrateam
+ http://code.activestate.com/recipes/langs/python/
+ https://panda.ime.usp.br/algoritmos/static/algoritmos/index.html
+ [30 python tricks you may not know about](30-python-tricks-you-may-not-know-about.md)
+ https://www.programiz.com/python-programming/list
+ [visualise your variables](http://pythontutor.com/)
+ https://docs.python.org/3.6/whatsnew/
+ [python-101 curso completo](https://www.youtube.com/playlist?list=PLV7VqBqvsd_3yRYYWrHkziPL6izzrUIkp)
+ http://ricardoduarte.github.io/python-para-desenvolvedores/
+ awesome-python.com [categorization for python libs] at github

# python keyword list

``` python
>>> import keyword
>>> keyword.kwlist
['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']

keyword.iskeyword('else')
True
```

### Dealing with decimal numbers
For more complex decimal operations
use decimal module

``` python
round(5.6 + 87.3, 1)
92.9

# whereas if you do this
5.6 + 87.3
92.89999999999999
```

### Using jupiter notebook
+ https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/

Jupyter notebook, formerly known as the IPython notebook, is a flexible tool
that helps you create readable analyses, as you can keep code, images,
comments, formulae and plots together.

``` markdown
    --------------------------
    Jupiter notebook Shortcuts
    --------------------------
    Enter ......... edit cell
    Esc ........... exit edit mode
    Ctrl-Enter .... run cell
    m ............. to markdown
    y ............. back to code
    A ............. insert cell above
    B ............. insert cell below
    DD ............ delete current cell

    In order to start jupiter notebook just
    jupyter notebook
```

### Visualizing bytecode

``` python
>>> func.__code__.co_code
'd\x01\x00}\x00\x00d\x00\x00S'
```

### Generators
Let's say you have a big file with cities and their population
to iterate over it you can do:

``` python
def load_cities_gen(path):
    with open(path) as handle:
        for line in handle:
            city, count = line.split('\t')
            yield city, int(count)

result = load_cities_gen('pop.tsv')
print(next(result))
print(next(result))
print(next(result))
```
This code avoids memory errors

### Print or set basename
For those who don't know what basename is let's give an example:

    ~/user/tmp/file.py .......... full path
    file.py ..................... basename

``` python
import os
script_name = os.path.basename(__file__)
```

### Decorators
+ https://www.thumbtack.com/engineering/a-primer-on-python-decorators/
+ https://realpython.com/blog/python/primer-on-python-decorators/


``` python
def my_decorator(some_function):
    def wrapper():
            print(f'something before {some_function.__name__}')
            some_function()
            print(f'something happens after {some_function.__name__}')
    return wrapper

@my_decorator
def just_some_function():
    print("Wheee!")

just_some_function()
something before just_some_function
Wheee!
something happens after just_some_function
```

The decorator bellow mesures the time spent for any decorated function
``` python
# source: https://realpython.com/blog/python/primer-on-python-decorators/

import time


def timing_function(some_function):

    """
    Outputs the time a function takes
    to execute.
    """

    def wrapper():
        t1 = time.time()
        some_function()
        t2 = time.time()
        return "Time it took to run the function: " + str((t2 - t1)) + "\n"
    return wrapper


@timing_function
def my_function():
    num_list = []
    for num in (range(0, 10000)):
        num_list.append(num)
    print("\nSum of all the numbers: " + str((sum(num_list))))


print(my_function())
```

### Variable positional arguments

``` python
def log(message, values):
    if not values:
        print(message)
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s' % (message, values_str))

log('My numbers are', 1, 2)
log('Hi there')
```

### Named tuples
+ [From Dan Bader website](https://dbader.org/blog/writing-clean-python-with-namedtuples)
``` python
>>> from collections import namedtuple
>>> Car = namedtuple('Car' , 'color mileage')

# It behaves as if you had defined a Car class manually and given it
# a constructor accepting a “color” and a “mileage” value:

>>> my_car = Car('red', 3812.4)
>>> my_car.color
'red'
>>> my_car.mileage
3812.4
```

Another example:

``` python
from collections import namedtuple
Color = namedtuple('Color', 'red green blue')

color = Color(55, 155, 255)
print(color.red)
```

``` python
row = ('Dave', 'Beazley', '5412 N CLARK ST')
row[1]
'Beazley'
row[2]
'5412 N CLARK ST'
from collections import namedtuple
Person = namedtuple('Person', ['first', 'last', 'address'])
row = Person('Dave', 'Beazley', '5423 N CLARK ST')
row.first
'Dave'
row.last
'Beazley'
row.address
'5423 N CLARK ST'
```

### Using regex in python

``` python
import re

mystring = 'abcdefgh'

if re.search(r'abc', mystring):
    print('matched')
else:
    print('NOT match')
```

### Ternary operator

    x = 10 if (y == 9) else 20

### http server

```python
# Python 3
python3 -m http.server
```

### Algorithms list and list tips

+ Return a maximum value of a given list: ~/bin/maxlistvalue.py

#### Enumerate items from a give list
```python
for i, item in enumerate(["casa", "apartamento", "fazenda"], 1):
     print(f'{i} - {item}')

1 - casa
2 - apartamento
3 - fazenda
```

#### Printing a decreasing amount of something
The list.pop() method gives us the last value of a list
and removes it from the list

li = list(range(1, 5))

while li:
    print('Spam!' * li.pop())

### What does ** (double star) and * (star) do for parameters?
+ http://stackoverflow.com/a/3394898/2571881

``` python
def print_everything(*args):
    for count, thing in enumerate(args, 1):
        print(f'{count}. {thing}')

print_everything('apple', 'banana', 'cabbage')

1. apple
2. banana
3. cabbage

def table_things(**kwargs):
    for name, value in kwargs.items():
        print(f'{name} = {value}')

table_things(apple = 'fruit', cabbage = 'vegetable')

apple = fruit
cabbage = vegetable
```

# criando tuplas

``` python
>>> list(enumerate('abc', 1))
[(1, 'a'), (2, 'b'), (3, 'c')]


>>> colors = [ 'blue', 'red', 'yellow', 'purple' ]
>>> for i, color in enumerate(colors):
...     print(i, color)
...
0 blue
1 red
2 yellow
3 purple
```


### Useful builtin methods
+ [complete list of them](https://docs.python.org/3/library/functions.html)

You can easily reverse one list to prioritize the most recent ones
``` python
nums = []
for i in range(1, 11):
    nums.append(i)

print(list(nums.reverse()))

# list.reverse() changes the list in place
# whereas reversed(list) only gives you the list reversed withot changing it
```
``` python
li = list(range(1, 11))
li = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

li2 = [11, 12, 13]
li.append(li2)
li
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, [11, 12, 13]]
li.pop()
[11, 12, 13]
# to remove the last item list.pop()
# to add each item of li2 on li just:
li.extend(li2)
li
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
```

You can quickly reverse a list by using:

```python
>>> a = [1, 2, 3, 4]
>>> a[::-1]
[4,  3,  2,  1]
```

This creates a new reversed list. If you want to reverse a list in place you
can do:

    a.reverse()

But you can do the same by doing:

A faster and elegant solution is:
``` python
[ x for x in range(1, 11)[::-1] ]
```

### Mesuring execution time

``` python
import time

start = time.time()
print("hello")
end = time.time()
print(end - start)
```

### Return maximum value from a list
There are two ways to do that, the first one makes use of
a builtin function called `max`. (first let's create a list
to show you how to use this function)

    numbers = [987, 897, 34, 21, 67]

Now just do:

    max(numbers)

Another way to perform this action is using negative index plus
sorted function:

    sorted(numbers)[-1]

If you want to print the first three big elements:

    big_values = ' '.join((str(x) for x in sorted(numbers[-3:])))

``` python
# the last three (bigger)
' '.join((str(x) for x in sorted(numbers)[-3:] ))
'67 897 987'

# the first three (smallest)
>>> ' '.join((str(x) for x in sorted(numbers)[:3]))
'21 34 67'
```

### How to merge lists into a list of tuples in Python?

``` python
>>> estados
['Ceará', 'Maranhão']
>>> capitais
['Fortaleza', 'São Luiz']

# usando zip para unir as duas listas gera um problema
# torna um lazy object em um objeto iteral simples
# que guarda todos os valores em memória
list(zip(estados, capitais))
[('Ceará', 'Fortaleza'), ('Maranhão', 'São Luiz')]

# melhor seria
for k, v in zip(estados, capitais):
    print(k, v)
```

``` python
firstnames = ['Alice', 'Bob', 'John' ]
lastnames = ['Dupont', 'Sleigh', 'Doe' ]
ages = [ 24, 63, 33 ]

zip(firstnames, lastnames, ages)
<zip object at 0xb6e42bcc>

list(zip(firstnames, lastnames, ages))
[('Alice', 'Dupont', 24), ('Bob', 'Sleigh', 63), ('John', 'Doe', 33)]

for m, k, v in list(zip(firstnames, lastnames, ages)):
    print(m, k, v)

Alice Dupont 24
Bob Sleigh 63
John Doe 33
```

### Easily create a list

    lista = list(set('12345'))


### f-strings examples
To read more, learn more about f-strings search for pep 498
+ [article about it](https://py.checkio.org/blog/pep-498-f-strings-python-36/)
+ https://cito.github.io/blog/f-strings/

``` markdown
var = 42
print(f'My var is: {var:.02f}')
```

``` python
>>> val = 1/3
>>> f'Value:{val:10.2}'
'Value:      0.33'
>>> precision = 3
>>> f'Value:{val:10.{precision}}'
'Value:     0.333'


import os

>>> for i in range(1, 11):
...     new_folder = f'folder-{i:02d}'
...     os.mkdir(new_folder)
...     print(f'Created {new_folder}')
...
Created folder-01
Created folder-02
Created folder-03
Created folder-04
Created folder-05
Created folder-06
Created folder-07
Created folder-08
Created folder-09
Created folder-10
```

``` python
# list only files in current dir
for entry in os.listdir('.'):
    if os.path.isfile(entry):
        print(f'"{entry}" is a file')
```


You can use more complex expressions

``` python
>>> ll = [1, 22, 3, 1]
>>> big = lambda a: a.capitalize()
>>> f'{ll[1]} {big("alex")} {ll.count(1)}'
'22 Alex 2'
```

### print two lists side by side with equal space
This example makes use of f-strings (python 3.6)

``` python
b = list(range(5, 8))
a = list(range(1, 4))
a
[1, 2, 3]

column1 = ["soft", "pregnant", "tall"]
column2 = ["skin", "woman",  "man"]


for k, v in zip(column1, column2):
    print(f'{k:10} {v}')

soft       skin
pregnant   woman
tall       man
```

Another similar example


``` python
list1 = [ x for x in 'abcd' ]
list2 = [ x for x in 'pqrs' ]

for k, v in zip(list1, list2):
    print(f'{k} - {v}')

a - p
b - q
c - r
d - s

# another way to create a list
my_list = list(set('12345'))
```

### Lambda functions

``` python
add = lambda x, y: x + y
add(6,8)
14

(lambda x, y: x + y)(5, 3)
8
```

### Dictionary comprehension
+ [about dictionaries](https://www.tutorialspoint.com/python3/python_dictionary.htm)

``` python
first2pairs = {k: mydict[k] for k in mydict.keys()[:2]}
```

Combining three dictionaries - Let's say we have three dictionaries
like below...

``` python
route = {'id': 271, 'title': 'Fast apps'}
query = {'id': 1, 'render_fast': True}
post = {'e-mail': 'j@j.com', 'name': 'Jeff'}
```
We can combine them in this way:
``` python
# dictionarie comprehension
{ k: v  for d in [query, post, route] for k,v in d.items() }
```

But in python 3.5+ we can do a much more easy thing:

``` python
# pythonic way
combined_dict = {**route, **query, **post}
```

### Inverting a dictionary


``` python
m = {'a': 1, 'b': 2, 'c': 3, 'd': 4}

dict(zip(m.values(), m.keys()))
{1: 'a', 2: 'b', 3: 'c', 4: 'd'}

>>> {v: k for k, v in m.items()}
{1: 'a', 2: 'b', 3: 'c', 4: 'd'}
```

### Creating a dictionary form two lists

``` markdown
>>> values = ['Hammad', 'Builder', 'Engine']
>>> keys = ['Safe', 'Bob', 'Thomas']
>>> d = dict(zip(keys, values))
>>> d
{'Safe': 'Hammad', 'Bob': 'Builder', 'Thomas': 'Engine'}
```


### dictionaries useful builtin methods


``` python
# getting maximum values

# First of all how combine two list in one dict (using zip)

names = ['Empire State', 'Sears Tower', 'Burj Kbalifa', 'Taipei 101']
heights = [ 381, 442, 828, 509 ]

tall_buildings = dict(zip(names, heights))

tall_buildings = {
    "Empire State": 381, "Sears Tower": 442,
    "Burj Kbalifa": 828, "Taipei 101": 509,
}
>>> print(max(tall_buildings.values()))
828

print(max(tall_buildings.items(), key=lambda b: b[1]))
('Burj Kbalifa', 828)

print(max([tall_buildings](tall_buildings), key=tall_buildings.get))
Burj Kbalifa


a = ["I", "am", "gregorious", "person", "echidna", "fly"]
max(a, key=len)
'gregorious'
```

### Ordering dictionaries

``` python
# https://gist.github.com/voyeg3r/e44d50c29525a450a38f77e5f656b5f4

students = [
    {'name':'Paul Allen', 'class':'Science','grade':'A'},
    {'name':'Paul Allen', 'class':'Math','grade':'C'},
    {'name':'Bob Lewis', 'class':'Science','grade':'D'},
    {'name':'Bob Lewis', 'class':'Math','grade':'b'},

### Use _ for “throwaway” variables e.g.:

    for k, _ in [('a', 1), ('b', 2), ('c', 3)]:
        print(k)

### Ordering dictionaries

``` python
# https://gist.github.com/voyeg3r/e44d50c29525a450a38f77e5f656b5f4

students = [
    {'name':'Paul Allen', 'class':'Science','grade':'A'},
    {'name':'Paul Allen', 'class':'Math','grade':'C'},
    {'name':'Bob Lewis', 'class':'Science','grade':'D'},
    {'name':'Bob Lewis', 'class':'Math','grade':'b'},
    {'name':'Bob Lewis', 'class':'History','grade':'f'},
]

from operator import itemgetter

for x in sorted(students, key=itemgetter('name', 'class')):
    print(x)

{'name': 'Bob Lewis', 'class': 'History', 'grade': 'f'}
{'name': 'Bob Lewis', 'class': 'Math', 'grade': 'b'}
{'name': 'Bob Lewis', 'class': 'Science', 'grade': 'D'}
{'name': 'Paul Allen', 'class': 'Math', 'grade': 'C'}
{'name': 'Paul Allen', 'class': 'Science', 'grade': 'A'}
```

### List comprehension

    [x**2 if x > 10 else x**4 for x in range(40)]

1 - The essential part (loop for) NEEDED
2 - modiicator  (x*2 for example) OPTIONAL
3 - conditional OPTIONAL

** Printing a list without loop for **
```python
# f-strings (only works on python 3)

recent_presidents = ['George Bush', 'Bill Clinton', 'George W. Bush']
print(f'The three most recent presidents are {", ".join(recent_presidents)}')
```

### Acessing docstrings (documentation)


``` python
import random
print(random.choice.__doc__)
Choose a random element from a non-empty sequence.
```

### A function that adds all arguments

``` python
def addnums(*args):
   return sum(args)
```


### Counting words in a file

``` python
with open('alice.txt', 'r') as f:
        f = f.read().lower().split()

result = {i:f.count(i) for i in f if i == 'alice'}

print(f'Alice aparece {result["alice"]} vezes no texto')
```

### Reading unix system users

``` python
with open('/etc/passwd') as f:
    users = (s.split(':')[0] for s in f)
    " ".join(list(users))
```

### tools
Script para converter scripts da versão 2 do python
para versão 3 --> its name: 2to3

    2to3 -w python2script.py

without `-w` it just shows your what need be changed

### print help functions and builtins

``` python
import random
print(help(random.random))
```

### simulando o arremesso de um dado

``` python
import random

for i in range(10):
    print(random.randint(1, 6))
```

### Emulating switch case in python
+ [source: stackoverflow](http://stackoverflow.com/a/103081/2571881)

``` python
def f(x):
    return {
        'a': 1,
        'b': 2,
    }.get(x, 9)    # 9 is default if x not found
```

### Manipulating strings
+ [Read more here](https://docs.python.org/3/reference/lexical_analysis.html#f-strings)
+ [pep-498-string-interpolation](https://www.python.org/dev/peps/pep-0498/)
+ [pep 498 local help](pep-498-local-help.md)

** some f-trings tips **

``` python
import datetime
date = datetime.date(1968, 11, 8)
f'{date} was on {date:%A}'
'1968-11-08 was on Friday'
```

``` python
>>> import datetime
>>> current_date = datetime.date.today()
>>> print(current_date)
2017-03-22
>>> print(current_date.month)
3
>>> print(current_date.year)
2017
>>>
```

``` python
>>> import datetime
>>> current_date = datetime.date.today()
>>> # strftime allows you to specify the date format
... print(current_date.strftime('%d %b, %Y'))
22 Mar, 2017
```


``` python
>>> current_date = datetime.date.today()
>>> f"Please attend our event {current_date.strftime('%A, %B %d in the year %Y')}"
'Please attend our event Wednesday, March 22 in the year 2017'
```



``` python
# how many days until my bifthday
>>> import datetime
>>> next_birthday = \
... datetime.datetime.strptime('11/08/2017', '%m/%d/%Y').date()
>>> current_date = datetime.date.today()
>>> difference = next_birthday - current_date
>>> print(difference.days)
231
```


``` python
>>> import datetime
>>> current_time = datetime.datetime.now()
>>> print(current_time)
2017-03-22 08:36:24.589458
>>> print(current_time.hour)
8
>>> print(current_time.minute)
36
>>> print(current_time.second)
24
```

``` python
>>> import datetime
>>> current_time = datetime.datetime.now()
>>> print(datetime.datetime.strftime(current_time, '%H:%M:%S'))
08:38:50
```


``` python
# withou using strftime
>>> import datetime
>>> current_date =  datetime.datetime.now()
>>> print(current_date.minute)
42
>>> print(f'{current_date.hour}:{current_date.minute}:{current_date.second}')
8:42:43
```


``` python
>>> x=list(range(3))
>>> x
[0, 1, 2]
>>> print(f"There are #{len(x)} elements in x")
There are #3 elements in x
```


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

### It is easyer to ask forgiveness than permission (EAFP)

``` python
my_list = [1, 2, 3, 4, 5, 6]

try:
    print(my_list[5])
except IndexError:
    print('That index does not exist')
```

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
        return ' '.join(content[:length+1].split(' ')[0:-1]) + suffix
```

What happens is the if-statement checks if your content is already less than
the cutoff point. If it's not, it truncates to the desired length, splits on
the space, removes the last element (so that you don't cut off a word), and
then joins it back together (while tacking on the '...').

** Truncar uma string - Truncating long strings **

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
print(f'{text:04d}')
0022
```
For numbers
``` python
print(f'{4:03d}')
```

** Formatting options **
``` python
person = {'name': 'Jenn', 'age': 23}
print(f'My name is {name} and I am {age} years old.')

l = ['Jenn', 23]
print(f'My name is {l[0]} and I am {l[1]} years old.')

# another example
tag = 'h1'
text = 'This is a headline'
print(f'<{tag}>{text}</{tag}')


class Person():

    def __init__(self, name, age):
        self.name = name
        self.age = age

p1 = Person('Jack', '33')

print(f'My name is {p1.name} and I am {p1.age} years old.')
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
for i in range(1, 11):
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

** PRINTING DATES **
``` python
# datetime.utcnow returns a datetime object.
# You can use its strftime method to con vert it into a
# string of your desired format
import datetime

datetime.datetime.utcnow().strftime('%B %d %Y - %H:%M:%S')
'August 20 2014 - 13:55:49'
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

### Python libs and modules
+ [manipulatin strings](https://docs.python.org/2/library/string.html)
+ [natural sorting](https://pypi.python.org/pypi/natsort)
+ [clipboard manipulation](https://pypi.python.org/pypi/pyperclip)
+ [python3 libs](https://pypi.python.org/pypi?:action=browse&c=533&show=all)
+ [BeautifulSoup](BeautifulSoup.md)
+ python-dateutils - deals with dates
+ os module - deals with any operating system
+ [memory cache] from functools import lru_cache
+ [fix code layout] pip install flake8
+ [srt translator] sudo pip install pysrttranslator
+ [open excel spreadsheets] openpyxl
+ os "shows os informations"
+ imp (reload) - reloads previous imported modules
+ [python pandas](python-pandas.md) (data analisys) pip install pandas
+ heapq

3y g00 *pi 畱畹疪疑疃疩畲畽略畤疉疏疠疨疪疒疣畨疩疡畲疖畨疢疤疥疟畱畽疣疂疚畦疙畦疇疦畣疧

#### Lib to remove text accents

    sudo pip install unidecode

``` python
from unidecode import unidecode
print(unidecode(u"áéíóú äëïöü ñÑ û"))
```

### Easily remove text accents
``` python
import unicodedata

def remove_accents(input_str):
    nfkd_form = unicodedata.normalize('NFKD', input_str)
    only_ascii = nfkd_form.encode('ASCII', 'ignore')
    return only_ascii.decode('utf-8')
```

``` python
import unicodedata
def strip_accents(s):
   return ''.join(c for c in unicodedata.normalize('NFD', s)
                  if unicodedata.category(c) != 'Mn')
```

### lib for statistics

``` python
>>> import heapq
>>> help(heapq)

>>> grades = '32 43 654 34 132 66 99 532'.split()
>>> grades
['32', '43', '654', '34', '132', '66', '99', '532']
>>> print(heapq.nlargest(3, grades))
['99', '66', '654']
```


** Some import and documentation tricks **

``` python
>>> import pprint
>>> pprint
<module 'pprint' from '/usr/lib/python3.6/pprint.py'>

# show every method excluding dunder ones "__likethis__"
>>> print("\n".join([a for a in dir(pprint) if not a.startswith('_')]))
PrettyPrinter
isreadable
isrecursive
pformat
pprint
re
saferepr

print("\n".join([x for x in dir(os) if not x.startswith('_') ]))
>>>

>>> print("\n".join([x for x in dir(string) if not x.startswith('_')]))
Formatter
Template
ascii_letters
ascii_lowercase
ascii_uppercase
capwords
digits
hexdigits
octdigits
printable
punctuation
whitespace
```

### Collections lib

``` python
>>> from collections import Counter
>>> fruits = ['orange', 'banana', 'apple', 'orange', 'banana']
>>> Counter(fruits)
Counter({'orange': 2, 'banana': 2, 'apple': 1})


c = Counter('abcdeabcdabcaba')  # count elements from a string

c.most_common(3)
[('a', 5), ('b', 4), ('c', 3)]

>>> c = Counter('xyzzy')
>>> c
Counter({'y': 2, 'z': 2, 'x': 1})
```


### leap year

``` python
def is_leap_year(year):
"""Determine whether a year is a leap year."""
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

import calendar
print calendar.isleap(1900)
```

### fixing code layout

    flake8 file.py

** Os Mudule **

``` python
import os
print(dir(os))
```

**Where I am on my OS?**

``` python
import os
print(os.getcwd())
```

### Context managers can deal with iterabes easily

``` python
with open('blah.dat') as f:
    # Read the firs line (header)
    header_line = next(f)

    # Read the rest
    for data_line in f:
        # ...
```


** How to list dir using python like ls on linux? **
``` python
from os import listdir
from os.path import isfile, join
files = [f for f in listdir(mypath) if isfile(join(mypath, f))]
```

``` python
# To change dir:

impor os
os.chdir(path)
```

**another cd for python**
``` python
from contextlib import contextmanager
import os

@contextmanager
def cd(newdir):
    prevdir = os.getcwd()
    os.chdir(os.path.expanduser(newdir))
    try:
        yield
    finally:
        os.chdir(prevdir)

# another sippet
from contextlib import contexmanager

@contexmanager
def managed_file(name):
    try:
        f = open(name, 'w')
        yield f
    finally:
        f.close()

with managed_file('hello.txt') as f:
    f.write('hello, world')
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

natsort provides a function natsorted that helps sort lists "naturally", either
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

# removing filename spaces
for fname in os.listdir('.'):
    os.rename(fname, fname.replace(' ', '_'))
```

``` python
import os
for dpath, dnames, fnames in os.walk('/path/to/directory'):
    for f in fnames:
        os.chdir(dpath)
        if f.startswith('cheese_'):
            os.rename(f, f.replace('cheese_', ''))


import os
for f in os.listdir('.'):
    oldname = f
    newname = f.replace(' ', '_')
    print(f'Renomeando \n {oldname} --> {newname}\n')
    os.rename(oldname, newname)
```

### Regex in python

``` python
def strip_html(text):
    """Remove todo o html de uma determinada string. [2]
    """
    import re
    s = re.sub('<[^>]*>', '', text)
    return s

# remove duplicated spaces
s = 'This    is my  string'
re.sub('\s+', ' ', s)
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

**Sorteando nomes de uma lista**
``` python
import random

outcomes = ['rock', 'paper', 'scissors']

for in range(10):
    print(random.choice(outcomes))
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

### Para verificar duplicados e interceções use set

``` python
names = ['Dave', 'Thomas', 'Paula', 'Lewis', 'Dave']
names
['Dave', 'Thomas', 'Paula', 'Lewis', 'Dave']
names = {'Dave', 'Thomas', 'Paula', 'Lewis', 'Dave'}
names
{'Thomas', 'Lewis', 'Dave', 'Paula'}
```

### Métodos comuns a str and list


``` python
sorted(set(dir('abc')) & set(dir([])) )

['__add__', '__class__', '__contains__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'count', 'index']

```


### Sorted Dictionary
+ [stackoverflow](http://stackoverflow.com/a/35610062/2571881)

``` python
>>> class1 = { 'Ethan':'9','Ian':'3','Helen':'8','Holly':'6' }
>>> print(sorted(class1.items()))
[('Ethan', '9'), ('Helen', '8'), ('Holly', '6'), ('Ian', '3')]



>>> for k,v in sorted(class1.items()):
...     print(k, v)
...
Ethan 9
Helen 8
Holly 6
Ian 3



>>> for k,v in sorted(class1.items(), key=lambda p:p[1]):
...     print(k,v)
...
Ian 3
Holly 6
Helen 8
Ethan 9

>>> for k,v in sorted(class1.items(), key=lambda p:p[1], reverse=True):
...     print(k,v)
...
Ethan 9
Helen 8
Holly 6
Ian 3


>>> m = {'a': 1, 'b': 2, 'c': 3, 'd': 4}
>>> for k, v in m.items():
...     print(f'{k} - {v}')
...
a - 1
b - 2
c - 3
d - 4
```
### Example of python classes

``` python
class Worker:
    def __init__(self, name, pay):
            self.name = name
            self.pay = pay
    def lastName(self):
            return self.name.split()[-1]
    def giveRaise(self, percent):
            self.pay *= (1.0 + percent)

bob = Worker('Bob Smith', 50000)
sue = Worker('Sue Jones', 60000)

bob.lastName()
'Smith'
sue.lastName()
'Jones'
sue.giveRaise(.10)
sue.pay
66000.0
```
