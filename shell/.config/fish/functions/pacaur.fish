# Get proper autocomplete for pacaur
function --wraps "pacman" pacaur
	command pacaur $argv
end
