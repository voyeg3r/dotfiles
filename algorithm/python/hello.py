#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
#        File:  hello.py
#      Author:  Sergio Araujo
#     Purpose:  say hello
# Last Change:  2018 jun 01 20:06
#     Created:  sex 01 jun 2018 20:05:34 -03
#       email:  <voyeg3r ✉ gmail.com>
#      Github:  https://github.com/voyeg3r
#     twitter:  @voyeg3r

# import modules used here -- sys is a very standard one
import sys

# Gather our code in a main() function
def main():
    print('Hello there', sys.argv[1])
    # Command line args are in sys.argv[1], sys.argv[2] ...
    # sys.argv[0] is the script name itself and can be ignored

# Standard boilerplate to call the main() function to begin
# the program.
if __name__ == '__main__':
    main()
