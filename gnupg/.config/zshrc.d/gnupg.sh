export GPG_TTY="$(tty)"

pgrep "gpg-agent" > /dev/null
if [[ -a $GNUPGHOME/gpg.conf && $? -ne 0 ]]; then
	echo "Starting gpg-agent"
	gpg-agent --daemon > /dev/null 2> /dev/null || true
fi
