#!/bin/bash
# script de configuração do gnome - gconftool-2
# Criado: Ter 30/Out/2007 hs 08:04
# Last Change: Sex 23 Nov 2007 11:42:21 BRT
# Autor: Sergio Luiz Araujo Silva

# DICAS ##########################
# para configurar na mão abra o gconf-editor
# O gconf-editor usa os tipos:
# textos ......... string
# booleanos ...... true / false
# inteiro ........ int  (quando usar valores "int") coloque assim: 'num'
#
# -t str  --> indica tipo string
#
# Para retirar todas as modificações tente:
# gconftool-2 --recursive-unset /

# ver chaves para configuração do vino
# /desktop/gnome/remote_access/enabled
# /desktop/gnome/remote_access/vnc_password
# /desktop/gnome/remote_access/require_encryption

gconftool-2 --direct \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  --type int \
  --set /apps/metacity/general/num_workspaces 4

# Papel de parede
gconftool-2 --direct \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /desktop/gnome/background/picture_filename /usr/share/backgrounds/space-02.jpg

# Definindo o programa default para importar fotos - f-spot-import
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /desktop/gnome/volume_manager/autophoto_command f-spot-import

# tema para a janela de atualizações
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s  /apps/notification-daemon/theme standard

# SEÇÃO PARA O GEDIT =============================================
# Destaiva a impressão dos cabeçalhos
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/gedit-2/preferences/print/page/print_header false

# destaca a linha corrente
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/gedit-2/preferences/editor/current_line/highlight_current_line true

# Nautilus
# o painel lateral será exibido em forma de árvore
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/nautilus/preferences/side_pane_view NautilusTreeSidebar

# habilita o ícone da Área de Trabalho - "~/Desktop"
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/nautilus/desktop/home_icon_visible true

# habilita a exibição do ícone "Computador" no Desktop
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/nautilus/desktop/computer_icon_visible true

# habilita a exibição da lixeira
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/nautilus/desktop/trash_icon_visible true

# habilita a exibição dos ícones de cds pendrives quando montados
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/nautilus/desktop/volumes_visible true

# habilita o clique único - para usar descomente apgando o caractere #
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/nautilus/preferences/click_policy single

# mostra permissões avançadas
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
   -t bool -s /apps/nautilus/preferences/show_advanced_permissions true

# Efeito no logout
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/gnome-session/options/logout_effect black

# Control Alt Delete para mostrar processos
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/metacity/global_keybindings/run_command_9 "<Control><Alt>Delete"

# Como fazer o Ctrl+Alt+Del abrir o System Monitor no GNOME
# fonte: http://www.guiaubuntupt.org/wiki/index.php?title=Ubuntu_gutsy
# Esta opção mostra a tela para desligar, trocar de usuário ou fazer logoff
# gconftool-2 -t str --set /apps/metacity/global_keybindings/run_command_9 "<Control><Alt>Delete"
# gconftool-2 -t str --set /apps/metacity/keybinding_commands/command_9 "gnome-system-monitor"


gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/metacity/keybinding_commands/command_9 "gnome-system-monitor"

#Abrir o nautilus com a tecla windows mais letra "e"
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/metacity/global_keybindings/run_command_8 "<Mod4>e"

gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/metacity/keybinding_commands/command_8 "nautilus --browser"

#Minimizar todas as janelas com tecla windows mais letra "d"
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/metacity/global_keybindings/show_desktop "<Mod4>d"

# Se quizer o comando executar igual ao do windows
#gconftool-2 \
#  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
#  -t str -s /apps/metacity/global_keybindings/panel_run_dialog "<Mod4>r"

#Desabilitando animações
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s '/apps/panel/global/enable_animations' false
# Obs: para não ver quadros ao mover janelas habilite também a função
# abaixo

#Ativando recursos reduzidos
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s '/apps/metacity/general/reduced_resources' true

# Ao ativar "reduced_resouces" o modo como arrastamos janelas fica estranho, para consertar isto
# vá em Sistema >> Preferências >> Preferêncais de tecnologias assistivas e ative a primeira
# caixa de verificação ou cole a linha abaixo num konsole e pressione Enter Sorridente

#Ativando Tecnologias assistivas (se desabilitou animações é bom usar)
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
   -t bool -s '/desktop/gnome/interface/accessibility' true

#Removendo restrições de arquivos pdf no evince
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s  '/apps/evince/override_restrictions' true

# Tema para o ambiente
# proteção de tela
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/gnome-screensaver/themes screensavers-cosmos-slideshow

gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/metacity/general/theme Clearlooks

gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /desktop/gnome/interface/gtk_theme Clearlooks

# Configura o tema de ícones padrão
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /desktop/gnome/interface/icon_theme Human


#gconftool-2 \
#  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
#  -t str -s /desktop/gnome/interface/icon_theme gnome

# Renderização de fontes (afeta tamanho das janelas)
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t float --set /desktop/gnome/font_rendering/dpi 96

# gnome terminal - fonte branca fundo preto
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/gnome-terminal/profiles/Default/foreground_color "#ffffff"

gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/gnome-terminal/profiles/Default/background_color "#000000"

gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/gnome-terminal/profiles/Default/use_theme_colors false

# Transparência no terminal (.75 darkness)
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t str -s /apps/gnome-terminal/profiles/Default/background_type transparent

gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t float -s /apps/gnome-terminal/profiles/Default/background_darkness 0.75

# file-roller abre na pasta ao descompactar
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t bool -s /apps/file-roller/dialogs/extract/view_destination_folder true

# gnome-btdownload (cliente padrão para bittorrent no gnome, setando porta máxima)
# por padrão ele escuta apenas na 6881
gconftool-2 \
  --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults \
  -t int -s /apps/gnome-btdownload/settings/max_port 6889


