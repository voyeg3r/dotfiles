#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  temperatureconverter.py
#         Created:  2018 mai 22 08:24
#     Last Change:  2018 mai 22 08:24
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

''' Temperature Convertor.
    by Alan Richmond, Python3.Codes
    to illustrate minimal Python
'''
done = False
while not done:                 # Repeat until the done flag gets set

    which = 'x'                     # Give which a value that isn't c or f
    while which not in 'cf':        # repeat until user gives good value:
        which = input("Is your temperature C or F? ").lower()   # lowercase it

    try:                            # we want a floating point number
        value = float(input("What is its value? "))
    except:                         # but didn't get one :()
        print("Not a number")
        continue                    # continue loop from beginning

    if which == 'c':                # Centigrade -> Fahrenheit
        result = str(value * 9 / 5 + 32) + 'F'

    elif which == 'f':              # Fahrenheit -> Centigrade
        result = str((value - 32) * 5 / 9) + 'C'

    else:
        pass                # Cannot possibly get here !

    print(result)

    done = input("Another? ").lower() != 'y'    # != is 'not equal'

print("Done!")

