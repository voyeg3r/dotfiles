#!/bin/bash
# Criado em:Qua 13/Ago/2008 hs 09:50
# Last Change: 2012 Out 07 08:24:03
# Instituicao: Fundação de cultura de fortaleza
# Proposito do script: configurar o $HOME no ubuntu
#  Autor: Sérgio Luiz Araújo Silva

clear
echo
echo "+=================================================+"
echo "|  Este script configura o home no ubuntu hardy   |"
echo "|  Célula de tecnologia da FUNCET agosto de 2008  |"
echo "|  autor: Sergio Luiz Araujo Silva                |"
echo "+=================================================+"
echo

if  [ "$(id -u)" != "0" ];  then
	echo
	echo "      Esta parte do script necessita de permissões de root"
	echo "      Faça login como root e tente novamente"
	sleep 3
	clear
	exit  1
fi

#modificações para uma conta existente  #
# vim $HOME/.config/user-dirs.dirs
# permissão padrão 600

for user in `ls /home`; do
	echo " Removendo diretórios não ocultos"
	sleep 1
	cd /home/${user}/
	ls -l | grep ^d | xargs rm -rf
	echo " Criando a nova extrutura de pastas"

         mkdir Desktop
         mkdir -p documentos/imagens
         mkdir -p documentos/textos
         mkdir -p documentos/downloads
         mkdir -p documentos/publico
         mkdir -p documentos/videos
         mkdir -p tmp
         mkdir -p bin

         echo "atribuindo as permissões nas pastas criadas"
         chown -R ${user}:${user} /home/$user

	userdir=/home/${user}/.config/user-dirs.dirs

        if [ -e $userdir ]; then

		echo " executando o primeiro grupo de substituições"
		sed -i '/XDG_DESKTOP_DIR/ s,HOME.*,HOME/Desktop",g' $userdir
		sed -i '/XDG_DOCUMENTS_DIR/ s,HOME.*,HOME/documentos",g' $userdir
		sed -i '/XDG_TEMPLATES_DIR/ s,HOME.*,HOME/documentos/modelos",g' $userdir
		sed -i '/XDG_PICTURES_DIR/ s,HOME.*,/documentos/imagens",g' $userdir
		sed -i '/XDG_PUBLICSHARE_DIR/ s,HOME.*,HOME/documentos/publico",g' $userdir
		sed -i '/XDG_DOWNLOAD_DIR/ s,HOME.*,HOME/documentos/downloads",g' $userdir
		sed -i '/XDG_MUSIC_DIR/ s,HOME.*,HOME/documentos/musicas",g' $userdir
		sed -i '/XDG_VIDEOS_DIR/ s,HOME.*,HOME/documentos/videos",g' $userdir
        fi
done

# configuração geral (para novos usuários) #
# vim /etc/xdg/user-dirs.defaults
# a permissão padrão do arquivo é 644

echo " Configurando as pastas para novos usuários"
defaultdir=/etc/xdg/user-dirs.defaults

echo " executando o segundo grupo de substituições"
sed -i 's,DESKTOP.*,DESKTOP=Desktop,g' $defaultdir
sed -i 's,DOWNLOAD.*,DOWNLOAD=documentos/download,g' $defauldir
sed -i 's,TEMPLATES.*,TEMPLATES=documentos/modelos,g' $defaultdir
sed -i 's,PUBLICSHARE.*,PUBLICSHARE=documentos/publico,g' $defaultdir
sed -i 's,DOCUMENTS.*,DOCUMENTS=documentos,g' $defaultdir
sed -i 's,MUSIC.*,MUSIC=documentos/musicas,g' $defaultdir
sed -i 's,PICTURES.*,PICTURES=documentos/imagens,g' $defaultdir
sed -i 's,VIDEOS.*,VIDEOS=documentos/videos,g' $defaultdir
echo " finalizado"

echo " Consertando o nome do mouse e do terminal"
sed -i '/X-Ubuntu-Gettext-Domain=gnome-terminal/d' /usr/share/applications/gnome-terminal.desktop
sed -i '/X-Ubuntu-Gettext-Domain=gnome-control-center-2.0/d' /usr/share/applications/gnome-settings-mouse.desktop

echo " Desabilitando terminais de 3 a 6"
sed -i '6,7s/^start/stop/g' /etc/event.d/tty[3-6]
sed -i '8s/^/#/g' /etc/event.d/control-alt-delete

echo " Consertando o /etc/hosts"
# isto afeta do desempenho do ubuntu
# pois há aplicações que acessam o nome do host

if ! grep -qs "127.0.0.1.*$HOSTNAME" /etc/hosts; then
	sed -i "s/localhost/localhost $HOSTNAME/g" /etc/hosts
fi

