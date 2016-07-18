#!/bin/bash

echo "Cleaning up GPS Daemon..."
killall gpsd
sleep 2
echo "Starting iPhone GPS daemon...."
echo "Enter GPS Daemon Server:"
read gpsip
echo "Enter GPS Daemon port:"
read gpsport
sleep 2
gpsd -N -n -D5 tcp://$gpsip:$gpsport