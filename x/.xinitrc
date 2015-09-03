# let others define xinitrc entries
for env in ~/.config/xinitrc.d/*; do source $env; done;

# and if available, load a window manager
if [[ -e ~/.config/wm.sh ]]; then source ~/.config/wm.sh; fi;
