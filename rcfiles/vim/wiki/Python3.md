
=assigning a range or printing=

		To print a list [1, 3, 5, 7, 9, 11]

		print(list(range(1,12,2)))

= Converting python2 to python3=

   2to3 python2script.py

   to write changes use -w

   2to3 -w python2script.py

= Access to the clipboard =

    import pyperclip

    # print clipboard contente
    pyperclip.paste()

    var = pyperclip.paste()
    print(var)
