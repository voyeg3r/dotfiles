#!/usr/bin/python
# recursively rename all files and directories in a given folder to lowercase

import sys, os, itertools

if len(sys.argv) < 2:
    print >> sys.stderr, "usage: lower PATH"
    sys.exit(2)
if not os.path.isdir(sys.argv[1]):
    print >> sys.stderr, sys.argv[1], "not a directory"
    sys.exit(1)

for root, dirs, files in os.walk(sys.argv[1]):
    for path in itertools.chain(files, dirs):
        old, new = os.path.join(root, path), os.path.join(root, path.lower())
        if not os.path.exists(new):
            os.rename(old, new)
