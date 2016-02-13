# Start X on login if we are on tty1
if test -z $DISPLAY; and test $XDG_VTNR = 1
	exec startx -- -keeptty
end
