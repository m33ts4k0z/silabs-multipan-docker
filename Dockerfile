FROM homeassistant/aarch64-addon-silabs-multiprotocol:2.3.1

RUN rm -rf /etc/s6-overlay/s6-rc.d/banner && \
    rm -rf /etc/s6-overlay/scripts/banner.sh && \
    rm -rf /etc/s6-overlay/s6-rc.d/universal-silabs-flasher/dependencies.d && \
    rm -rf /etc/s6-overlay/s6-rc.d/otbr-agent-rest-discovery && \
    rm -rf /etc/s6-overlay/scripts/otbr-agent-rest-discovery.sh && \
    rm -rf /etc/s6-overlay/s6-rc.d/user/contents.d/otbr-agent-rest-discovery && \
    rm -rf /etc/s6-overlay/s6-rc.d/cpcd-config && \
    rm -rf /etc/s6-overlay/s6-rc.d/cpcd/dependencies.d && \
    rm -rf /usr/bin/bashio && \
    rm -rf *.gbl && \
    rm -rf firmware && \
    rm -rf /home/firmware && \
    rm -rf /root/*.gbl

COPY rootfs /

# use s6-overlay as init system
WORKDIR /
ENTRYPOINT ["/init"]