function fish_greeting
	if status --is-interactive
		if status --is-login
			if test -z "$DISPLAY"; and not test "$XDG_VTNR" = 1
				# If we are a login shell and do not have a display AND are not on tty1 quote Firefly
				shtore get quotes/firefly | quoty
			end
		end
	end
end
