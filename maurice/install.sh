#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

osu=false
src=maurice
config=("${XDG_CONFIG_HOME:-$HOME/.config}"/{quickshell,hypr,kitty,nvim})
share="${XDG_DATA_HOME:-$HOME/.local/share}/"
state="${XDG_STATE_HOME:-$HOME/.local/state}/maurice"
osu="$share/osu.AppImage"
#mkdir -p "$state"
#mkdir -p "$share"

install(){
	local origin="$1" to="$2"
	local hash="$state/$(basename "$to").hash"

	if [-e "$to"] || [ -L "$to" ]; then
		if [ -f "$hash" ] && [ "$(tree_hash "$to")" = "$(cat "$hash")"]; then
			echo "replacing untouched install $to"
			rm -rf "$to"
		else
			mv "$to" "$to.bak-$(date +%Y%m%d-%H%M%S)"
			echo "DELETED EVERYTHING!!! jk, made a backup of existing dirs!"
		fi
	fi
	mkdir -p "$to"
	cp -r "$from"/. "$to"/
	tree_hash "$to" > "$hash"
}

install quickshell "$config/quickshell"
install kitty "$config/kitty"
install hypr "$config/hypr"
install nvim "$config/nvim"

if $osu; then
	echo "downloading osu.AppImage"
	curl -fL https://github.com/ppy/osu/releases/download/2026.1013.0-tachyon/osu.AppImage -o $osu
	chmod +x $osu
	echo "done, enjoy!"
fi
