#!/bin/bash

# Setup intel driver, xbmc and dependencies
pacman -S --noconfirm xf86-video-intel libva-intel-driver
pacman -S --noconfirm xbmc shairport libplist lirc udisks unrar

# Setup autostart
aura -A --noconfirm xbmc-standalone-service
systemctl enable xbmc

touch /etc/X11/Xwrapper.config
echo "allowed_users = anybody" >> /etc/X11/Xwrapper.config
echo "needs_root_rights = yes" >> /etc/X11/Xwrapper.config

# Fix weathered colors (Still need to add /home/xbmc/.xinitrc to your /usr/bin/xbmc-standalone2 script by hand)
pacman -S --noconfirm xorg-xrandr
mkdir /home/xbmc
touch /home/xbmc/.xinitrc
chmod +x /home/xbmc/.xinitrc
echo "#!/bin/bash" >> /home/xbmc/.xinitrc
echo "xrandr --output HDMI1 --set \"Broadcast RGB\" \"Full\"" >> /home/xbmc/.xinitrc
echo "xrandr --output HDMI2 --set \"Broadcast RGB\" \"Full\"" >> /home/xbmc/.xinitrc
echo "xrandr --output HDMI3 --set \"Broadcast RGB\" \"Full\"" >> /home/xbmc/.xinitrc