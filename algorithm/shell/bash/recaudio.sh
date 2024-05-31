#!/usr/bin/env bash
# Created: qui 07 dez 2017 09:24:38 -03
# Last Change: 2017 dez 07 09:47
# Recording audio from mic and speakers from commandline
# https://ask.fedoraproject.org/en/question/65662/

# gravar som

ffmpeg -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -c:a libmp3lame ${1}.mkv
