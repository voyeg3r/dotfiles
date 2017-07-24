#Arquivo: Dicas do Gnome-Shell

```
Criado: Wed 04/May/2011 hs 17:23
Last Change: dom 08 jan 2017 12:03:30 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com twitter:
http://www.twitter.com/voyeg3r
```

### Am I using wayland or X11?

    echo $XDG_SESSION_TYPE

### Fixing dir names
+ https://askubuntu.com/a/737236/3798

    xdg-user-dirs-update --set DESKTOP "$HOME/Desktop"
    xdg-user-dirs-update --set DOWNLOAD "$HOME/Downloads"
    xdg-user-dirs-update --set TEMPLATES "$HOME/modelos"
    xdg-user-dirs-update --set DOCUMENTS "$HOME/docs"
    xdg-user-dirs-update --set PICTURES "$HOME/img"
    xdg-user-dirs-update --set VIDEOS "$HOME/videos"

### set system sound above 100%
+ https://superuser.com/a/1017972/45032
install pulseaudio

on debian like for example

    pactl -- set-sink-volume 0 150%

### shortcuts

    minimize .................. super + h
    show ...................... super + s
    super (windows) + a ....... show applications
    Super+Shift+Page Up ....... move current windows to ...

### Cleaning up Linux journal
+ https://cubethethird.wordpress.com/2016/05/10/cleaning-up-linux-journal/


While reading up on a few random things, I stumbled across info on the Arch
Wiki about how the system journal archives can get quite large, and may cause
slowdowns. This is caused by a lack of limit in place for the size of journals
stored. To my surprise, I had nearly 4GB of space taken up by system journals
in /var/log/journal. I ran the following command to clear that up:

    journalctl --vacuum-size=100M

This brought the size down to approximately 100MB. Along with this, I’ve set a
limit to the journals, by editing the /etc/systemd/journald.conf:

    SystemMaxUse=100M

### How do I know if I am using wayland or x11

The `XDG_SESSION_TYPE` environmental variable takes precedence. One of "
unspecified ", " tty ", " x11 ", " wayland " or " mir "

### disable lockdown screen
+ https://askubuntu.com/q/675256/3798

This option only prevents alowing user to lock screen manually

    gsettings set org.gnome.desktop.lockdown disable-lock-screen true

avoid lock on suspending desktop

    gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false

### delay until screen goes black

    gsettings get org.gnome.desktop.session idle-delay
    gsettings set org.gnome.desktop.session idle-delay 600

### Startap applications

rode o comando (Alt+F2) dialog run:

    gnome-session-properties

### How can I delay a specific program on startup?
+ https://askubuntu.com/a/195036/3798

    gedit ~/.config/autostart/application.desktop

Append the following line to the file:

    X-GNOME-Autostart-Delay=foo

where foo is the time in seconds you want to delay the application launch by, e.g.:

    X-GNOME-Autostart-Delay=60


    [Desktop Entry]
    Encoding=UTF-8
    Type=Application
    Name=Conky
    Name[en_US]=Conky
    Exec=/usr/bin/conky
    Comment[en_US]=
    StartupNotify=true
    X-GNOME-Autostart-Delay=60

### ocs-url
+ https://www.linux-apps.com/p/1175480/

It is a protocol similar to apt-url that allows us to
install new gnome-shell themes easily

### theme list

+ united theme: https://www.gnome-look.org/p/1174889/
+ zuki: https://github.com/lassekongo83/zuki-themes

### Backing up gnome-shell extensions

    rsync -av --update --delete ~/.local/share/gnome-shell/extensions/ ~/docs/conf/gnome-shell/extensions

### Enabling extensions through command line

Enable user-theme

    gnome-shell-extension-tool -e user-theme

Whith "-d" you will disable any extension

Oh, and you can get the names of all your locally installed extensions by doing

    ls ~/.local/share/gnome-shell/extensions

