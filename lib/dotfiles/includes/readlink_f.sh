readlink_f() {
	local target=$1
	local cwd=$(pwd -P)

	cd "$(dirname "$target")"
	target="$(pwd -P)/$(basename "$target")"

	while [ -L "$target" ]; do
		target="$(readlink "$target")"
		cd "$(dirname "$target")"
		target="$(pwd -P)/$(basename "$target")"
	done

	echo "$target"
	cd "$cwd"
}
