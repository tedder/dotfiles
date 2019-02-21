mosquitto_sub -h 192.168.0.23 -P $mqtt_password \
 -u octo -v -t '#' \
 -T 'octoprint/e10/temperature/#' -T 'octoprint/e10/event/CaptureDone' -T 'octoprint/e10/event/CaptureStart' \
 -T 'octoprint/prusamk3/temperature/#' -T 'octoprint/prusamk3/event/CaptureDone' -T 'octoprint/prusamk3/event/CaptureStart' -T 'octoprint/prusamk3/event/ZChange' \
 -T 'octoprint/mpdelta/temperature/#' -T 'octoprint/mpdelta/event/CaptureDone' -T 'octoprint/mpdelta/event/CaptureStart' -T 'octoprint/mpdelta/event/ZChange'
