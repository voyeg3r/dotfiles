#!/usr/bin/env python
# -*- coding: UTF-8 -*- 
import getopt, os, sys

try:
    options, args = getopt.getopt(sys.argv[1:], 'vr', ['revert', 'rename'])
    options = [ o[0] for o in options ]
except:
    print "syntax: %s [-h|--help] [--rename] [--revert] [-r] [args]" % sys.argv[0]
    print "-h or --help : this help"
    print "--rename : Actually rename (otherwise in dummy mode)"
    print "--revert : Revert Mode (from utf-8 to iso8859-1)"
    print "-r       : Recursive Mode"
    print "-v       : Verbose mode"
    print "args : files and/or directories to recursively rename"
    sys.exit(1)

fromcode, tocode = 'iso8859-1', 'utf-8'
if '--revert' in options:
    fromcode, tocode = tocode, fromcode

def do_rename(root, item):
    oldname = os.path.join(root,item)
    newname = os.path.join(root,item.decode(fromcode).encode(tocode))
    if oldname != newname:
        if '--rename' not in options or 'v' in options:
            print "%s => %s" % (oldname, newname)
        if '--rename' in options:
            os.rename(oldname, newname)

for arg in args:
    if os.path.isdir(arg) and '-r' in options:
        for root, dirs, files in os.walk(arg, topdown=False):
            for item in files + dirs:
                do_rename(root, item)
    elif os.path.isfile(arg) or os.path.isdir(arg) and '-r' not in options:
        do_rename(os.path.dirname(arg), os.path.basename(arg))
        
        
