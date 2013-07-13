import math
# Criado em:Qui 05/Jan/2006 hs 13:13
# ultima modificação: Sex 03 Fev 2006 20:17:48 BRST
# Agenda telefônica
# Autor: Sérgio Luiz Araújo Silva

class esfera:

    pi = 3.14 #atributo

    def __init__(self, raio): #construtor
        self.raio = raio

    def volume(self): #metodo_para_calculo_do_volume
        self.VolumeEsfera = (4/3) * self.pi * pow(self.raio,3)
        print "Volume da esfera: %f" %self.VolumeEsfera

    def superficie(self): #metodo_para_calculo_da_superficie
        self.AreaEsfera = 4 * self.pi * pow(self.raio, 2)
        print "Area da Esfera: %f" %self.AreaEsfera

