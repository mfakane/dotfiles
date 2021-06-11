#!/bin/sh

trap 'echo "Fatal error: $0:$LINENO stopped" >&2; exit 1' ERR INT
set -eu
BASEDIR=$(cd $(dirname $0); pwd)
BASENAME=$(basename $0)
INCLUDES="$BASEDIR/lib/dotfiles/includes"

. "$INCLUDES/die.sh"

DOTDIR=$BASEDIR
cd $DOTDIR

for script in "$DOTDIR/lib/dotfiles/install.d/"*.sh; do
	. "$script"
done
