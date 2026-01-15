#!/usr/bin/env bash
set -euo pipefail

function usage() {
    echo "Usage: $0 {mic|more|less}"
    echo "	more	Decrease the brightness."
    echo "	less  	Increase the brightness."
    exit 1
}

[[ $# -ne 1 ]] && usage

case $1 in
    less) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    more) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
    mute) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    *) usage ;;
esac

CURRENT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
MESSAGE="Changing volume ($CURRENT%)"
if [ -f /tmp/noisenotifid ]; then
    notify-send -r $(cat /tmp/noisenotifid) -h int:value:$CURRENT "$MESSAGE"
else
    notify-send -p -h int:value:$CURRENT "$MESSAGE" > /tmp/noisenotifid
fi
