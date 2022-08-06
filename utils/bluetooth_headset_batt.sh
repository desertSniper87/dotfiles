#!/usr/bin/env bash

read -p 'Device mac: ' MAC
M=${MAC//:/_}
dbus-send --print-reply=literal --system --dest=org.bluez \
    /org/bluez/hci0/dev_$M org.freedesktop.DBus.Properties.Get \
    string:"org.bluez.Battery1" string:"Percentage" 
    #variant byte 94
