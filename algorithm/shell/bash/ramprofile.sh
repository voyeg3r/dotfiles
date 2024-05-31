#!/bin/bash

TODAY=$( date +%Y%m%d )
NOW=$( date +%H:%M )

#test if fstab already have a firefox entry
if test -z "$(cat /etc/fstab | grep -F "firefox" )"
then
    #kill firefox to prevent errors
    killall firefox

    zenity --info --text "Make sure Firefox is closed before proceeding" &&

    #grab profile list and create a new script to allow profile selection (I know could be more elegant)
    echo "#!/bin/bash" > ${HOME}/.mozilla/firefox/profileselect.sh
    echo "" >> ${HOME}/.mozilla/firefox/profileselect.sh
    echo 'PROFILE=$(zenity --list --height=300  --width=300 --text "Firefox Profiles" --radiolist  --column "Select" --column "Profile" \' >> ${HOME}/.mozilla/firefox/profileselect.sh
    cat $HOME/.mozilla/firefox/profiles.ini | sed "/Path/!d" | sed "s/Path=//g" | sed "s/.*/1 \'&/g" | sed "s/.*/&\' \\\/g" >> ${HOME}/.mozilla/firefox/profileselect.sh
    echo ")" >> ${HOME}/.mozilla/firefox/profileselect.sh
    echo 'echo ${PROFILE} > ${HOME}/.mozilla/firefox/profile.txt' >> ${HOME}/.mozilla/firefox/profileselect.sh
    chmod +x ${HOME}/.mozilla/firefox/profileselect.sh

    #run the script to select the profile
    ${HOME}/.mozilla/firefox/profileselect.sh

    #Input variables
    PROFILE=$(cat $HOME/.mozilla/firefox/profile.txt)

    #delete old backups and create a new backup of the existing profile
    rm -f ${HOME}/.mozilla/firefox/profileFx3-${PROFILE}-*.tar 
    tar cvf ${HOME}/.mozilla/firefox/profileFx3-${PROFILE}-${TODAY}-${NOW}.tar ${HOME}/.mozilla/firefox/${PROFILE} /etc/fstab &

    RAM=$(zenity --list --height=400  --width=150 --text "How much Mb of RAM to allocate? Your cache size is 20Mb" --radiolist  --column "Select" --column "Memory to be allocated for profile" \
    1 '64M' \
    2 '96M' \
    3 '128M' \
    4 '160M' \
    5 '192M' \
    6 '224M' \
    7 '256M' \
    8 '288M' \
    9 '320M' )

    SYNC=$(zenity --list --height=400  --width=150 --text "Profile synchronization frequency in minutes?" --radiolist  --column "Select" --column "Frequency" \
    1 '05' \
    2 '10' \
    3 '15' \
    4 '20' \
    5 '25' \
    6 '30' \
    7 '35' \
    8 '40' \
    9 '45' \
    0 '50' \
    1 '55' )
 
    #backup and modify fstab based on selected variables
    sudo cp /etc/fstab /etc/fstab.bak
    cat /etc/fstab.bak | sed -e '/firefox.*/d' > ${HOME}/.mozilla/firefox/fstab
    echo "firefox ${HOME}/.mozilla/firefox/${PROFILE} tmpfs size=${RAM},noauto,user,exec,uid=1000,gid=1000 0 0" >> ${HOME}/.mozilla/firefox/fstab
    sudo mv ${HOME}/.mozilla/firefox/fstab /etc/fstab

    #move the original profile to ramprofile
    mv ${HOME}/.mozilla/firefox/${PROFILE} ${HOME}/.mozilla/firefox/ramprofile

    #modify firefox preferences
    cat ${HOME}/.mozilla/firefox/ramprofile/prefs.js | sed -e "/user_pref(\"browser.cache.disk.enable.*/d" | sed -e "s/user_pref(\"browser.cache.disk.capacity.*/user_pref(\"browser.cache.disk.capacity\", 20000);/g" | sed -e "/user_pref(\"browser.safebrowsing.enabled.*/d" | sed -e "/user_pref(\"browser.safebrowsing.malware.enabled.*/d" > ${HOME}/.mozilla/firefox/prefs.js
    echo "user_pref(\"browser.safebrowsing.enabled\", false);" >> ${HOME}/.mozilla/firefox/prefs.js
    echo "user_pref(\"browser.safebrowsing.malware.enabled\", false);" >> ${HOME}/.mozilla/firefox/prefs.js
    echo "user_pref(\"browser.cache.disk.enable\", true);" >> ${HOME}/.mozilla/firefox/prefs.js
    cat ${HOME}/.mozilla/firefox/prefs.js > ${HOME}/.mozilla/firefox/ramprofile/prefs.js
    rm -f ${HOME}/.mozilla/firefox/prefs.js

    #create empty profile folder
    mkdir ${HOME}/.mozilla/firefox/${PROFILE}

    #send the profile to RAM
    mount "${HOME}/.mozilla/firefox/${PROFILE}"

    #copy original profile contents to RAM profile
    rsync -av -p -o -g ${HOME}/.mozilla/firefox/ramprofile/ ${HOME}/.mozilla/firefox/${PROFILE}/

    #create cron job
    echo "" > ${HOME}/.mozilla/firefox/.change.cron
    echo "USER=$USER" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "HOME=$HOME" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "SHELL=/bin/bash" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "PATH=/sbin:/bin:/usr/sbin:/usr/bin" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "DISPLAY=:0.0" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "MAILTO=$USER" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "" >> ${HOME}/.mozilla/firefox/.change.cron
    echo "0-59/${SYNC} * * * * rsync -av -p -o -g --delete ${HOME}/.mozilla/firefox/${PROFILE}/ ${HOME}/.mozilla/firefox/ramprofile/" >> ${HOME}/.mozilla/firefox/.change.cron
    crontab ${HOME}/.mozilla/firefox/.change.cron

    #launch firefox
    LAUNCH=$( echo "${PROFILE}" | sed 's/.*\.//g' )
    zenity --info --text "Firefox profile ${LAUNCH} is loaded into RAM. Firfox launch automatically now. Don't forget to unload the profile after using Firefox!" &&
    firefox -P ${LAUNCH} &
else
    #alert in case fstab already have a firefox entry
    zenity --info --text "The fstab already has a Firefox entry. You should try to unload the profile from RAM first."
fi
exit
