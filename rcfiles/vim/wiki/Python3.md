# dicas Sobre python3

    File:		 Python3.md
    Created:	 sáb 07 jan 2017 07:29:27 BRT
    Last Change: sáb 07 jan 2017 07:30:56 BRT
    Author:		 Sergio Araujo
    Site:		 http://vivaotux.blogspot.com
    e-mail:      <voyeg3r ✉ gmail.com>
    Twitter:	 @voyeg3r
    Github:      https://github.com/voyeg3r


### to be able to import turtle in python
[read on this link](https://opentechschool.github.io/python-beginners/en/simple_drawing.html)

    sudo pacman -S community/python-pmw


###assigning a range or printing

		To print a list [1, 3, 5, 7, 9, 11]

		print(list(range(1,12,2)))

### Converting python2 to python3

   2to3 python2script.py

   to write changes use -w

   2to3 -w python2script.py

### Access to the clipboard

    import pyperclip

    # print clipboard contente
    pyperclip.paste()

    var = pyperclip.paste()
    print(var)
