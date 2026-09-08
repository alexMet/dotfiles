#!/usr/bin/env bash
set -euo pipefail

# List all your installed packages, and then remove selected packages
packages=$(pacman -Qq | fzf --multi --preview 'pacman -Qi {1}')
mapfile -t selected < <(pacman -Qq | fzf --multi --preview 'pacman -Qi {1}')

for package in "${selected[@]}"; do
    sudo pacman -Rns "$package"
    if [[ $? -eq 0 ]]; then
        sed -i "/$package --/d" "$MY_PACKAGES"
    fi
done
