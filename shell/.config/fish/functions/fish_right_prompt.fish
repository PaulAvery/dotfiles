function short_dir
	set CURRENT (pwd)

	if test (string sub -l (string length $HOME) $CURRENT) = $HOME
		set CURRENT ~(string sub -s (expr 1 + (string length $HOME)) $CURRENT)
	end

	set PARTS (string split / $CURRENT)

	set SHORT ''

	if test (count $PARTS) -gt 1
		for PART in $PARTS[1..-2]
			set SHORT $SHORT(string sub -l 1 $PART)/
		end
	end

	set SHORT $SHORT$PARTS[-1]

	echo $SHORT
end

function git_status
	if git rev-parse --is-inside-work-tree > /dev/null ^ /dev/null
		set GITSTATUS (git status -b --porcelain --untracked-files)

		if git symbolic-ref --short HEAD > /dev/null ^ /dev/null
			set LABEL (git symbolic-ref --short HEAD)
		else
			set LABEL (git rev-parse --short HEAD)
		end

		echo ' '

		if echo $GITSTATUS\n | grep '^##.*\[ahead .*\]' > /dev/null ^ /dev/null
			set_color green
		end

		if echo $GITSTATUS\n | grep '^  M' > /dev/null ^ /dev/null
			set_color red
		end

		if echo $GITSTATUS\n | grep "^ ??" > /dev/null ^ /dev/null
			echo +
		end

		echo $LABEL

		set_color normal
	end
end

function fish_right_prompt
	short_dir
	git_status
end
