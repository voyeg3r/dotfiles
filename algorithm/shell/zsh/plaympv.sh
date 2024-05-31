#!/usr/bin/env zsh
#     Filename: plaympv.sh
#  Last Change: Sun, 15 Oct 2023 - 16:25:20
#        Autor: Sérgio Araújo
#         site: https://dev/to/voyeg3r
#      Licence: GPL (see http://www.gnu.org/licenses/gpl.txt)

# mpv --x11-name="mpvyoutube" $(xclip -i -selection clipboard -o) &!
# mpv --wid="mpvyoutube" $(xclip -i -selection clipboard -o) &!
mpv $(xclip -i -selection clipboard -o) &!

