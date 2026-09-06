#!/usr/bin/env bash
set -euo pipefail

# List available packages, with info shown in a preview window, and install selected ones
packages=$(pacman -Slq | fzf --multi --preview 'pacman -Si {1}')

if [[ -n "$packages" ]]; then
    while IFS= read -r package; do
        sudo pacman -S "$package"
        if [[ $? -eq 0 ]]; then
            description=$(pacman -Si "$package" | grep Description | cut -d ':' -f 2)
            echo "$package --$description" >> "$MY_PACKAGES"
        fi
    done <<< "$packages"
fi

sort -u -o "$MY_PACKAGES" "$MY_PACKAGES"
