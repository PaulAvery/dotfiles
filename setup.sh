#!/bin/zsh

# Install zsh-prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Copy dotfiles
ln -s .wpmanager .prcolors .Xresources .zpreztorc ~
ln -s bar herbstluftwm user-dirs.dirs ~/.config

# Install bar script dependencies
cd ~/.config/bar
npm install bar-provider node-battery dateformat

# Install dependencies
sudo pacman -S --needed --noconfirm base-devel wget
sudo mkdir /build

# Create build directory and download aura
cd /build
sudo wget https://aur.archlinux.org/packages/au/aura-bin/aura-bin.tar.gz

# Build aura bin
sudo tar -xvf aura-bin.tar.gz
cd aura-bin
makepkg --noconfirm -s -c
sudo pacman -U --noconfirm *.pkg.tar.xz

# Reinstall aura via itself
sudo aura -A --noconfirm aura-bin

# Cleanup
cd ~
sudo rm -rf /build
