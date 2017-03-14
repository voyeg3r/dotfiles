### Introdução
Para aquelas situações em que você deseja saber
a versão do sistema use este comando:


   lsb_release -a

   Distributor ID: Ubuntu
   Description:    Ubuntu 7.10
   Release:        7.10
   Codename:       gutsy

   Exibe a versão, o codinome e outras informações sobre uma distribuição linux

   lsb_release -a  .............. exibe informação completa
   lsb_release -c  .............. exibe o codinome
   lsb_release -r  .............. no caso do ubuntu 10.10 exibe --> "Release:	10.10"


### Exibir somente o codinome da versão

lsb_release -cs

### Para exibir somente o número da versão

lsb_relase -rs
