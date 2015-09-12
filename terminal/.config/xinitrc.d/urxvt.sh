# Set palette
tstore get colors.palette | sx -jxl "'URxvt*color' + x.id + ': rgb:' + x.rgb.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge

# Set other colors
tstore get colors.background | sx -jx "'URxvt*background: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
tstore get colors.foreground | sx -jx "'URxvt*foreground: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
tstore get colors.cursor | sx -jx "'URxvt*cursorColor: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
tstore get colors.bold | sx -jx "'URxvt*colorBD: rgb:' + x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('/')" | xrdb -merge
