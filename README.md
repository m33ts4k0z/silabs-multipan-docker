# Silabs multiprotocol for HA docker installtion

Basically changed s6-overlay scripts and delete bashio.

Modify the .env to change configuration (ports, enable/disable options).

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
