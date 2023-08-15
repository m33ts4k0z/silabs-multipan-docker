#!/usr/bin/with-contenv bash
# ==============================================================================
# Disable OTBR if not enabled
# ==============================================================================
source /etc/bashlog/log.sh;

if [ $OTBR_ENABLE -eq 0 ]; then
    rm /etc/s6-overlay/s6-rc.d/user/contents.d/otbr-agent
    rm /etc/s6-overlay/s6-rc.d/user/contents.d/otbr-web
    log 'info' "The otbr-agent is disabled."
else
    log 'info' "Web UI and REST API port are exposed, starting otbr-web."
fi
