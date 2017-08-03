# Intro
+ https://github.com/hellerbarde/stapler/tree/master
A small utility making use of the pypdf library to provide a (somewhat) lighter
alternative to pdftk

Leia também sobre o [pdftk](pdftk.md)

# concatenate a and b into output.pdf
stapler sel a.pdf b.pdf output.pdf

# generate a pdf file called output.pdf with the following pages:
# 1, 4-8 in 180° (D for down), 20-40 from a.pdf, 1-5 from b.pdf in
# this order
stapler sel a.pdf 1 4-8D 20-40 b.pdf 1-5 output.pdf

# reverse some of the pages in a.pdf by specifying a negative range
stapler sel a.pdf 1-3 9-6 10 output.pdf

# split pdf

    stapler split foobar.pdf
    ls
    foobar_01.pdf foobar_02.pdf ... foobar_19.pdf foobar_20.pdf


