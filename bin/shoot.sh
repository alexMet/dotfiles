#!/usr/bin/env bash
set -euo pipefail

function usage() {
    echo "Usage: $0 {full|pick|rec}"
    echo "	full	Capture the whole screen to clipboard."
    echo "	pick	Capture a selection of the screen to clipboard."
    echo "	rec		Start fullscreen recoding or end already started."
    echo "	save	Capture and save screenshot."
    exit 1
}

[[ $# -ne 1 ]] && usage

OUTDIR="$HOME/Shots"
[ ! -d $OUTDIR ] && mkdir -p $OUTDIR

case $1 in
    rec)
        if [ -f /tmp/recpid ]; then
            kill -15 $(cat /tmp/recpid) && rm -f /tmp/recpid
            notify-send -r $(cat /tmp/recnotifid) -u low "Recording ended!"
        else
            FILE=$OUTDIR/video_$(date +%F_%T).mp4
            ffmpeg -nostats -loglevel 0 -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -c:v libx264 -preset ultrafast -c:a aac $FILE &
            echo $! > /tmp/recpid
            notify-send -p -u critical "Recording..." > /tmp/recnotifid
        fi
        ;;
    pick)
        sleep 0.2; scrot --silent --select --line mode=edge - | xclip -selection clipboard -target image/png
        notify-send -u low "Captured selection and saved to clipboard."
        ;;
    full)
        scrot --silent - | xclip -selection clipboard -target image/png
        notify-send -u low "Captured fullscreen and saved to clipboard."
        ;;
    save)
        FILE=$OUTDIR/image_$(date +%F_%T).png
        sleep 0.2; scrot --silent --select --line mode=edge $FILE
        notify-send -u low "Captured selection and saved to $OUTDIR"
        ;;
    *)
        echo "Bad argument!"
        usage
        ;;
esac
