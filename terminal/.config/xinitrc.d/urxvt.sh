# Set palette
shtore get colors.palette | sx -jxl "'URxvt*color' + x.id + ': rgb:' + x.rgb.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge

# Set other colors
shtore get colors.background | sx -jx "'URxvt*background: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
shtore get colors.foreground | sx -jx "'URxvt*foreground: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
shtore get colors.cursor | sx -jx "'URxvt*cursorColor: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
shtore get colors.bold | sx -jx "'URxvt*colorBD: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge

# Set font
FONT=$(shtore get font.mono.family | sx -jx x)
FONTSIZE=$(shtore get font.mono.size)
FONTWEIGHT=$(shtore get font.mono.weight)

echo "URxvt*font: xft:$FONT:size=$FONTSIZE:weight=$FONTWEIGHT:hinting=true:antialias=true" | xrdb -merge
