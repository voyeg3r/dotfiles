Arquivo: dicas sobre o imputrc e atalhos do bash
Criado: Sáb 29/Jan/2011 hs 09:32
Last Change: dom 08 jan 2017 12:03:31 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r

### O arquivo inputrc

Controla atalhos de teclado do bash, com uma configuração adequada
somada às configurações do /etc/bash_completion.d/ temos um terminal
bastante amigável

### Como listar os atalhos do terminal

  bind -p

### Magic space

Digitando

  !find<space>

O shell mostrará o ultimo find sem executa-lo

  sudo !!<space>

Exibe o ultimo comando 'sudo' sem executa-lo

------------------------------------------------------------------------------------------------------------
bind Space:magic-space     # enable option to expand & edit a command before running it by entering a [space]
------------------------------------------------------------------------------------------------------------

!1[space]            # expand the first command in the history list without executing
!12[space]           # expand command no. 12
sudo !![space]       # expand last command
!-4[space]           # expand the fourth last command
!cd[space]           # expand the last cd command
!?world?[space]      # expand the last command containing the specified word
!$[space]            # last word of the preceding command line
!:1[space]           # first argument of the preceding command
!-1:1[space]         # same
!-1:1-[space]        # all arguments of the previous command except the last on
!-1:1*[space]        # all arguments of the previous command
!-1:1-$[space]       # same
!-2:3[space]         # third argument from the command before the last one
