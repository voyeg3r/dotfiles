#!/bin/bash
# postando no twitter usando shell script

echo "Digite sua mensagem."
read MSG
echo $MSG > characters
echo "Tamanho da mensagem"
wc -c characters
echo "Digite sua senha do twitter..."
read -s PW
wget --keep-session-cookies --http-user=voyeg3r@gmail.com --http-password=$PW \
--post-data="status=$MSG" \
http://twitter.com:80/statuses/update.xml
echo "Mensagem enviada :)."

