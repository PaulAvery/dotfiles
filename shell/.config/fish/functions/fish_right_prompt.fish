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
	prompt_pwd
	git_status
end
