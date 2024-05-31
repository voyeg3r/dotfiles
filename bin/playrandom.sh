#!/usr/bin/env bash
# Last Change: Thu, 01 Feb 2024 - 11:27:12
# Author: Sérgio Luiz Araújo Silva
# Site:   https://dev.to/voyeg3r
# tags: [mpv, english, random]
#
# Esse script exibe notificações usando o dunst
# mas necessita rodar à partir de um terminal para fazer as capturas
# de teclas, os comandos. A não ser que sejam definidos os comandos
# no seu window manager, caso em que as funções do mesmo podem ser
# acessadas, ainda assim necesitariamos de arquivos temporários para
# esse fim

clear

# Referência ao Leão da Montanha
trap 'saida_pela_esquerda' INT

saida_pela_esquerda() {
	dunstctl close
	clear
	exit 1
}

sounds=${1:-~/music/podcasts/dictation}

chose_sound() {
	chose=$(ls -1 $sounds | shuf -n 1)
	sound=${sounds}/$chose
}

# stop(){
#     psid=$(pgrep -a mpg123 | awk '/--title playrandom/ {print $1}' > /dev/null)
#     [ ! -z "$psid" ] && kill "$psid"
# }

play() {
	# dunstify -r "34587" "Playing $chose"
	echo
	echo -e "\tPlaying $chose ..."
	# mpg123 -q $sound
	mpv --quiet --no-video $sound >/dev/null
	clear
}

copy_sound() {
	[[ ! -d "~/tmp/flashcards" ]] && mkdir -p ~/tmp/flashcards
	# dunstify -r "34587" "Copying $sound to ~/tmp/flashcards"
	echo
	echo -e "\tCopying $sound to ~/tmp/flashcards"
	cp -f $sound ~/tmp/flashcards
	sleep 1
	clear
}

ask() {
	cat <<-EOF

		    Playing audios from: $(cd "$sounds" && pwd -P)

		    [Enter/n]  to continue

		    [X/x/q]    to Exit

		    [R/r]    to repeat

		    [C/c]    to copy to ~/tmp/flashcards
	EOF
}

ask && chose_sound && play

while :; do
	ask && read -s response
	case "${response,,}" in
	"" | n) chose_sound && play ;;
	x | q) clear && exit 1 ;;
	r) play ;;
	c) copy_sound ;;
	*) exit 1 ;;
	esac
done
