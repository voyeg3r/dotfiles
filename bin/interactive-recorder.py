#!/usr/bin/env python

import pyaudio
import wave
import sys

def record(output_filename):
    chunk = 1024
    FORMAT = pyaudio.paInt16
    CHANNELS = 2
    RATE = 44100
    RECORD_SECONDS = 8

    if sys.platform == 'darwin':
        CHANNELS = 1

    p = pyaudio.PyAudio()

    stream = p.open(format = FORMAT,
                    channels = CHANNELS,
                    rate = RATE,
                    input = True,
                    frames_per_buffer = chunk)

    print "* recording"
    all = []
    try:
        for i in range(0, RATE / chunk * RECORD_SECONDS):
            data = stream.read(chunk)
            all.append(data)
    except KeyboardInterrupt:
        pass
    finally:
        print "* done recording"
        stream.stop_stream()
        stream.close()
        p.terminate()

        # write data to WAVE file
        data = ''.join(all)
        wf = wave.open(output_filename, 'wb')
        wf.setnchannels(CHANNELS)
        wf.setsampwidth(p.get_sample_size(FORMAT))
        wf.setframerate(RATE)
        wf.writeframes(data)
        wf.close()


def playback(output_filename):
    chunk = 1024

    PyAudio = pyaudio.PyAudio

    wf = wave.open(output_filename, 'rb')

    p = PyAudio()

    # open stream
    stream = p.open(format =
                    p.get_format_from_width(wf.getsampwidth()),
                    channels = wf.getnchannels(),
                    rate = wf.getframerate(),
                    output = True)

    # read data
    data = wf.readframes(chunk)

    # play stream
    while data != '':
        stream.write(data)
        data = wf.readframes(chunk)

    stream.stop_stream()
    stream.close()
    p.terminate()

if __name__ == "__main__":
    username = raw_input("Please enter your name.\n")
    raw_input("""I'll now record you saying your name.
Hit enter when you are ready to begin,
and then wait for the \"recording\" prompt to start.
Use control-C to stop recording.
Max recording time is 8 seconds.\n""")
    record(username + ".wav")
    print "Thanks! Here's your file played back."
    playback(username + ".wav")

