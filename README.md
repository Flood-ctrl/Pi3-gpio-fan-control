# Raspberry Pi 3 GPIO fan control

Pi3 fan control via gpio by systemd unit

Enable fan if temperature equal to `temp_max` var (60 by default) and disable if temperature equal to `temp_min` var (42 by deafault)
GPIO pin - `14`

```sh
    cp fan-control.sh /usr/local/bin/fan-control.sh
    cp gpio-fan-control.service /etc/systemd/system/gpio-fan-control.service
    systemctl start gpio-fan-control.service && systemctl enable gpio-fan-control.service
```