#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    27-02-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  <+this script aims+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

def main():
    print("Temperature Conerter")
    print("chose either to_celcious or to_fahrenheit methods")

def to_celcious(fahrenheit):
    result = (fahrenheit - 32) * 5.0 / 9.0
    return result

def to_fahrenheit(celcius):
    result = 9.0 / 5.0 * celcius + 32
    return result

if __name__ == '__main__':
        main()
