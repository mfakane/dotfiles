packages=""

type bat &> /dev/null || packages="bat $packages"
type exa &> /dev/null || packages="exa $packages"

if [ -n "$packages" ]; then
	if type pacman &> /dev/null; then
		# Arch Linux
		echo "Installing packages"
		echo "> sudo pacman -Sy --noconfirm $packages"
		sudo pacman -Sy --noconfirm $packages
	elif type apt-get &> /dev/null; then
		# Debian
		echo "Installing packages"
		echo "> sudo apt-get install -y $packages"
		sudo apt-get install -y $packages
	elif type brew &> /dev/null; then
		# Homebrew
		echo "Installing packages"
		echo "> brew install $packages"
		brew install $packages
	fi
fi
