#!/bin/sh

set -euo pipefail

OUTDIR="$HOME/Screenshots"
mkdir -p "$OUTDIR"

scrot "$OUTDIR"/%Y-%m-%d-%H%M.png --silent --select --line mode=edge
