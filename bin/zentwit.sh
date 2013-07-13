#!/bin/bash
# Criado em:Sáb 23/Jan/2010 hs 18:38
# Last Change: Sáb 23 Jan 2010 18:39:13 BRT

# Postar no Twitter via terminal usando zenity.
# Script desenvolvido por Leonardo Abreu >> twitter.com/@leonardosabreu
# Data: 22/01/2010
# Versão: 0.1

# Armazena nome do usuario no Twitter:
login=$(zenity --entry --text "Twitter: Insira seu login:")

# Armazena a senha ocultando seu conteudo:
pass=$(zenity --entry --hide-text --text "Twitter: Informe sua senha:")

# Armazena a mensagem a ser enviada ao Twitter:
post=$(zenity --entry --text "Twitter: Digite sua mensagem em 140 caracteres:")

# Faz o login no twitter e posta a mensagem digitada.
curl -u $login:$pass -d status="$post"
http://twitter.com/statuses/update.xml &> \ /dev/null
