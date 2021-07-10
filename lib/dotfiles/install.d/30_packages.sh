packages=""

type bat > /dev/null 2>&1 || packages="bat $packages"
type exa > /dev/null 2>&1 || packages="exa $packages"

if [ -n "$packages" ]; then
	if type pacman > /dev/null 2>&1; then
		# Arch Linux
		echo "Installing packages"
		echo "> sudo pacman -Sy --noconfirm $packages"
		sudo pacman -Sy --noconfirm $packages
	elif type apt-get > /dev/null 2>&1; then
		# Debian
		echo "Installing packages"
		echo "> sudo apt-get install -y $packages"
		sudo apt-get install -y $packages
	elif type brew > /dev/null 2>&1; then
		# Homebrew
		echo "Installing packages"
		echo "> brew install $packages"
		brew install $packages
	fi
fi
