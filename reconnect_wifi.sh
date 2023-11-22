#!/bin/bash

#Please add your wifi network name here:
wifi_network="YOUR WIFI NETWORK NAME COMES HERE"

while true; do
    # Check if the WiFi is connected
    if ! networksetup -getairportnetwork en0 | grep -q "Current Wi-Fi Network: $wifi_network"; then
        # If not connected, attempt to reconnect
        echo "WiFi not connected. Reconnecting..."
        networksetup -setairportpower en0 off
        networksetup -setairportpower en0 on
        sleep 5 
        networksetup -setairportnetwork en0 "$wifi_network"
        echo "Reconnection attempt complete."
    else
        echo "WiFi is already connected to $wifi_network."
    fi

    # Sleep for a while before checking again
    sleep 10
done
