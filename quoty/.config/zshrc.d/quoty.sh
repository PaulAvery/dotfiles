if [[ ! -o login ]]; then
	tstore get quotes/calvin | quoty
elif [[ -z $DISPLAY && ! $XDG_VTNR -eq 1 ]]; then
	tstore get quotes/firefly | quoty
fi
