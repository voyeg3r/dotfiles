#!/usr/bin/env python

import argparse
import sys


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument( 'text', type=str, help='Our string')
    args = parser.parse_args()

    if ord(args.text[0]) > 30000:
        print(unhide(args.text))
    else:
        print( hide(args.text))

def hide(msg):
    '''Encodes any string -> chinese symbols as str'''
    s = ''
    for c in msg:
        s += chr(ord(c) + 30000)
    return s

def unhide(msg):
    '''Decodes a string encoded with hide function  '''
    s = ''
    for c in msg:
        s += chr(ord(c) - 30000)
    return s


if __name__ == '__main__':
    main()
