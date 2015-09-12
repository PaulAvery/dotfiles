export PATH=~/bin:"$PATH"

# Load configs from shared folder
for env in ~/.config/zlogin.d/*; do source $env; done;
