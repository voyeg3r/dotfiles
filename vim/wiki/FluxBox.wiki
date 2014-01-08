Arquivo: dicas do fluxbox
Criado: Thu 12/May/2011 hs 14:31
Last Change: 2011 May 12 14:37:57
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r


=Criar pasta de backgrounds do fluxbox=

ln -s ~/Dropbox/img/wallpapers/ ~/.backgrounds/

fbsetbg -r ~/.backgrounds/


Para que isto fique permanente faca:

vim ~/.fluxbox/init

    session.screen0.rootCommand: fbsetbg -r ~/.backgrounds/

=Teclas de atalho do fluxbox=

 ~/.fluxbox/keys


