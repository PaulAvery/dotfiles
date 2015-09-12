# Export all files which changed since a specific git commit to a target directory
git-export() {
	git diff -z --name-only --diff-filter=AMT $1 HEAD | xargs -0 -I_ rsync -aR _ $2
	git diff --stat --diff-filter=AMT $1 HEAD
}
