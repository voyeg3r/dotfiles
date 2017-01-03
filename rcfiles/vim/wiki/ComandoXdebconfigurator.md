Detecta opções do monitor
fonte: http://laudecioliveira.org/blog/?p=55

Desde que o comando dpkg-reconfigure xserver-xorg foi simplificado a ponto de não detectar informações sobre o monitor que está sendo utilizado procurei uma maneira de verificar informações para configuração do xorg. Nesta busca encontrei o utilitário xdebconfigurator.

Para instalar execute o comando:

   $ sudo apt-get install xdebconfigurator

Após a instalação execute:

   $ sudo xdebconfigurator

Dentre as informações mostradas vale ressaltar:

MONITOR:  Plug n' Play              # monitor detectado
MONITOR SIZE: 15 inches (380 mm)   # tamanho do monitor
MONITOR HOR SYNC: 28-50                         # frequencia horizontal
MONITOR VER REFR: 43-75                           # frequencia vertical
MONITOR MODES: 1024x768, 800x600, 640x480         # modos suportados
MONITOR MODE: 1024x768 @ 70Hz                             # modo atual

Com essas informações em mãos posso saber qual o driver utilizado no meu vídeo e como configurar a resolução no xorg…

Boa sorte : D