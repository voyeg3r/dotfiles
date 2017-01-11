# dicas do gnome

```
Criado: Qua 30/Mar/2011 hs 15:28
Last Change: ter 10 jan 2017 13:30:46 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
```

### Tema elementary Dark

	http://aaron-a-arts.deviantart.com/art/elementary-Dark-Gtk-190822873

### restaurar os paineis do gnome

	gconftool --recursive-unset /apps/panel
	rm -rf ~/.gconf/apps/panel
	pkill gnome-panel

