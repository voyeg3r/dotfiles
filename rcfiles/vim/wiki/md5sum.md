### Introdução
O comando md5sum checa a integridade de arquivos

  # checar md5sum à partir de um arquivo
  md5sum -c md5sum.txt
  md5sum --check md5sums.txt

[ "c84fa6b830e38ee8a551df61172d53d7" = "$(md5sum myfile | cut -d' ' -f1)" ] && echo OK || echo FAIL

echo "resultado do teste md5sum"
echo md5sum -c MD5SUMS
