#!/bin/bash

#    Copyright 2010 Aaditya Bhatia http://www.dragonsblaze.com/
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    See GNU General Public License at <http://www.gnu.org/licenses/>.

# This script updates individual ISO image from cdimage.ubuntu.com via rsync
# Orginal script written by Henrik Omma, slightly adjusted by Bert Verhaeghe,
# then a bit by Victor Van Hee. 
# Jeremy Yoder made it try to automatically pick an ISOPATH,
# adapted to karmic by Christian Bangerter.
# And then Aaditya pimped it up a little (curl, stdout text, md5 logic)

# This is how you adjust the ISOPATH, in case you need to.
# ISOPATH="cdimage.ubuntu.com/cdimage/LOCATION/current"

# If a command line argument is present, use that as ISO name
if [ -n "$1" -a $(expr "$1" : '.*\.iso$') -gt 4 ]; then
 ISO=`basename $1`;
 cd `dirname $1`;
else
 echo -e "\nUsage:\n\t$(basename $0) UBUNTU-IMAGE-FILENAME.iso\n";
 exit 1;
fi

if [ "$ISOPATH" = "" ]; then
 if [[ "$ISO" =~ "-desktop-" ]]; then
 ISOPATH="cdimage.ubuntu.com/cdimage/daily-live/current"
 elif [[ "$ISO" =~ "-alternate-" ]]; then
 ISOPATH="cdimage.ubuntu.com/cdimage/daily/current"
 elif [[ "$ISO" =~ "-dvd-" ]]; then
 ISOPATH="cdimage.ubuntu.com/cdimage/dvd/current"
 elif [[ "$ISO" =~ "-netbook-remix-" ]]; then
 ISOPATH="cdimage.ubuntu.com/cdimage/ubuntu-netbook-remix/daily-live/current"
 elif [[ "$ISO" =~ "-server-" ]]; then
 ISOPATH="cdimage.ubuntu.com/cdimage/ubuntu-server/daily/current"
 else
 echo "Unrecognized distribution, set \$ISOPATH manually"
 exit 2;
 fi
fi

curl -sI "http://$ISOPATH/$ISO" | head -1 | grep 200 > /dev/null;

if [ $? -eq 0 ]; then
 echo "Location: rsync://$ISOPATH/$ISO";
else
 echo "Not Found: http://$ISOPATH/$ISO";
 exit 2;
fi;


echo -n "Fetching latest md5sum from the server... "
curl -s http://$ISOPATH/MD5SUMS | grep $ISO > $ISO.md5
echo "done"

echo -n "Comparing local and server MD5SUMs... "
md5sum --status -c $ISO.md5

if [ $? -eq 0 ]; then
 echo "match!"
 echo "Local copy is up to date."
 rm $ISO.md5;
 exit 0
else
 echo "mismatch!"
 echo "Performing rsync..."
 rsync -avzhhP rsync://$ISOPATH/$ISO .
fi

echo -n "Comparing local and server MD5SUMs one more time... "

md5sum --status -c $ISO.md5

if [ $? -eq 0 ]; then
 echo "match!"
 echo "Success!"
 rm $ISO.md5;
else
 echo "mismatch!"
 echo "FAILED!"
 rm $ISO.md5;
 exit 2;
fi
