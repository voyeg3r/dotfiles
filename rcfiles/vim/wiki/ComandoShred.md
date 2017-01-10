### apagar dados de um hd de forma segura

shred -n 5 -z /dev/xxx

Onde:

"-n 5" Significa que serão feitas 5 gravações consecutivas. (e não 25 que é o padrão).

"-z" significa que o último padrão a ser gravado será zero, ou seja, zera tudo, incluindo a MBR.

"/dev/xxx" É a unidade a ser "limpa".

Mais detalhes:

$ man shred

Uma combinação com o find


find /path/to/start/search -name "*.sql" -mtime +45 | xargs shred -fuvz

-f force
-u delete
-v verbose
-z grava zeros no lugar

