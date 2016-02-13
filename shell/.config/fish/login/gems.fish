# Include ruby gems if available
if command -s ruby > /dev/null
	set -x PATH (ruby -e 'print Gem.user_dir')/bin $PATH
end
