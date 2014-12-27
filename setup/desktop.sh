# Copy dotfiles
ln -s $(pwd)/../{.wpmanager,.Xresources} ~
ln -s $(pwd)../{bar,herbstluftwm,user-dirs.dirs} ~/.config

# Install bar script dependencies
cd ~/.config/bar && npm install

# Install wallpaper manager
sudo npm install -g wpmanager