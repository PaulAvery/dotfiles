if status --is-login
	for file in ~/.config/fish/login/*
		source $file
	end
end

if status --is-interactive
	for file in ~/.config/fish/initialize/*
		source $file
	end
end

if status --is-login; and test -z "$DISPLAY"; and test "$XDG_VTNR" = 1
	exec startx
end

