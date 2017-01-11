
### Recording your Desktop screen
source: http://www.tecmint.com/record-ubuntu-desktop-screen-using-avconv/

avconv -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx264 -threads 4 $HOME/output.avi
