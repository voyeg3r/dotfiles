#!/usr/bin/env python
#
# A nifty GUI controlling the window controls position
#
# Depends on python-gconf (started from a python-gconf example)
#
# @version 0.1
# @author alex(at)eftimie(dot)ro
#

import gtk
import gconf

def callback(button, client):
    global left, right, key, entry
    if left.get_active():
        s = "maximize,minimize,close:"
    elif right.get_active():
        s = ":maximize,minimize,close"
    else:
        s = entry.get_text()
    client.set_string (key, s)
    entry.set_text(s)

# Gconf stuff
client = gconf.client_get_default ()
key = "/apps/metacity/general/button_layout"

# Gtk window
window = gtk.Window()
window.set_title("Settings")
left = gtk.RadioButton(group=None, label='Left')
right = gtk.RadioButton(left, 'Right')
custom = gtk.RadioButton(left, 'Custom')
entry = gtk.Entry()
box = gtk.VBox(False, 0)
box.add(gtk.Label("Choose window controls position: "))
box.add(left)
box.add(right)
# Custom
box2 = gtk.HBox(False, 0)
box2.add(custom)
#box2.add(entry)
box.add(box2)
box.add(entry)
apply_button = gtk.Button('Apply')
done = gtk.Button('Done')
box3 = gtk.HBox(False, 0)
box3.add(apply_button)
box3.add(done)
box.add(box3)
custom.set_active(True)
window.add (box)
window.show_all ()

# Widget events
window.connect('delete_event', gtk.main_quit)
done.connect('clicked', gtk.main_quit)
left.connect ('toggled', callback, client)
right.connect ('toggled', callback, client)
custom.connect ('toggled', callback, client)
apply_button.connect('clicked', callback, client)

# If key isn't writable, then set insensitive
left.set_sensitive (client.key_is_writable (key))
right.set_sensitive (client.key_is_writable (key))

# Get current settings
entry.set_text(client.get_string(key))

gtk.main ()

