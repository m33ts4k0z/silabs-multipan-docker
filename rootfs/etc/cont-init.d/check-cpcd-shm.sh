#!/usr/bin/with-contenv bash
# ==============================================================================
# Check that no other CPC instance is running on this system
# ==============================================================================
source /etc/bashlog/log.sh;

if test -d /dev/shm/cpcd; then
    log 'info' "Another CPC daemon running!"
    exit 1
fi
