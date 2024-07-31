#!/usr/bin/env bash

# --- The thing died while updating
# --- boot from a USB device to arch
lsblk -k
cryptsetup luksOpen /dev/nvme0n1p2 secure
mount /dev/vg0/root/ /mnt
mount /dev/nvme0n1p1
arch-root /mnt

# --- Try to fix the mess
pacman -Syu
# - if linux is fucked up then
rm /var/lib/pacman/db.lock
rm -r /var/lib/pacman/local/linux-x.x.x/
ls -la /var/cache/pacman/pkg/linux...
pacman -U --dbonly /var/cache/pacman/pkg/linux...
pacman -Syu
pacman -S linux

# --- Fix broken packages
while IFS=: read -r package _; do
    echo "Processing package: $package"; 
    pacman -S --dbonly $package;
    pacman -S $package;
done <<< $(pacman -Qkk 2>/dev/null | grep 'no mtree')
pacman -Syu

# --- Finish and clean up
umount /mnt/boot
umount /mnt
cryptsetup luksClose secure
# - if device is busy
vgscan
vgchange -a n vg0
reboot
