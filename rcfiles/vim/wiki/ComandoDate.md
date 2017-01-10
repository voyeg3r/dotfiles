### Introdução

# date "+Data: %d/%m/%Y%nHora: %H:%M:%S"
Data: 29/04/2011
Hora: 21:18:34

### Calculos com datas
# referencia: http://www.dotsharp.com.br/linux/como-fazer-calculos-e-formatacao-de-data-no-linux.html

 date --date='1 year ago'
Thu Apr 29 21:24:37 BRT 2010

# um da antes

    date -d "2016-05-01 - 1 day"

    date -d "2016-05-01 - 1 day" +%d-%m-%Y

### data futura
# date --date='1 month'
Sun May 29 21:26:04 BRT 2011

### qual o número da semana atual?

    date +"%V"

### quantos dias faltam para o fim do ano?
source: http://www.commandlinefu.com/commands/view/4804/how-many-days-until-the-end-of-the-year?

How many days until the end of the year

echo "There are $(($(date +%j -d "Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."

### ano bissexto

leapyear() { [ $(date -d "Dec 31, $1" +%j) == 366 ] && echo leap || echo not leap; }

### adiantar o relógio do sistema em 30 minutos

# date --set='+30 minutes'


### sincronizando a data de um servidor com outro

sudo date -s "$(ssh user@server.com "date -u")"

### Verificar a data de modificação de um arquivo

date -r foo

### Para exibir a data no padrão americano

date -I

### Para configurar a data faça

 date  mês-dia-hora-minuto[[seculo[ano]]

O formato deve ser definido assim: MMDDHHMM[[CC[YY]]
O que está entre colchetes é opcional

### Configurando a data com base em uma string

date -s "01/31/2009 22:19:53"
date -s "31 JAN 2009 22:19:53"

# configurando apenas o horário
date +%T -s "22:19:53"


### data de amanhã

date -d 'tomorrow' +%d-%m-%Y
$ date --date='2 year ago'  # past
$ date --date='3 years'     # go into future
$ date --date='2 days'      # future
$ date --date="next day"    # future
$ date --date="1 days ago"  # past
$ date --date='1 month ago' # past
$ date --date='2 months'    # future
$ date -d yesterday +%d-%m-%Y
$ date --date='6 months 15 day'
$ date --date='2 months 5 day ago'

8 months earlier
          |
          |
date -d "-8 month -$(date +%d) days" +%B

### que dia (por extenso) será depois de amanhã?

	date -d '2 days' +%A

	ou que dia foi há dois dias atráz


	date -d '-2 days' +%A

### como saber que dia da semana foi 01 de outubro de 2012?

	date -d "10/1/2012" +%A

	gerando a lista de dias da semana de outubro de 2012

	for ((i=1;i<=31;i++)){
		diasemana=`echo date -d "10/${i}/2012" +%A | sh`
		numdiasemana=`echo date -d "10/${i}/2012" +%d | sh`

		echo "$numdiasemana - $diasemana"
	}

### que dia vai ser domingo

date -d 'this sunday' +%d-%m-%Y

### mês passado

date -d "last month" +%B

# em formato numérico
date -d "last month" +%m

### data de ontem

date --date="yesterday"

exemplo:
Para configurar a data em 24/03/2008 13:48h

    date 032413482008
    Seg Mar 24 13:48:00 BRT 2008

    First use Month
    after that use Month's day
    after that hour and minute
    and finally use Year


Você pode omitir século e ano

   date 03241348


Para mais informações acesse pelo terminal:

   man date

### O comando date pode também retornar strings

FBKPNEW=$(date +"backup-%Y-%m-%d")

### testar se é fim de mês

[ `date --date='next day' +'%B'` == `date +'%B'` ] || echo 'end of month'


Como no linux temos muitos comandos nem sempre o comando que você
necessita, ou que seria melhor para aquela situação, é o que
lhe vem primeiro à mente, veja um exemplo da lista shell script:


> Montei um script hoje para manter armazenado apenas os arquivos que possuem
> a data de hoje ou de ontem. Todos os demais arquivos daquele diretório serão
> apagados. O script está 100% funcional porém acredito que consigo deixá-lo
> mais conciso e abordar de outra maneira como eu busco o dia de ontem.
>
> Lembrando que eu não tenho a opção -d ou --date no comando date, segue o
> script.
>
> #! /usr/bin/bash
> SPATH="xxx"
> DAY=`date +%d`
> LDAY=`perl -e 'print localtime(time() - 86400) . "\n" ' | cut -c 9-10`
> for FILES in `ls $SPATH/Logs* | egrep -v $(date +%Y%m)"($DAY|$LDAY)"`; do rm
> $SPATH/$FILES;done
>
> Alguma sugestão?
> --
> Obrigado,
> Christian Silva
>
> [As partes desta mensagem que não continham texto foram removidas]
>

 find /diretorio_ a_excluir -type f -mtime +2 | xargs rm
