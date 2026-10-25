#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

src=maurice
dest="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell"
state="${XDG_STATE_HOME:-$HOME/.local/state}/maurice"
mkdir -p "$state"

tree_hash() {   # one hash for a whole folder: file names and contents
  (cd "$1" && find . -type f ! -name '.qmlls.ini' -print0 | sort -z \
     | xargs -0 -r sha256sum | sha256sum | cut -d' ' -f1)
}

if [ -e "$dest" ] || [ -L "$dest" ]; then
  if [ -f "$state/installed.hash" ] && [ "$(tree_hash "$dest")" = "$(cat "$state/installed.hash")" ]; then
    echo "Existing install is untouched; replacing it."
    rm -rf "$dest"
  else
    backup="$dest.bak-$(date +%Y%m%d-%H%M%S)"
    mv "$dest" "$backup"
    echo "Backed up existing config to $backup"
  fi
fi

mkdir -p "$dest"
cp -r "./" "$dest"/ #"$src"/. "$dest"/
tree_hash "$dest" > "$state/installed.hash"
echo "Installed. Start it with: qs"
