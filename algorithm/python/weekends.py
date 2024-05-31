#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Sex 12/Out/2012 hs 14:41
# Last Change: 2018 mai 18 09:57
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: generate weekends for given year
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# source: python user group Ceara, Brazil PUG-CE

from dateutil.rrule import rrule, DAILY
from datetime import date
import time

ano = time.localtime()[0]

def weekends(year):
    year_dates = rrule(DAILY, count=365, dtstart=date(year,1,1))
    return (d for d in year_dates if d.weekday()>=5)

if __name__=="__main__":
    for d in weekends(ano):
        print(d, d.weekday())
