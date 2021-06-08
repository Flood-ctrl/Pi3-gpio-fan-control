#!/usr/bin/env bash

gpio_pin="14"
temp_max="60"
temp_min="42"

echo $gpio_pin > /sys/class/gpio/export                   # Create a GPIO file access
echo "out" > /sys/class/gpio/gpio${gpio_pin}/direction    # Configure the Pin Direction (In/Out)

while true; do
    current_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    current_temp_dec="${current_temp%???}"
    if [[ "$current_temp_dec" -gt "$temp_max" ]]; then
        echo "1" > /sys/class/gpio/gpio${gpio_pin}/value
    elif [[ "$current_temp_dec" -lt "$temp_min" ]]; then
        echo "0" > /sys/class/gpio/gpio${gpio_pin}/value
    fi;
    sleep 10
done;