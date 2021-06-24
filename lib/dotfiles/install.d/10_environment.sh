# Temporary apply pam_environment as shell variables

pam_environment_file="$INCLUDES/../pam_environment"

[ -r "$pam_environment_file" ] || die $E_INTERNAL "Cannot read $pam_environment_file"
eval "$(sed 's/[[:space:]]*DEFAULT=/=/g' "$pam_environment_file" | grep -vE '^#|^HOME|^$')"

unset pam_environment_file

if [ -z "${IS_XDG_CONF_LOADED:=}" ]; then
	xdg_conf_file="$XDG_CONFIG_HOME/environment.d/xdg.conf"

	[ -r "$xdg_conf_file" ] || die $E_INTERNAL "Cannot read $xdg_conf_file"
	. $xdg_conf_file

	unset xdg_conf_file
fi

[ -n "$XDG_CONFIG_HOME" ] || die $E_INTERNAL "XDG_CONFIG_HOME is not set"
[ -n "$XDG_CACHE_HOME" ] || die $E_INTERNAL "XDG_CACHE_HOME is not set"
[ -n "$XDG_DATA_HOME" ] || die $E_INTERNAL "XDG_DATA_HOME is not set"
[ -n "$XDG_BIN_HOME" ] || die $E_INTERNAL "XDG_BIN_HOME is not set"
[ -n "$XDG_LIB_HOME" ] || die $E_INTERNAL "XDG_LIB_HOME is not set"
[ -n "$XDG_STATE_HOME" ] || die $E_INTERNAL "XDG_STATE_HOME is not set"
[ -n "$XDG_LOG_HOME" ] || die $E_INTERNAL "XDG_LOG_HOME is not set"
