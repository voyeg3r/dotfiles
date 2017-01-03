
alias w3m='w3m -cookie'
w3m www.google.com.br

##pegar ip externo

w3m miip.cl | awk '/ip es/ {print $6}'


 