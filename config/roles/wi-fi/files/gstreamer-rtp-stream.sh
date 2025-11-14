#!/usr/bin/env bash

gst-launch-1.0 -vvv \
    udpsrc port=5004 \
    caps="application/x-rtp, media=audio, encoding-name=OPUS, payload=96" \
    ! udpsink host=224.1.1.1 port=5005 auto-multicast=true sync=false
