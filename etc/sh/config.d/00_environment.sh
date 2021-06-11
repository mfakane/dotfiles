# Load vars from environment.d when not loaded (for non-systemd systems)
if [ -z "$IS_XDG_CONF_LOADED" ] && [ -d "$HOME/.local/etc/environment.d" ]; then
	for conf in "$HOME/.local/etc/environment.d/"*.conf; do
		if [ -r "$conf" ]; then
			eval "$(sed -r 's/^(.+=)/export \1/g' "$conf")"
		fi
	done
	unset conf
fi
