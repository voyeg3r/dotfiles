
* fonte: http://blog.elcio.com.br/o-linux-tambem-fala/

$ sudo apt-get install espeak


Daí é só mandar:

$ espeak "Luke, I am your father."

E fala português também:

$ espeak -v pt "Luke, eu sou seu pai."

Com -f arquivo.txt, ele lê o texto de um arquivo. Com -w 
arquivo.wav, ele salva o áudio num arquivo. E pode ser comandado via ssh.

Consegue imaginar utilidades para isso?