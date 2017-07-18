# dicas do gnome

```
Criado: Qua 30/Mar/2011 hs 15:28
Last Change: ter 10 jan 2017 13:30:46 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
```

### Autostart applications

    vim ~/.config/autostart/program.desktop

    [Desktop Entry]
    Type=Application
    Name=<Name of application as displayed>
    Exec=<command to execute>
    Icon=<full path to icon>
    Comment=<optinal comments>
    X-GNOME-Autostart-enabled=true
    X-GNOME-Autostart-Delay=60

### Tema elementary Dark

	http://aaron-a-arts.deviantart.com/art/elementary-Dark-Gtk-190822873

### restaurar os paineis do gnome

``` sh
gconftool --recursive-unset /apps/panel
rm -rf ~/.gconf/apps/panel
pkill gnome-panel
```

