#!/bin/bash

# Install zsh and set as default
pacman --noconfirm -S zsh grml-zsh-config zsh-syntax-highlighting

chsh -s $(which zsh) $USER