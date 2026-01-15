#!/usr/bin/env bash
set -euo pipefail

update_if_needed () {
    cd $1

    # Check if the local branch is behind the remote
    git fetch origin master
    behind=$(git rev-list --count HEAD..origin/master)

    if [ $behind -gt 0 ]; then
        echo "==> Updates found: $behind commits behind."
        git pull origin master
        makepkg -sirc
        rm *.zip *.zst*
    else
        echo "==> Already up to date."
    fi
}

# NOTE: https://wiki.archlinux.org/title/Reflector
echo "==> Updating mirrorlist..."
sudo reflector --country Greece,France,Germany --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
echo "==> Updating system packages..."
sudo pacman -Syu

# Update packages from the AUR and build them from source
# I hope I won't need to add more here...
pushd .
echo "==> Updating Mullvad VPN..."
update_if_needed ~/Documents/mullvad-vpn-bin/
echo "==> Updating Mullvad browser..."
update_if_needed ~/Documents/mullvad-browser-bin/
echo "==> Updating Brave browser..."
update_if_needed ~/Documents/brave-bin//
echo "==> Updating openvpn3..."
update_if_needed ~/Documents/openvpn3/
popd

# NOTE: https://wiki.archlinux.org/title/Pacman/Pacnew_and_Pacsave
# Check the diff manually and merge the changes with the old config
# diff /etc/pacman.conf /etc/pacman.conf.pacnew
echo "==> Checking for new config files..."
sudo find /etc -name '*.pacnew' -o -name '*.pacsave'
