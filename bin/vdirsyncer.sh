#!/usr/bin/env sh

set -e

/usr/bin/vdirsyncer sync
/usr/bin/vdirsyncer metasync
khal
