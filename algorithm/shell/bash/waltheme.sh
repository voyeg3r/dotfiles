#!/bin/bash
# Last Change: May 15 2022 10:47

/home/sergio/.local/bin/wal -qi "$(ls -1A ~/img/backgrounds/* | shuf -n 1)"
