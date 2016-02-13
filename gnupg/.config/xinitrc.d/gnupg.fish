gpg-agent --daemon

if test $status = 0
	set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
end
