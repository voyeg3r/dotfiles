### Introdução

* http://designix.wordpress.com/2007/02/03/introducao-ao-screen/
* http://listas.cipsga.org.br/pipermail/linux-sbo/2004-August/000278.html
* http://gutocarvalho.net/mediawiki/index.php?title=Usando_o_gnu-screen
* http://www.softpanorama.org/Utilities/Screen/screenrc_examples.shtml
* http://www.oreillynet.com/linux/cmd/cmd.csp?path=s/screen

Após fazer o login via ssh (incluindo putty) você pode digitar

  screen

|| **Key** || **Action** || **Notes** ||
|| Ctrl+a c || new window ||   ||
|| Ctrl+a n || next window || I bind F12 to this ||
|| Ctrl+a p || previous window || I bind F11 to this ||
|| Ctrl+a " || select window from list || I have window list in the status line ||
|| Ctrl+a Ctrl+a || previous window viewed ||   ||
||   ||   ||   ||
|| Ctrl+a S || split terminal horizontally into regions || Ctrl+a c to create new window there ||
|| Ctrl+a | || split terminal vertically into regions || Requires debian/ubuntu patched screen 4.0 ||
|| Ctrl+a :resize || resize region ||   ||
|| Ctrl+a :fit || fit screen size to new terminal size || Ctrl+a F is the same. Do after resizing xterm ||
|| Ctrl+a :remove || remove region || Ctrl+a X is the same ||
|| Ctrl+a tab || Move to next region ||   ||
||   ||   ||   ||
|| Ctrl+a d || detach screen from terminal || Start screen with -r option to reattach ||
|| Ctrl+a A || set window title ||   ||
|| Ctrl+a x || lock session || Enter user password to unlock ||
|| Ctrl+a [ || enter scrollback/copy mode || Enter to start and end copy region. Ctrl+a ] to leave this mode ||
|| Ctrl+a ] || paste buffer || Supports pasting between windows ||
|| Ctrl+a > || write paste buffer to file || useful for copying between screens ||
|| Ctrl+a < || read paste buffer from file || useful for pasting between screens ||
||   ||   ||   ||
|| Ctrl+a ? || show key bindings/command names || Note unbound commands only in man page ||
|| Ctrl+a : || goto screen command prompt || up shows last command entered ||


Atalhos do screen

 ^a ^c ................ nova seção
 ^a <tab> ............ alterna seção
 ^a ^p ................ seção anterior
 ^a ^n ................ próxima seção
 ^a ^S ................ divide a janela
  screen -x .......... encerra uma seção
 ^a d ................ acessar novamente o screen que foi aberto anteriomente

screen -ls ........... lista seções do screen
screen -S sergio ..... inicia uma seção nomeada 'sergio'
screen -x sergio ..... conecta à seção 'sergio'



### screenrc

vbell off
hardstatus off
backtick 1 1200 1200 whoami
caption always "%{= cW} %c | %l | %-Lw%{= bW}%65> [%n] %t %f* %{-}%+Lw%<"
