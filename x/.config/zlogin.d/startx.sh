# Start X on login if we are on tty1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
