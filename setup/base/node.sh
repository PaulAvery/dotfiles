#!/bin/bash

# Create build directory and download aura
mkdir ~/build
cd ~/build
git clone https://github.com/tj/n

# Build n
cd n
make
make install

# Install node stable and dev versions
n 0.10
n 0.11

# Cleanup
cd ~
rm -rf ~/build