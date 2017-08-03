# CUPS Gerenciamente avançado de impressoras no linux
Com o serviço cups rodando acesse como root
o seguinte endereço:

    http://localhost:631/

### Copiando configurações de impressoras usando o [rsync](rsync.md)
Já fiz certa vez essa proeza, só temos que mudar o ip
da maquina e algumas besteiras mais, mas funciona e
economiza tempo

### Instalar e iniciar o serviço cups

    sudo pacman -S cups cups-pdf
    sudo systemctl enable org.cups.cupsd.service
    sudo systemctl start org.cups.cupsd.service
