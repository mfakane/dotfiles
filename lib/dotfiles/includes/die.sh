set -eu

E_SUCCESS=0
E_INTERNAL=1
E_USER=2

die()
{
	retval=$(($1 + 0)); shift
	
	case $retval in
		$E_USER) prefix="Error: " ;;
		$E_INTERNAL) prefix="Internal error: ";;
		*) prefix="Unknown error: " ;;
	esac

	echo $prefix $@ >&2
	exit $retval
}
