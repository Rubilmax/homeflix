#!/bin/bash

session_count=$(curl -sS http://localhost:32400/status/sessions?X-Plex-Token= | grep -oP '(?<=<MediaContainer size=")[0-9]+' | head -1)

if [ "$session_count" -eq 0 ]; then
    shutdown -h now
fi