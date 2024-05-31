#!/usr/bin/env python
# source: https://bbs.archlinux.org/viewtopic.php?id=101509

fg = '\033[38;5;'
bg = '\033[48;5;'

for i in range( 0, 256):
  n = str(i)
  fgstr = fg + n + 'm' + n
  bgstr = bg + n + 'm' 'XXXXX'
  print(fgstr, bgstr, '\033[0m')
