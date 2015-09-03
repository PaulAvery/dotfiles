# Merge .Xresources
xrdb -merge .Xresources

# Set urxvt colors
TEMPLATE="{{#.}}URxvt*color{{@key}}: #{{hex.[0]}}{{hex.[1]}}{{hex.[2]}}
{{/.}}"

tstore template "color-themes/$(tstore template color-themes.selected {{.}})" "$TEMPLATE" | xrdb -merge
