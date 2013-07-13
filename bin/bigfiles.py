#!/usr/bin/env python
# bigfiles.py - Generate a list of the largest files within a subdir
# Copyright (C) 2007 Dan Noe / isomerica.net
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# Please feel free to email me if you have any problems, or if you
# make improvements to this script.  Thanks!
#
# 2007/04/26 - dpn@isomerica.net: Initial Version
#
#

import sys, os, os.path, getopt, time
from stat import *

def main():
  """
bigfiles.py -- Generate a list of the largest files within a subdir.
Copyright (C) 2007 Dan Noe / isomerica.net

  Usage: bigfiles.py [-vh -n <count>] /home/username/path

  Bigfiles recursively searches the directory your specify, determining
  the size of each file.  When it is done, it prints a list of files in
  descending size order, with human readable sizes.

  Options:
    -h  Display this help.
    -v  Print some statistics about program run.
    -n <count>  Display <count> results

  Any access errors (such as dangling symlinks) are ignored.
  """
  try:
    options, remaining = getopt.getopt(sys.argv[1:], "hvn:")
  except:
    print main.__doc__
    sys.exit(1)

  items = 10
  verbose = False
  for field, value in options:
    if field == "-h":
      print main.__doc__
      sys.exit(1)
    if field == "-v":
      verbose = True
    if field == "-n":
      items = int(value)

  if len(remaining) == 0:
    print main.__doc__
    sys.exit(1)
  else:
    path = remaining[0]

  files = []
  if verbose:
    sys.stdout.write("Processing ... ")
    sys.stdout.flush()
    t = time.time()
  os.path.walk(path, visitor, files)
  if verbose:
    elapsed = time.time() - t
    print "Called stat() on %d files in %f seconds" % (len(files), elapsed)
    sys.stdout.write("Sorting ... ")
    sys.stdout.flush()
    t = time.time()
  files.sort(reverse=True)
  if verbose:
    elapsed = time.time() - t
    print "Sorted in %f seconds\n" % elapsed

  for result in files[:items]:
    print " ".join((humanize(result[0]), result[1]))

def visitor(files, dirname, filenames):
  """Visit function called by os.path.walk()."""
  paths = [os.path.join(dirname, filename) for filename in filenames]
  for path in paths:
    try:
      stat = os.stat(path)
      size = stat[ST_SIZE]
      files.append((size, path))
    except OSError:
      pass

def humanize(bytes):
  """Turns a byte count into a human readable string."""
  if bytes > 1099511627776:
    value = bytes / 1099511627776.0
    units = "TB"
  elif bytes > 1073741824:
    value = bytes / 1073741824.0
    units = "GB"
  elif bytes > 1048576:
    value = bytes / 1048576.0
    units = "MB"
  elif bytes > 1024:
    value = bytes / 1024.0
    units = "kB"
  else:
    value = float(bytes)
    units = "bytes"

  return "%.2f %s" % (value, units)

if __name__ == "__main__":
  main()
