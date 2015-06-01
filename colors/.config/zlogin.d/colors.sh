# Load colors and export them as environment variables
TEMPLATE="{{#.}}export COLOR{{@key}}=#{{hex.[0]}}{{hex.[1]}}{{hex.[2]}}
{{/.}}"

$(tstore template "color-themes/$(tstore template color-themes.selected {{.}})" "$TEMPLATE")
