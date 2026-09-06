#!/usr/bin/env bash
set -euo pipefail

# Fuzzy find processes and kill them
pids=$(ps -ef | fzf -m | awk '{print $2}')

if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9
fi
