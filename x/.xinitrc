# Merge .Xresources
xrdb -merge ~/.Xresources

# Load files defined by others
for env in ~/.config/xinitrc.d/*; do source $env; done;
for res in ~/.config/Xresources.d/*; do xrdb -merge $res; done;

# And if available, load a window manager
if [[ -e ~/.config/wm ]]; then exec ~/.config/wm; fi;
