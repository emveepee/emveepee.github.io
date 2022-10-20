echo 0 > /sys/class/leds/sys_led/brightness
if [ -z "$(fw_printenv -n mac)" ]; then
 my_mac="$(fw_printenv -n ethaddr)"
 if [ ! -z "$my_mac" ]; then
    fw_setenv cmdline_keys 'setenv region_code US; setenv bootargs ${bootargs} mac='$my_mac''
    fw_setenv mac $my_mac
    ip link set eth0 down
    ip link set dev eth0 address $my_mac
    ip link set eth0 up
 fi
fi
