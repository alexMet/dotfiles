#!/usr/bin/env bash
set -euo pipefail

function usage() {
    echo "Usage: $0 {more|less}"
    echo "	more	Decrease the brightness."
    echo "	less  	Increase the brightness."
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
if [ -f /tmp/lumosnotifid ]; then
    notify-send -r $(cat /tmp/lumosnotifid) -h int:value:$CURRENT "$MESSAGE"
else
    notify-send -p -h int:value:$CURRENT "$MESSAGE" > /tmp/lumosnotifid
fi
