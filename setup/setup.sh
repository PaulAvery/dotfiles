#!/bin/bash

# Install dev-dependencies
sudo pacman -S --needed --noconfirm base-devel

# Install aura
./aura.sh

# Install and configure zsh
./zsh.sh

# Install node
./node.sh

# Copy dotfiles
ln -s $(pwd)/../{.wpmanager,.Xresources,.zpreztorc} ~
ln -s $(pwd)../{bar,herbstluftwm,user-dirs.dirs} ~/.config

# Install bar script dependencies
cd ~/.config/bar && npm install

# Install wallpaper manager
sudo npm install -g wpmanager
