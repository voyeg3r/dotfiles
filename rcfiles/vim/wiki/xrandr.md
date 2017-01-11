### mostrar resolução de tela

 xrandr | awk -F"," '/^Screen 0/ {print $2}'
