# Based on the work from [@nervousapps](https://github.com/nervousapps/haDOCKERaddons/tree/master/silabs-multiprotocol/dockerCustom)

# Silabs multiprotocol for HA docker installation

This container is a dockerized version of the [Silicon Labs multiprotocol addon for HAOS](https://skyconnect.home-assistant.io/procedures/enable-multiprotocol/).

Basically changed s6-overlay scripts and delete bashio.

Modify the .env to change configuration (ports, enable/disable options).

# Setup

If you use portainer, you can deploy a stack directly from the repo. The firmware is included and will be automatically flashed to your SkyConnect stick if you don’t change anything. Nothing else needs to be done or moved.

You might need to change the architecture of the pulled image in the compose file so it matches your system. 

This is for Raspberry Pi 4 using 64 bit Raspbian as host.

To use this with Zigbee2MQTT, start the container and then in the configuration.yaml file of Zigbee2MQTT use this port configuration:
```
serial:
  port: tcp://host_ip:20108
  adapter: ezsp
```
Restart Zigbee2MQTT. 
It might take a couple of tries for Zigbee2MQTT to connect the first time but it will work without issues afterwards.

## Update

To update firmware change the name in .env file an set AUTOFLASH_FIRMWARE to 1.
Be carefull of firmware baudrate (set at 460800 by default in rootfs/etc/s6-overlay/scripts/universal-silabs-flasher-up).

## TIPS

- When restarting container with a new image, all configuration will be lost.
In order to make a new thread network, PUT OFF ALL THREAD GEAR, form the network throught the GUI.

## Pre-requirements
- docker installed
- docker-compose installed

## Build 
```
docker-compose build --no-cache
```

## Deploy
```
docker-compose up -d
```

## Uninstall
```
docker-compose down
```
