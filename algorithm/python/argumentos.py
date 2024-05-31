#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  argumentos.py
#         Created:  2018 mai 23 10:13
#     Last Change:  2018 jun 01 19:55
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import argparse
__author__ = 'voyeg3r'

parser = argparse.ArgumentParser(description='This is a demo script by nixCraft.')
parser.add_argument('-i','--input', help='Input file name',required=True)
parser.add_argument('-o','--output',help='Output file name', required=True)
args = parser.parse_args()

# print ("Input file: %s" % args.input )
# print ("Output file: %s" % args.output )

print(f'Input file: {args.input}')
print(f'Output file: {args.output}')
