O comando mktemp permite criar arquivos temporários seguros

cd $(mktemp -d)

mktemp /tmp/example.XXXXXXXXXX
# Cada X será substituido por um numero randômico único

TMPFILE=`mktemp  /tmp/datewatch.XXXXXXXXXX`

