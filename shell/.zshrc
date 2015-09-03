# include ruby gems if available
hash ruby 2>/dev/null && export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# include zsh-syntax-highlighting from arch repos
SYNTAX="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [[ -e "$SYNTAX" ]]; then source "$SYNTAX"; fi;

# load specialised configs
for env in ~/.config/zshrc.d/*; do source $env; done;
