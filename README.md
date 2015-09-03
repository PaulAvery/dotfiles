# My Dotfiles
This repository contains my personal dotfiles, as well as wallpapers.

![Screenshot](scrot.png)

## Configs
All configs are to be used with the `stow` utility. Just apply as needed. I use the default grml-zsh-config, which is the reason for hardly any zsh modding in this repository.

## Dependencies
### Applications
* [lighthouse](https://github.com/emgram769/lighthouse): Application Launcher
* [bar](https://github.com/LemonBoy/bar): The top bar
* [node/npm](https://nodejs.org/): JS runtime. Needed for some utilities
* [urxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode): The terminal emulator
* [zsh](https://wiki.archlinux.org/index.php/Zsh): The shell
* [herbstluftwm](https://wiki.archlinux.org/index.php/Herbstluftwm): The window manager
* [compton](https://github.com/chjj/compton): An optional compositor
* [scrot](https://www.archlinux.org/packages/community/i686/scrot/): Take Screenshots
* [imagemagick](https://www.archlinux.org/packages/extra/i686/imagemagick/): Used to make screenshots pretty

### npm-snippets
Some snippets may be linked into your `~/bin/` folder. Make them available to your system by calling `npm link` inside each snippets directory.

### NPM Modules
Some npm modules need to be globally installed. Namely

* [tstore](https://www.npmjs.com/package/tstore): cross-application JSON configs (e.g. colors)
* [wpmanager](https://www.npmjs.com/package/wpmanager): Management of wallpapers
* [quoty](https://www.npmjs.com/package/quoty): Quotes upon opening a terminal

## gnupg
My gpg config is part of a setup where the entire gnupg folder is located on a thumbdrive and mounted to `/media/gpg`.
Therefore on each start of zsh, it checks if the folder exists and if it does, it starts gnupg. Also uses a gnupg authentication key as the ssh private key. Still a work in progress.