org.gnome.shell enabled-extensions ['workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'gravatar@jr.rlabs.io', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'activities-config@nls1729', 'CoverflowAltTab@palatis.blogspot.com', 'applications-overview-tooltip@RaphaelRochet', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'remove-contacts-search@busaster.gmail.com', 'impatience@gfxmonk.net', 'quicklists@damianbasic.gmail.com', 'backslide@codeisland.org', 'mediaplayer@patapon.info']

### save alsamixer settings
source: http://askubuntu.com/a/465641/3798

    alsactl --file ~/.config/asound.state store

    reloading:

    alsactl --file ~/.config/asound.state restore

    vim ~/.config/autostart/alsarestore.desktop

    Entries in ~/.config/autostart/ directory are used to autostart programs
    and services for specific user on startup/graphical login.

    The contents of the .desktop file should be the following:

    [Desktop Entry]
    Type=Application
    Terminal=false
    Name=alsarestore
    Exec=alsactl --file ~/.config/asound.state restore

    Among other things, you could store your config in /etc/asound.state and
    symlink it to /var/lib/alsa/asound.state, but this one is more of a suggestion
    rather than tested solution

    Another user of askubuntu posted this:
    Obs: The top answer didn't work for me but this did! I created a config
    file and placed it at /etc/asound.state and added the reload line to my
    /etc/rc.local

    The first sugestion I got was this:

    sudo alsactl store

    This should save alsamixer configurations to /etc/asound.state which gets
    loaded every startup.

    another attempt:

    After 2 months of trying to make "sudo alsactl store" to work, I finally
    managed to do it. Firstly type in terminal "alsamixer" to enter the
    alsamixer UI. Then make the configurations you need(e.g increase
    speakers/headphones level or unmute something pressing "m" on keyboard).
    Now the most important part. Before you exit alsamixer, open a new terminal
    and do : "sudo su" to get high privileges (Be very careful with commands
    you use in "sudo su" mode because you may destroy your system) and then do
    "alsactl store" to save alsa settings. Then close both terminals and
    restart your computer. This will do the job.

### how to set languages shortcuts from config files or command line
http://askubuntu.com/questions/604462/

    gsettings set org.gnome.desktop.interface clock-show-date true

   # do not show menu on terminal

   gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

   gsettings set org.gnome.desktop.datetime automatic-timezone true

### cleaning cached thumbnails

    find .cache/thumbnails -type f | xargs rm -f

### Increasing the sound through command line

    pactl set-sink-volume 0 +10%

    And to make the volume go down by the same amount, the command would be:

    pactl set-sink-volume 0 -- -10%

### touche to click on touchpad

    gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

### Set keyboard language

    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'br'), ('xkb', 'us')]"

### Disable update checking for gnome extensions

    gsettings set org.gnome.shell disable-extension-version-validation "true"

### change wallpaper every so many minutes
+ https://extensions.gnome.org/extension/543/backslide/

http://thornton2.com/How_To_Shuffle_Your_Desktop_Background_Every_So_Many_Minutes_in_GNOME_and_MATE

### Amazing site to get wallpapers
+ http://sf.co.ua/

#!/bin/sh
echo $DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus_session_bus_address

