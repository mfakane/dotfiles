if ! type starship &> /dev/null; then
	sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir $XDG_BIN_HOME --yes
fi
