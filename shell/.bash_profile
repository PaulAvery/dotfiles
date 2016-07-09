# Use bash by default and defer to fish if we are a login shell
if [ ! -z "$PS1" ]; then
	export SHELL=fish
	exec fish -l
fi
