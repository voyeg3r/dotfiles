#!/usr/bin/env python
# oblogdefelix.blogspot.com

import sys,string
from numpy import *

list=sys.argv
if (size(list)>1):
   del list[0]
   expr=string.join(list,'')
   print expr,'='
   x=compile(expr,'','eval')
   print eval(x)
else:
   print 'Usage:'
   print ''
   print " calcfx 'expression'"
   print ''
   print 'Ex:'
   print " calcfx '3.*sin(pi/4.)'"
   print " calcfx 'roots(array([1. 0. -1.]))'"
   print ''
   print 'Note: always use decimal point or operations can be understood as integer operation:'
   print ' 1/2 and 1./2. are 0 and 0.5 respectively.'
