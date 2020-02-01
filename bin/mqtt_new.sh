mosquitto_sub -h mqtt.home.tedder.me -P $mqtt_password \
 -u octo -v \
 -t "iot/emon/#"
 #-t 'iot/esp8266-sensor-2f5114/#'
# -T "iot/ups/#" \
# -T "logging/#" \
# -T "iot/bloomsky/#" \
# -T "iot/sonoff/#" \
# -T "octoprint/+/event/#" \
# -T "octoprint/+/temperature/#" \
# -T "iot/emon/#" \
# -T "rack/#"

# -t 'motion/#'
 #-T "octoprint/#" \
 #-t '$SYS/#' \
