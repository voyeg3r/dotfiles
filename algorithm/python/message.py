#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
#        File:  <+Filename Here+>
#      Author:  Sergio Araujo
#     Purpose:  <+this script aims...+>
# Last Change:  sex 11 mai 2018 08:02:22 -03
#     Created:  sex 11 mai 2018 08:02:22 -03
#       email:  <voyeg3r ✉ gmail.com>
#      Github:  https://github.com/voyeg3r
#     twitter:  @voyeg3r

import os, random
import time
import subprocess
import gi
gi.require_version('Notify', '0.7')
from gi.repository import Notify

# player
# def play_mp3(path):
#     subprocess.Popen(['mpg123', '-q', path]).wait()

# choosing the song
# https://stackoverflow.com/a/41911914/2571881
n = 0
random.seed()
for root, dirs, files in os.walk('/home/sergio/music/mpb'):
    for name in files:
        n+=1
        if random.uniform(0,n) < 1: rfile=os.path.join(root, name)

file = rfile

# getting the hour
hora=time.strftime("%H:%M")
message= hora + " Para por alguns instantes!"

Notify.init('Show message')
Stop=Notify.Notification.new("Show message", message,
                                       "dialog-information")

Stop.show()

# play_mp3(file)
subprocess.Popen(['mpg123', '-q', file]).wait()

time.sleep(10)

Stop.close()
Notify.uninit()

