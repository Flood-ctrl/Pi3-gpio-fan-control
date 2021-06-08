#!/usr/bin/env bash

echo "14" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio14/direction

temp_max="60"
temp_min="42"

while true; do
    current_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    current_temp_dec="${current_temp%???}"
    if [[ "$current_temp_dec" -gt "$temp_max" ]]; then
        echo "1" > /sys/class/gpio/gpio14/value
    elif [[ "$current_temp_dec" -lt "$temp_min" ]]; then
        echo "0" > /sys/class/gpio/gpio14/value
    fi;
    sleep 10
done;