(You can name the file in the echo command whatever you want, but it's a dot-file in order to keep it hidden from ordinary listings.)

Run the echo command from a shell (or from the Run prompt accessed by Alt+F2) so that you don't have to log out for the shuffling to start.  Otherwise, just log out and log in again after you follow all the rest of these instructions.

Change the file permissions to executable.  To do that in a shell, use the command:

chmod a+x ~/bin/login-script.sh

# dentro de .config/autostart coloque

    [Desktop Entry]
    Name=MyScript
    GenericName=A descriptive name
    Comment=Some description about your script
    Exec=/path/to/my/script.sh
    Terminal=false
    Type=Application
    X-GNOME-Autostart-enabled=true


    [Desktop Entry]
    Name=Conky
    GenericName=background monitor
    Comment=Keep a background eye on your system
    Exec=conky &
    Terminal=false
    Type=Application
    Icon=conky
    Categories=System;
    StartupNotify=false
    Name[en_US]=conky
    X-GNOME-Autostart-Delay=80

ou rode o comando (Alt+F2) dialog run:

    gnome-session-properties

### Set wallpaper mode
+ https://bbs.archlinux.org/viewtopic.php?id=152571
Possible values are "none", "wallpaper", "centered", "scaled", "stretched", "zoom", "spanned".

    gsettings set org.gnome.desktop.background picture-options 'zoom'

### Show current wallpaper path

    gsettings get org.gnome.desktop.background picture-uri

    Script to change wallpaper automatically
    https://github.com/mattwilmott/Gnome3-Auto-Wallpaper-Changer

    Using notify send system:
    notify-send -i "terminal" "current-background" "$(gsettings get org.gnome.desktop.background picture-uri)"

Using notify-send to warn the user when a job is finished

    notify-send "Task Completed"

### Screenshot directory

    gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/img/Screenshots"

### setting nautilus auto mount

    gsettings set org.gnome.desktop.media-handling automount true

### fixing audacious open folders error

I don't know how it happened but
when, eg, I plug in a USB drive or try to open a folder in a firefox
extension (or other programs that want to open a folder...), it always
wants to open with Audacious which is obnoxious.  Browsing through in
Nautilus works fine and normal, but I want to know if I can find out how
to get rid of the association with Audacious.

    I've tried deleting ~/.config and ~/.local to no help...

    Create the file

    ~/.local/share/applications/mimeapps.list

    and fill it with

    [Default Applications]
    inode/directory=nautilus.desktop;

### setting gnome screenshot dir

  gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/pictures/"

### setando o muse para ser destacado com o ctrl ou não

  gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer false

### habilitando o click to tap no mouse

gsettings set org.gnome.settings-daemon.peripherals.touchpad tap-to-click true

gsettings set org.gnome.desktop.peripherals-touchpad disable-while-typing true


gconftool-2 --toggle /desktop/gnome/peripherals/touchpad/touchpad-enabled

habilitar a rolagem pela borda to touchpad

    gsettings set org.gnome.desktop.peripherals.touchpad scroll-method "edge-scrolling"

### accessing ssh throug nautilus

    sftp://user@address/folder/

### Alterando o tempo de gravação no gnome shell

    fonte:
http://www.talesam.org/blog/dica-ampliando-o-tempo-de-gravacao-do-desktop-no-gnome-shell/

    gsettings set org.gnome.settings-daemon.plugins.media-keys
max-screencast-length 1800

### Extensão que permite gravar com audio
+ https://extensions.gnome.org/extension/690/easyscreencast/

### Extensão pra liberar espaço na tela
+ https://extensions.gnome.org/extension/723/pixel-saver/

### Extensão que reproduz sons como chuva, água etc
+ https://extensions.gnome.org/extension/1224/focusli/

mprove focus and increase your productive by listening to different sounds

### Extension to set blur effect
+ https://github.com/yozoon/gnome-shell-extension-blyr

    git clone git@github.com:yozoon/gnome-shell-extension-blyr.git
    cd gnome-shell-extension-blyr/
    cp -r blyr@yozoon.dev.gmail.com ~/.local/share/gnome-shell/extensions

### Media Player indicator extension
+ https://extensions.gnome.org/extension/55/media-player-indicator/

This extension is ideal to combine with Anoise program
+ http://anoise.tuxfamily.org/

### how install gnome shell in any distro with jhbuild
http://worldofgnome.org/how-to-easily-install-the-very-latest-gnome-in-any-distro-with-jhbuild/

### performance tweaks  * https://wiki.archlinux.org/index.php/Sysctl *
http://penguininside.blogspot.com.br/2009/08/top-10-gnome-performance-tweaks.html
https://alexcabal.com/disabling-gnomes-recently-used-file-list-the-better-way/


-------------------------------
 disable most recent files view --> recently-used-xbel
-------------------------------

Put the following in ~/.config/gtk-3.0/settings.ini (create the file if
it doesn’t exist):

        [Settings]
        gtk-recent-files-max-age=0
        gtk-recent-files-limit=0

    Then, remove the file holding recently-used data:

        rm ~/.local/share/recently-used.xbel

Disabling tracer system

    tracker-control

### other stuff

Put this in your /etc/environment

    BROWSER=/usr/bin/firefox
    CLUTTER_PAINT=disable-clipped-redraws:disable-culling
    export CLUTTER_VBLANK=none

Network performance

https://raw.githubusercontent.com/voyeg3r/dotfiles/master/bin/sysctrl.conf

If you had customized /etc/sysctl.conf, you need to rename it as
/etc/sysctl.d/99-sysctl.conf. If you had e.g. /etc/sysctl.d/foo, you
need to rename is to /etc/sysctl.d/foo.conf


### solving the problem of hidden files by default

 * source: http://ubuntuforums.org/archive/index.php/t-2133298.html

	open terminal and type:
	dconf-editor
	Enter and then:
	org->gtk->settings->file-chooser
	uncheck show-hidden

	Have a nice day!

### how make a screencast on gnome-shell

  Ctrl+Shift+Alt+r

# to reset default value to video record resource
gsettings reset org.gnome.shell.recorder pipeline

### text expander for linux

https://bbs.archlinux.org/viewtopic.php?id=71938
https://github.com/Dieterbe/snip/
https://github.com/Dieterbe/snip/tree/master

# best addons to gnome-shell
+ https://linuxious.com/2016/01/10/my-recommended-gnome-extensions/

### Dinamic Panel Transparency addon
+ https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/

### gmail notifications extension
+ https://extensions.gnome.org/extension/1230/gmail-message-tray/

### Replacement of Alt-Tab, iterates through windows in a cover-flow manner.
+ https://extensions.gnome.org/extension/97/coverflow-alt-tab/

### Extensão para trocar papel de parede automaticamente
+ https://extensions.gnome.org/extension/543/backslide/

### Readme sobre a extensão acima
+ https://bitbucket.org/LukasKnuth/backslide

### Set your gravatar icon
+ https://extensions.gnome.org/extension/1015/gravatar/

### Extensão para rolar workspaces automaticamente (scroll)
+ https://extensions.gnome.org/extension/701/top-panel-workspace-scroll/

### Extensão para adicionar transparência a barra do topo
+ https://extensions.gnome.org/extension/857/transparent-top-bar/
+ https://extensions.gnome.org/extension/885/dynamic-top-bar/

### Extensão que adiciona um menu tipo windows 10
+ https://extensions.gnome.org/extension/1228/arc-menu/

### Extensão para mostrar um tooltip sobre a aplicação
+ https://extensions.gnome.org/extension/1071/applications-overview-tooltip/

### como instalar o gnome-shell no ubuntu 11.04

    sudo add-apt-repository ppa:gnome3-team/gnome3
    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get install gnome-shell

### Como abrir o menu Ativities?

  Basta pressionar a tecla windows

### best gnome shell addons
https://extensions.gnome.org/extension/549/web-search-dialog/
https://extensions.gnome.org/extension/277/impatience/


