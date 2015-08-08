source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

for env in ~/.config/zshrc.d/*; do source $env; done;
