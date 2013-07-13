#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Qua 17/Mar/2010 hs 14:40
# Last Change: 2012 Out 07 08:49:01
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: gravar stream de audio
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
""" Record a few seconds of audio and save to a WAVE file. """
import pyaudio
import wave
import sys

chunk = 1024
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 44100
RECORD_SECONDS = 5
WAVE_OUTPUT_FILENAME = "output.wav"

p = pyaudio.PyAudio()

stream = p.open(format = FORMAT,
                channels = CHANNELS,
                rate = RATE,
                input = True,
                frames_per_buffer = chunk)

print "* recording"
all = []
for i in range(0, RATE / chunk * RECORD_SECONDS):
    data = stream.read(chunk)
    all.append(data)
print "* done recording"

stream.close()
p.terminate()

# write data to WAVE file
data = ''.join(all)
wf = wave.open(WAVE_OUTPUT_FILENAME, 'wb')
wf.setnchannels(CHANNELS)
wf.setsampwidth(p.get_sample_size(FORMAT))
wf.setframerate(RATE)
wf.writeframes(data)
wf.close()
