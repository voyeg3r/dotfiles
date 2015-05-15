#!/usr/bin/env python
#encoding: utf-8
import os
import sys
import glob

args=sys.argv

doc='''Usage: 
    %s path charset_in charset_out patterns
Example:
    %s . iso-8859-1 utf-8 "*.txt" "*.html" "*.php"
''' % (sys.argv[0],sys.argv[0])

if len(args)<5:
    print doc
    sys.exit(1)

args.pop(0)

path=args.pop(0)
charset_in=args.pop(0)
charset_out=args.pop(0)
patterns=args

transfiles=[]
for root,dirs,files in os.walk(path):
    for pattern in patterns:
        transfiles.extend(glob.glob(os.path.join(root,pattern)))

transfiles=set(transfiles)
parsed=0
for f in transfiles:
    try:
        parsed+=1
        sys.stdout.write('Converting file %i/%i\r' % (parsed,len(transfiles)))
        sys.stdout.flush()
        fi=open(f)
        t=fi.read()
        fi.close()
        t=t.decode(charset_in).encode(charset_out)
        fi=open(f,'w')
        fi.write(t)
        fi.close()
    except IOError:
        print 'Converting file %i/%i' % (parsed,len(transfiles))
        print 'Could not read file:\n  %s' % f
        sys.exit(2)
    except UnicodeDecodeError:
        print 'Converting file %i/%i' % (parsed,len(transfiles))
        print 'Invalid charset (%s):\n  %s' % (charset_in,f)
        sys.exit(3)

