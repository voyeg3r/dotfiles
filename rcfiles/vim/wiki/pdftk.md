Arquivo: manual do comando pdftk

    Criado: Sex 04/Nov/2011 hs 19:25
    Last Change: dom 08 jan 2017 12:34:46 BRT
    autor: Sérgio Luiz Araújo Silva
    site: http://vivaotux.blogspot.com
    twitter: http://www.twitter.com/voyeg3r
    email: <voyeg3r  gmail.com>

### Pdftk - manipulando pdfs por linha de comando
* source: http://www.vivaolinux.com.br/dica/Manipulando-arquivos-PDF-com-pdftk

Uma alternativa mais leve é o [stapler](stapler)

### Concatenando dois arquivos em um

	pdftk Arquivo1.pdf Arquivo2.pdf cat output Concatenado1e2.pdf

### Dividindo arquivos

	pdftk Arquivo.pdf burst

Desta forma cada página do arquivo será separada em um arquivo independente e
nomeados como pg_0001.pdf, pg_0002.pdf e assim por diante.

### Selecionando páginas a serem separadas

	pdftk arquivo.pdf cat 1-5 10-12 output paginasselecionadas.pdf

* o arquivo paginasselecionadas.pdf será criado com as páginas de 1 a 5 e de 10 a 12 do arquivo arquivo.pdf.

Pode-se remover uma determinada página repetindo o comando anterior alterando
apenas os parâmetros. Por exemplo, remover a página 5 de um arquivo:

	pdftk arquivo.pdf cat 1-4 6-end output novoarquivo.pdf

### convertendo formato cbr para pdf
# source: http://askubuntu.com/questions/207172/how-to-convert-cbr-to-pdf

  O formato cbr é usado em comics (cartoons)
  Você deve ter instalados os programas: pdftk sam2p unrar unzip

  O comando de conversão é:

    cbr2pdf file.cbr

