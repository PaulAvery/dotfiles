# include ruby gems if available
hash ruby 2>/dev/null && export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
