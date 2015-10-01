timeout=5

function notify-start() {
	last_command=$1
	last_command_name=${1[(wr)^(*=*|sudo|ssh|-*)]}
	last_command_start=$(date "+%s")
}

function notify-end() {
	if [ ! -z "$last_command" ]; then
		now=$(date "+%s")
		((diff = $now - $last_command_start))

		if (( $diff > $timeout )); then
			notify-send $last_command
		fi

		unset last_command last_command_name last_command_start
	fi
}

add-zsh-hook preexec notify-start
add-zsh-hook precmd notify-end
