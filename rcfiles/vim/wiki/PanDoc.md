# How use pandoc

``` markdown
File:		 PanDoc.md
Created:	 July 31 2014
Last Change: ter 10 jan 2017 14:11:53 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

### Synopsis

``` markdown
pandoc [*options*] [*input-file*]...
```

Pandoc can generate multiple outputs from markdown text
for example

``` sh
pandoc -s README -o example4.tex

pandoc -s README -o example4.pdf
```


Instead of a file, an absolute URI may be given. In this case
pandoc will fetch the content using HTTP:

``` sh
pandoc -f html -t markdown http://www.fsf.org
```

### Paragraphs

A paragraph is one or more lines of text followed by one or more blank line.
Newlines are treated as spaces, so you can reflow your paragraphs as you like.
If you need a hard line break, put two or more spaces at the end of a line.


### Footnotes

**Extension: `footnotes`**

Pandoc's markdown allows footnotes, using the following syntax:

    Here is a footnote reference,[^1] and another.[^longnote]

    [^1]: Here is the footnote.

    [^longnote]: Here's one with multiple blocks.

### Code syntax highlight

```python
import os
import sys

def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return "Hello WSGI!!"
```

### Definition lists

``` markdown
Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2
```

### Simple lists
+ you can use plus `+`
+ also you can use `-`
+ and you can use `*`


