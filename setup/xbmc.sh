#!/bin/bash

# Setup intel driver, xbmc and dependencies
pacman -S --noconfirm xf86-video-intel libva-intel-driver
pacman -S --noconfirm xbmc shairport libplist lirc

# Setup autostart
aura -A --noconfirm xbmc-standalone-service
touch /etc/X11/Xwrapper.config
echo "allowed_users = anybody" >> /etc/X11/Xwrapper.config
echo "needs_root_rights = yes" >> /etc/X11/Xwrapper.config

# Fix weathered colors
pacman -S --noconfirm xorg-xrandr
touch /etc/X11/xinit/xinitrc.d/10-fix-colors
chmod +x /etc/X11/xinit/xinitrc.d/10-fix-colors
echo "xrandr --output HDMI1 --set \"Broadcast RGB\" \"Full\"" >> /etc/X11/xinit/xinitrc.d/10-fix-colors
echo "xrandr --output HDMI2 --set \"Broadcast RGB\" \"Full\"" >> /etc/X11/xinit/xinitrc.d/10-fix-colors
echo "xrandr --output HDMI3 --set \"Broadcast RGB\" \"Full\"" >> /etc/X11/xinit/xinitrc.d/10-fix-colors