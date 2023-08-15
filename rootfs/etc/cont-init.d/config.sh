#!/usr/bin/with-contenv bash
# ==============================================================================
# Generate Silicon Labs Multiprotocol configurations
# ==============================================================================
source /etc/bashlog/log.sh;

if [[ -z "${DEVICE}" ]]; then
    log 'error' "No serial port device set!"
    exit 1
fi

if [ $NETWORK_DEVICES -eq 1 ]; then
    export DEVICE="/tmp/ttyCPC"
fi

if [[ -z "${BAUDRATE}" ]]; then
    log 'error' "No serial port baudrate set!"
    exit 1
fi

if [[ -z "${FLOW_CONTROL}" ]]; then
    export FLOW_CONTROL="false"
fi

if  [[ -z "${CPCD_TRACE}" ]]; then
    export CPCD_TRACE="false"
fi

log 'info' "\n######### ENV ######"
env

log 'info' "Generating cpcd configuration."
sed -i 's@{{ .device }}@'"$DEVICE"'@' /usr/local/share/cpcd.conf
sed -i 's@{{ .baudrate }}@'"$BAUDRATE"'@' /usr/local/share/cpcd.conf
sed -i 's@{{ .cpcd_trace }}@'"$CPCD_TRACE"'@' /usr/local/share/cpcd.conf
sed -i 's@{{ .flow_control }}@'"$FLOW_CONTROL"'@' /usr/local/share/cpcd.conf
sed -i 's@binding_key_file@'"#binding_key_file"'@' /usr/local/share/cpcd.conf
cp /usr/local/share/cpcd.conf /usr/local/etc/cpcd.conf
