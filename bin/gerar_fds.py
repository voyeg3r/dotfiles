#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Sex 12/Out/2012 hs 12:58
# Last Change: 2012 Out 12 13:07:24
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: gerar lista de finais de semana
# Autor: Vladymir Bezerra - Python user group Ceará
# site: vivaotux
# twitter: voyeg3r
# referência: http://va.mu/YFs3

import datetime

def gerar_fds(ano):
	dias = ['segunda', 'terça', 'quarta', 'quinta', 'sexta', 'sábado', 'domingo']
	meses = ['', 'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro']
	startdate = datetime.date(ano,1,1)
	while(startdate.year == ano):
		if startdate.weekday() in [5,6]:
			yield ("%s %d %s" % (meses[startdate.month],startdate.day,dias[startdate.weekday()]))
		startdate += datetime.timedelta(1)

for i in gerar_fds(2012):
		print i   # imprime todos

#fds = [ fds for fds in gerar_fds(2012)]   # gera uma lista
