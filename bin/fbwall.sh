#!/bin/sh
#fbwall.sh

# instale o xdialog!

#saudação
Xdialog --title "Wallpaper do Fluxbox" --msgbox "Este é um script de seleção de Wallpapers para Fluxbox\nCaso queira Cancelar a ação voce pode fazê-lo no estágio\nde seleção de figuras" 10 50
#seleciona a pasta que contem o wallpaper anterior
ant=`cat ~/.fluxbox/lastwallpaper | grep 0.0 | awk -F\| '{print $2}'`
ant=`dirname "$ant"`
#seleciona a figura do wallpaper
file=`Xdialog --stdout --title "Selecione a figura" --fselect "$ant" 30 75`
#gera uma variável sem espaços baseada em file para teste
ant=`echo "$file" | awk '{print $1}'`
if [ $ant ]; then
   #seleciona Wallpapersetter anterior
   ant=`cat ~/.fluxbox/lastwallpaper | grep wpsetters | awk '{print $2}'`
   sett=`Xdialog --stdout --title "Wallpaper" --inputbox "Wallpapersetter\n(Ex: Esetroot)" 10 50 "$ant"`
   #seleciona propriedades
   pos=`Xdialog --stdout --title "Wallpaper" --menubox "Posição" 20 50 10 "-f" "Fullscreen" "-c" "Centralizado" "-t" "Ajustado" "-a" "Maximizado"`
   #gera o comando
   if [ $sett ]; then
      fbsetbg -u "$sett" "$pos" "$file"
   else
      fbsetbg "$pos" "$file"
   fi
fi
