export GPG_TTY="$(tty)"

alias gpgm='sudo mount /dev/disk/by-partuuid/32a93336-f729-4ccd-8ecf-1c86515bcbd4 ~/gpg > /dev/null 2> /dev/null && pgrep gpg-agent > /dev/null && gpg-agent --daemon > /dev/null 2> /dev/null || true'
alias gpgu='sudo umount ~/gpg'
