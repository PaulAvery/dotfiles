#!/bin/bash

# Warn the user
echo "This script expects your system to be mounted to /mnt!"
echo "It also expects your EFI system partition to be /mnt/boot!"
read -p "Is this alright? (y/n)" continue
echo
case $continue in
	y|Y ) ;;
	* ) exit 1;;
esac

# Erase all existing files
rm -rf /mnt/* || true
rm -rf /mnt/boot/* || true

# Install the base system
pacstrap /mnt base

# Generate fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

# Copy scripts to new system
mkdir /mnt/root/setup
cp ./* -r /mnt/root/setup

# Run commands inside new system
arch-chroot /mnt /root/setup/chroot.sh