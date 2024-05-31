#!/usr/bin/python
# −∗− coding: utf-8 −∗−

import os
import pygtk
pygtk.require('2.0')
import gtk

class Gui:
	def destroy(self,widget, data=None):
		gtk.main_quit()
	def processar(self,widget,data=None):
		if self.combo.get_active()==0:
			self.codin="iso8859-15"
		else:
			self.codin="utf-8"
		if self.combos.get_active()==0:
			self.codout="iso8859-15"
		else:
			self.codout="utf-8"
		for self.pasta,self.pastas,self.arquivos in os.walk(self.diretorio.get_text()):
			self.status.set_markup("Entrando no diretório %s" % self.pasta)
			for self.nome in self.arquivos:
				os.rename(self.pasta+'/'+self.nome, self.pasta+'/'+self.nome.decode(self.codin).encode(self.codout))
				self.status.set_markup("Renomeando "+self.pasta+'/'+self.nome)
			for self.nome in self.pastas:
				os.rename(self.pasta+'/'+self.nome, self.pasta+'/'+self.nome.decode(self.codin).encode(self.codout))
				self.status.set_markup("Renomeando "+self.pasta+'/'+self.nome)
		self.status.set_markup('')

	def __init__(self):
		self.janela=gtk.Window(gtk.WINDOW_TOPLEVEL)
		self.janela.connect("destroy",self.destroy)
		# VBox
		self.box=gtk.VBox()
		self.about=gtk.Label()
		self.about.set_markup("<big><b>Recursive Rename by Eliezer Riani</b></big>\n<small>contato@eliezer.eti.br</small>")
		self.about.set_justify(gtk.JUSTIFY_CENTER)
		self.box.add(self.about)
		# Caixa de Texto
		self.dbox=gtk.HBox()
		self.dlabel=gtk.Label()
		self.dlabel.set_markup("Diretório a ser renomeado recursivamente: ")
		self.dbox.pack_start(self.dlabel)
		self.diretorio=gtk.Entry(max=0)
		self.dbox.pack_start(self.diretorio)
		self.box.pack_start(self.dbox)
		#Combo Cod Entrada
		self.cbox=gtk.HBox()
		self.clabel=gtk.Label()
		self.clabel.set_markup("Selecione a codificação de entrada: ")
		self.combo=gtk.combo_box_new_text()
		self.combo.insert_text(0, "iso8859-15")
		self.combo.insert_text(1, "utf-8")
		self.combo.set_active(0)
		self.cbox.pack_start(self.clabel)
		self.cbox.pack_start(self.combo)
		self.box.add(self.cbox)
		#Combo Cod Saída
		self.cboxs=gtk.HBox()
		self.clabels=gtk.Label()
		self.clabels.set_markup("Selecione a codificação de entrada: ")
		self.combos=gtk.combo_box_new_text()
		self.combos.insert_text(0, "iso8859-15")
		self.combos.insert_text(1, "utf-8")
		self.combos.set_active(1)
		self.cboxs.pack_start(self.clabels)
		self.cboxs.pack_start(self.combos)
		self.box.add(self.cboxs)
		# Botão
		self.botao=gtk.Button(label=None,stock=gtk.STOCK_CONVERT)
		self.botao.connect("clicked",self.processar)
		self.box.add(self.botao)
		# Label Status
		self.status=gtk.Label()
		self.box.pack_end(self.status)
		# Janela
		self.janela.add(self.box)
		self.janela.set_title("Recursive Rename - Eliezer Riani")
		self.janela.show_all()
	
		gtk.main()


if __name__=="__main__":
	janela=Gui()

