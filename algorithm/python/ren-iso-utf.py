#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Seg 10/Ago/2009 hs 15:03
# Last Change: Seg 10/Ago/2009 hs 15:03
# vim:ft=python:nolist:nu:
# Instituicao: <+nome+>
# Proposito do script: <+descreva+>
# Autor: <+seuNome+>
# site: <+seuSite+>

'''
Função para renomear recursivamente alterando codificação
Autor: Eliezer Riani
Contato: contato@eliezer.eti.br
Site: http://www.eliezer.eti.br

Nome da Função: rename
Parâmetros: diretorio: Caminho completo do diretório que pretende renomear recursivamente
			codin: Codifição em que se encontram os nomes dos arquivos
			codout: Codificação dos nomes após renomeados
'''
def rename(diretorio,codin="iso8859-15",codout="utf-8"):
		for pasta,pastas,arquivos in os.walk(diretorio):
			for nome in arquivos:
				os.rename(pasta+'/'+nome, pasta+'/'+nome.decode(codin).encode(codout))
			for nome in pastas:
				os.rename(pasta+'/'+nome, pasta+'/'+nome.decode(codin).encode(codout))
# Fim Função para renomear recursivamente
