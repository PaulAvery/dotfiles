# Produces a least of explicitly installed packages which are found neiter in base nor base-devel
function pkglist
	comm -23 (pacman -Qetq | sort | psub) (pacman -Qgq base base-devel | sort | psub)
end
