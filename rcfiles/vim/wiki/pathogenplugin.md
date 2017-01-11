Arquivo: descriação do plugin pathogen do vim
Criado: Dom 07/Nov/2010 hs 10:05
Last Change: 2010 Nov 07 10:13:32
autor: Sérgio Luiz Araújo Silva
site: vivaotux.blogspot.com
twitter: voyeg3r.twitter.com

O plugin pathogen cria uma pasta única onde se colocam
as pastas dos plugins por inteiro,

Esta era a aboradagem tradicional, nela cada plugin instala
um arquivo em plugin, outro em doc, outro em autoload e assim por diante

     ~/.vim
        |
        +--plugin
        |
        +--doc
        |
        +--autoload

Com o plugin pathogen cada plugin deve ser
instalado inteiramente na pasta bundle, a única
excessão é o próprio plugin pathogen que coloca
também um arquivo em autoload, direto na pasta .vim

     ~/.vim
        |
        +--bundle
              |
              +--plugin
              |
              +--doc
              |
              +--autoload


