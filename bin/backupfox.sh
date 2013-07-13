#!/bin/sh
# source: http://blog.interlinked.org/tutorials/rsync_time_machine.html

DATA=`date "+%Y-%m-%dT%H:%M:%S"`
SOURCE=`find $HOME/.mozilla -iname "*.default"`
CURRENT=$HOME/ubuntuone/dotfiles/firefox/current

#rsync -aP --link-dest=$HOME/Backups/current /path/to/important_files $HOME/Backups/back-$date
rsync -aP --link-dest=$CURRENT $SOURCE /home/sergio/ubuntuone/dotfiles/firefox/backup-$DATA

rm -f $CURRENT

ln -s backup-$DATA $CURRENT
