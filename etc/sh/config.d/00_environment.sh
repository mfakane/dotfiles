# Load vars from environment.d when not loaded (for non-systemd systems)
if [ -z "$IS_XDG_CONF_LOADED" ] && [ -d "$XDG_CONFIG_HOME/environment.d" ]; then
	for conf in "$XDG_CONFIG_HOME/environment.d/"*.conf; do
		if [ -r "$conf" ]; then
			eval "$(sed -r 's/^(.+=)/export \1/g' "$conf")"
		fi
	done
	unset conf
fi
