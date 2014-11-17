#!/bin/bash

# Create build directory and download aura
mkdir ~/build
cd ~/build
git clone https://github.com/tj/n

# Build n
cd n
make
sudo make install

# Install node stable and dev versions
sudo n 0.10
sudo n 0.11

# Cleanup
cd ~
rm -rf ~/build
