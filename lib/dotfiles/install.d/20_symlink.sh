# Install compatibility symlinks to the home dir

. "$INCLUDES/readlink_f.sh"

link_with_backup() {
	target=$1
	linkname=$2

	cd "$(dirname "$linkname")"

	if [ "$(readlink_f $target)" = "$(readlink_f $linkname)" ]; then
		return
	fi

	if [ -L "$linkname" ]; then
		rm "$linkname"
	elif [ -e "$linkname" ]; then
		echo "$linkname is not a symlink, will be moved to $linkname.backup."
		mv "$linkname" "$linkname.backup"
	fi

	echo "Linking $linkname -> $target"
	ln -s $target $linkname
}

# Write in relative path here because busybox ln doesn't support -r option

if type bash > /dev/null 2>&1; then
	link_with_backup ".local/etc/bash/bash_profile" ~/.bash_profile
	link_with_backup ".local/etc/bash/bashrc" ~/.bashrc
fi

if type zsh > /dev/null 2>&1; then
	link_with_backup ".local/etc/zsh/.zshenv" ~/.zshenv
fi

# Don't create on qnap
case "$(uname -r)" in (*-qnap);; (*)
	link_with_backup ".local/lib/dotfiles/pam_environment" ~/.pam_environment
esac
