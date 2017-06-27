# Mostrar uma linha aleatória de um arquivo

    shuf -n1 file.txt

    mplayer $(ls -a ~/Music/**/*.mp3 | shuf)

    gsettings set org.gnome.desktop.background picture-uri file://`ls ~/img/new-wallpapers/* | shuf | tail -1`


    ls ~/pictures/new-wallpapers | shuf -n1
