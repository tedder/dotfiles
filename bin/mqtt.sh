#mosquitto_sub -h 192.168.0.23 -P $mqtt_password \
mosquitto_sub -h mqtt.home.tedder.me -P $mqtt_password \
 -u octo -v \
 -T 'octoprint/#' \
 -T 'rack/#' \
 -T 'iot/sonoff/#' \
 -T 'logging/#' \
 -t '#'
 #-T 'tedderdebug'
 #-T 'octoprint/+/temperature/tool0' \
 #-T 'octoprint/+/temperature/bed' \
 #-t 'octoprint/adaprusa/#'
 #-T 'octoprint/+/progress/printing' \
 #-T 'octoprint/+/temperature/tool0' \
 #-T 'octoprint/+/temperature/bed' \
 #-T 'octoprint/mpdelta/temperature/#' -T 'octoprint/mpdelta/event/CaptureDone' -T 'octoprint/mpdelta/event/CaptureStart' -T 'octoprint/mpdelta/event/ZChange' \
 #-T 'iot/bloomsky/#' \
 #-T 'iot/esp32-sensor-ae3038a4/#' \
 #-T 'iot/esp32-sensor-411d/#' \
 #-T 'iot/sonoff/pdu/#'
 #-T 'octoprint/#' \
 #-T 'octoprint/prusamk3/temperature/#' -T 'octoprint/prusamk3/event/CaptureDone' -T 'octoprint/prusamk3/event/CaptureStart' -T 'octoprint/prusamk3/event/ZChange' \
 #-T 'iot/#'
 #-T 'minio/#' \
 #-t 'motion/event/end/#' \
