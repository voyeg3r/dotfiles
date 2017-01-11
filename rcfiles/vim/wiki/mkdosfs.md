### Introdução
fonte: [[http://www.bestlinux.com.br/index.php?option=com_content&task=view&id=5127&Itemid=127| bestlinux]]

 df
`

Esse comando informará todas as unidades montadas no seu sistema, inclusive o pendrive que você deseja formatar. Identifique-o na lista e a seguir digite:


mkdosfs -F 32 /dev/sda1

