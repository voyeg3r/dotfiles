### Introdução
corta os campos de 2 a 5

     echo "1234566" | cut -c2-5

exibe o campo 1  (-d = delimitador de campo)

    cut -d: -f1 < /etc/passwd

O mesmo resultado com o [[awk]]

    awk -F: '{print $1}' /etc/passwd

### imprimir tudo exceto primeira coluna

    cut -f 2- -d " "


Tenho um arquivo seguinte estrutura:

13/04/2009 & Seg & M & x & 1 & A & In & 3C & z & \\ \hline
13/04/2009 & Seg & V & x & 2 & Jxs & Ma & 3A & z & \\ \hline
13/04/2009 & Seg & M & x & 3 & A & D\' & 1H & z & \\ \hline
13/04/2009 & Seg & M & x & 4 & & & & z & \\ \hline

O objetivo é fazer com que ocorra o seguinte:

13/04/2009 & Seg & M & x & 1 &
13/04/2009 & Seg & V & x & 2 & A & In & 3C & z & \\ \hline
13/04/2009 & Seg & M & x & 3 & Jxs & Ma & 3A & z & \\ \hline
13/04/2009 & Seg & M & x & 4 & A & D\' & 1H & z & \\ \hline
& & & z & \\ \hline

O "&" é o separador de campo.

Agradeço.

Solução

cut -d"&" -f -5 arquivo

