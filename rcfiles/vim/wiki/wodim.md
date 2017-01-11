O comando wodim grava imagens em discos
ou seja grava cds e dvds

### Detectar dispositivos

   wodim --devices

### Gravar imagem no disco

wodim -eject  -tao speed=0 dev=/dev/scd0 -v -data /my/directory/image.iso

### Criar uma imagem de um diretório
Create an ISO image and then burn it
gravar um dvd ou gravar um cd

 mkisofs -r -o mycdimage.iso  /home/kushalk/mydatadirectory

 "gravar cds"

### convert mp3 to wav

 for i in *.mp3; do lame --decode "$i" "`basename "$i" .mp3`".wav; done

 	 wodim -v -pad speed=1 dev=/dev/cdrw -dao -swab *.wav
