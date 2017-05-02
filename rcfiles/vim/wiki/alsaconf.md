
### Configurar som no Linux através do ALSA
fonte: http://www.dicas-l.com.br/print/20090406.html

**//Colaboração: Sérgio Abrantes//**
**//Data de Publicação: 06 de April de 2009//**

Vejo muita gente passando dificuldade para configurar o som do computador no
Linux. Nessa dica vou mostrar como é fácil fazer essa configuração.  Serão
utilizado os softwares do projeto ALSA (Advanced Linux Sound Architecture), que
podem ser conferidos no site AlsaProject.  No site acima podem ser baixados os
pacotes na seção download. O meu intuito não é de mostrar passo a passo o
download e compilação de cada pacote, até porque muitos sabores de Linux já vem
com ele. Assumirei que ele já está instalado.

###1. Identificar sua placa de som

No prompt digite o seguinte comando:

      alsaconf


Aparecerá uma tela, pressione OK; Após pressionar ok ele fará uma varredura e
mostrará na tela o seu "cartão de som"; Selecione-o na lista e pressione ok;
Ele perguntará se desejá modificar o /etc/modules.conf. Selecione "yes"; Depois
clique em ok.  ### Ajustes de volume.  No prompt de comando digite:

    alsamixer


Aparecerá uma tela com várias opções de volume. Use as setas para navegar e
ajustar o volume conforme sua necessidade e pressione ESC para sair.

###. Salvando os ajustes
Para salvar e não precisar fazer os ajustes novamente, digite no prompt de comando:

Read more here: http://askubuntu.com/a/465641/3798

       alsactl store

       alsactl --file ~/.config/asound.state store

Quando iniciar ficará tudo como deixou anteriormente.
Acho que é isso.

    vim ~/.config/autostart/alsarestore.desktop

    [Desktop Entry]
    Type=Application
    Terminal=false
    Name=alsarestore
    Exec=alsactl --file ~/.config/asound.state restore
