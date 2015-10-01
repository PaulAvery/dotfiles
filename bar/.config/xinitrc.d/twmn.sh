CONF=$HOME/.config/twmn/
cp $CONF/twmn.conf $CONF/twmn.tmp.conf

echo 'background_color=#'$(tstore get colors.background | sx -jx "x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('')") >>  $CONF/twmn.tmp.conf
echo 'foreground_color=#'$(tstore get colors.foreground | sx -jx "x.map(function(c) { return ('0' + c.toString(16)).substr(-2); }).join('')") >>  $CONF/twmn.tmp.conf

twmnd twmn.tmp &
