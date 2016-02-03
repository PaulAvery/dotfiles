function fish_prompt
	set STATUS $status
	set GREEN (set_color green)
	set RED (set_color red)
	set RESET (set_color normal)

	if test $STATUS = 0
		set ERROR $GREEN
	else
		set ERROR $RED
	end

	echo "❯❯$GREEN❯$ERROR❯$RESET "
end
