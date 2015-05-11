if [[ ! -o login ]]; then
	quoty
elif [[ -z $DISPLAY && ! $XDG_VTNR -eq 1 ]]; then
	quoty
fi
