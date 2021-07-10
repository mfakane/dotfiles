if ! type starship > /dev/null 2>&1; then
	sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir $XDG_BIN_HOME --yes
fi
