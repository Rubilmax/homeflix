#!/bin/bash

session_count=$(curl -sS http://localhost:32400/status/sessions?X-Plex-Token=QvwMxy54ssaod7zSNya6 | grep -oP '(?<=<MediaContainer size=")[0-9]+' | head -1)

if [ "$session_count" -eq 0 ]; then
    if [ ! -e "/run/systemd/shutdown/scheduled" ]; then
        shutdown -P +300
    fi
else
    shutdown -c
fi
