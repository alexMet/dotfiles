#!/usr/bin/env bash
set -euo pipefail

# List available packages, with info shown in a preview window
pacman -Qq | fzf --multi --preview 'pacman -Qi {1}'
