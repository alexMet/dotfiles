#!/usr/bin/env bash
set -euo pipefail

function usage() {
    echo "Usage: $0 {more|less}"
    echo "	more	Increase the brightness."
    echo "	less  	Decrease the brightness."
    exit 1
}

[[ $# -ne 1 ]] && usage

case $1 in
    less) brightnessctl --quiet set 5%- ;;
    more) brightnessctl --quiet set +5% ;;
    *) usage ;;
esac

CURRENT=$((($(brightnessctl get) * 100 / $(brightnessctl max) * 100) / 100))
MESSAGE="Changing brightness ($CURRENT%)"
FILE=/tmp/lumosnotifid
if [ -f $FILE ]; then
    notify-send -r $(cat $FILE) -h int:value:$CURRENT "$MESSAGE"
else
    notify-send -p -h int:value:$CURRENT "$MESSAGE" > $FILE
fi
