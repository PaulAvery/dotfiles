#!/usr/bin/fish

# Merge .Xresources
xrdb -merge ~/.Xresources

# Load files defined by others
for file in ~/.config/xinitrc.d/*
	source $file
end

for file in ~/.config/Xresources.d/*
	xrdb -merge $file;
end

# And if available, load a window manager
if test -e ~/.config/wm
	exec ~/.config/wm
end
