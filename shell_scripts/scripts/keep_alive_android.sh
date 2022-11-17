#!/usr/bin/env bash

while true; do
    adb shell input tap 500 500
    echo Tap on $(date "+%H:%M:%S")
    sleep 10
done
