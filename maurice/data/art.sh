#!/bin/sh
# data/art.sh <artUrl>
url="$1"
case "$url" in
  file://*) img="${url#file://}" ;;
  http*)    img="/tmp/mpris-art-$(printf %s "$url" | md5sum | cut -c1-12)"
            [ -f "$img" ] || curl -sfL "$url" -o "$img" || exit 1 ;;
  *)        exit 0 ;;
esac
matugen image "$img" --source-color-index 1
