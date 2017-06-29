#!/bin/bash
# https://cubethethird.wordpress.com/2015/07/26/real-time-background-noise-cancellation-of-microphone-input-on-linux/


# By utilizing SoX audio software, the microphone input is redirected through it,
# and output into a loopback device, which can be chosen in PulseAudio’s volume
# mixer application. I have composed a bash script to essentially automate the
# process. Before using this, SoX must be installed, and the alsa loopback device
# must be loaded into the kernel:

# sudo apt-get install sox

# sudo modprobe snd_aloop

###

# This script first tests to make sure the loopback devices are loaded, then
# records a 5 second noise sample. The sample is then played back to the user. If
# there should be a problem with it, such as a non-background sound leaked into
# it, it can be re-recorded. Once done, the input and output devices are
# determined, and an audio stream is directed from PulseAudio into SoX, then back
# into Pulse through the loopback device. From PulseAudio Volume Control, the
# input of recording devices can be changed to Loopback Analog Stereo Monitor,
# where the filtered audio stream is being directed.

time=5
workDir='/tmp'
record()
{
    echo "Recording background noise. Keep quiet for $time seconds."
    sleep 3
    arecord -f cd noise.wav &
    PID=$!
    sleep $time
    kill $PID
    aplay noise.wav
}

#get pulse audio devices
devices=`pactl list | grep -E -A2 '(Source|Sink) #' | grep 'Name: ' | grep -v monitor | cut -d" " -f2`
if [ `echo "$devices" | grep -c aloop` -lt 1 ]; then
    echo "No loopback device created. Run 'sudo modprobe snd_aloop' first."
    exit
fi

cd $workDir

#record noise sample
record
while true; do
    read -p "Do you wish to re-record the noise sample?" yn
    case $yn in
        [Yy]* ) record;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#create noise profile
sox noise.wav -n noiseprof noise.prof

input=`echo "$devices" | grep input.*pci`
output=`echo "$devices" | grep output.*aloop`

echo "Sending output to loopback device. Change recording port to &lt;Loopback Analog Stereo Monitor&gt; in PulseAudio to apply. Ctrl+C to terminate."

#filter audio from $input to $output
pacat -r -d $input --latency=1msec | sox -b 16 -e signed -c 2 -r 44100 -t raw - -b 16 -e signed -c 2 -r 44100 -t raw - noisered noise.prof 0.2 | pacat -p -d $output --latency=1msec


