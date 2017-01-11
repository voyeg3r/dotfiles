### pegar todos os links de uma página

lynx -dump http://www.domain.com | awk '/http/{print $2}'

lynx -dump url > filetext.txt

lynx -dump -display_charset=utf-8 site | less


Dump of local file

  lynx --dump ./local-file > final-file
