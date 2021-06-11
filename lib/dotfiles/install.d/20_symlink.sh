# Install compatibility symlinks to the home dir

link_with_backup() {
	target=$1
	linkname=$2

	if [ "$(readlink -f $target)" = "$(readlink -f $linkname)" ]; then
		return
	fi

	if [ -L "$linkname" ]; then
		rm "$linkname"
	elif [ -e "$linkname" ]; then
		echo "$linkname is not a symlink, will be moved to $linkname.backup."
		mv "$linkname" "$linkname.backup"
	fi

	echo "Linking $linkname -> $target"
	ln -sr $target $linkname
}

link_with_backup $XDG_LIB_HOME/dotfiles/pam_environment ~/.pam_environment
link_with_backup $XDG_CONFIG_HOME/bash/bash_profile ~/.bash_profile
link_with_backup $XDG_CONFIG_HOME/bash/bashrc ~/.bashrc
