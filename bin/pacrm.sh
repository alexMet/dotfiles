#!/usr/bin/env bash
set -euo pipefail

# List all your installed packages, and then remove selected packages
packages=$(pacman -Qq | fzf --multi --preview 'pacman -Qi {1}')

if [[ -n "$packages" ]]; then
    while IFS= read -r package; do
        sudo pacman -Rns "$package"
        if [[ $? -eq 0 ]]; then
            sed -i "/$package --/d" "$MY_PACKAGES"
        fi
    done <<< "$packages"
fi
