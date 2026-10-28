#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

osu=false
src=maurice
dest=("${XDG_CONFIG_HOME:-$HOME/.config}"/{quickshell,hypr,kitty,nvim})
share="${XDG_DATA_HOME:-$HOME/.local/share}/osu.AppImage"
state="${XDG_STATE_HOME:-$HOME/.local/state}/maurice"
mkdir -p "$state"

tree_hash() { # one hash for a whole folder: file names and contents
	(cd "$1" && find . -type f ! -name '.qmlls.ini' -print0 | sort -z |
		xargs -0 -r sha256sum | sha256sum | cut -d' ' -f1)
}

if [ -e "$dest" ] || [ -L "$dest" ]; then
	if [ -f "$state/installed.hash" ] && [ "$(tree_hash "$dest")" = "$(cat "$state/installed.hash")" ]; then
		echo "no changes to update!"
		rm -rf "$dest"
	else
		backup="$dest.bak-$(date +%Y%m%d-%H%M%S)"
		mv "$dest" "$backup"
		echo "DELETING EVERYTHING!!!!!! (╯°Д°)╯ ┻━┻ (jk), made a backup! $backup"
	fi
fi

mkdir -p "$dest"
cp -r "./" "$dest"/ #"$src"/. "$dest"/
tree_hash "$dest" >"$state/installed.hash"
echo "install success! run with qs and be sure to auto execute qs with hyprland!"

if $osu; then
	echo "downloading osu.AppImage"
	curl -fL https://github.com/ppy/osu/releases/download/2026.1013.0-tachyon/osu.AppImage -o $share
	echo "done, enjoy!"
fi
