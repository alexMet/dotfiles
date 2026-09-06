#!/usr/bin/env bash
set -euo pipefail

function usage() {
    echo "Usage: $0 {mute|more|less}"
    echo "	mute  	Mute the volume."
    echo "	more	Increase the volume."
    echo "	less  	Decrease the volume."
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
FILE=/tmp/noisenotifid
if [ -f $FILE ]; then
    notify-send -r $(cat $FILE) -h int:value:$CURRENT "$MESSAGE"
else
    notify-send -p -h int:value:$CURRENT "$MESSAGE" > $FILE
fi
