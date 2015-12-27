if [[ ! -o login ]]; then
	# If we are not a login shell, quote calvin and hobbes
	shtore get quotes/calvin | quoty
elif [[ -z $DISPLAY && ! $XDG_VTNR -eq 1 ]]; then
	# If we are a login shell and do not run have a display AND are not on tty1 quote Firefly
	shtore get quotes/firefly | quoty
fi
