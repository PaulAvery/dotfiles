#!/bin/bash

# Create build directory and download aura
mkdir ~/build
cd ~/build
curl https://aur.archlinux.org/packages/au/aura-bin/aura-bin.tar.gz -o aura-bin.tar.gz

# Build aura bin
tar -xvf aura-bin.tar.gz
cd aura-bin
makepkg --noconfirm --asroot -s -c
pacman -U --noconfirm *.pkg.tar.xz

# Reinstall aura via itself
aura -A --noconfirm aura-bin

# Cleanup
cd ~
rm -rf ~/build