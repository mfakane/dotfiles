packages=""

type bat &> /dev/null || packages="$packages bat"
type exa &> /dev/null || packages="$packages exa"

if [ -n "$packages" ]; then
	if type pacman &> /dev/null; then
		# Arch Linux
		sudo pacman -Sy --noconfirm $packages
	elif type apt &> /dev/null; then
		# Debian
		sudo apt install -y $packages
	elif type brew &> /dev/null; then
		# Homebrew
		sudo brew install $packages
	fi
fi
