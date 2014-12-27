#!/bin/bash

# Enter directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

# Install stuff
pacman -S --noconfirm base-devel git

# Install aura
./aura.sh

# Install and configure zsh
./zsh.sh

# Install node
./node.sh

# Install docker and docker-services
aura -S --noconfirm docker
npm install -g docker-services

# Install utils and Enable ssh
pacman -S --noconfirm htop openssh
systemctl enable sshd.service