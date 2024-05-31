#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
#        site:  oblogdefelix.blogspot.com
#        File:  calc.py
#      Author:  Sergio Araujo
#     Purpose:  python calculator
# Last Change:  2018 jun 01 19:56
#     Created:  sex 01 jun 2018 19:55:44 -03
#       email:  <voyeg3r ✉ gmail.com>
#      Github:  https://github.com/voyeg3r
#     twitter:  @voyeg3r

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
