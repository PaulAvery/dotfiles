function xkcd
	set Headers (curl -D - c.xkcd.com/random/comic -o /dev/null -s)
	set Id (echo $Headers | grep -oP 'Location: https{0,1}:\/\/xkcd\.com\/\K[0-9]+(?=\/)')
	set Json (curl -s https://xkcd.com/$Id/info.0.json)

	set Image (echo $Json | sx -jx x.img)
	set Title (echo $Json | sx -jx x.safe_title)

	echo -ne "\033]0;xkcd [$Title]\007"
	seurat -i -w (tput cols) (curl -s $Image | psub) | less -~
end
