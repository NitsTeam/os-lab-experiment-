#!/usr/bin/env bash
set -eu
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 FILE [FILE ...]"
  exit 1
fi

for old in "$@"; do
  if [[ ! -e "$old" ]]; then
    echo "Skipping missing path: $old"
    continue
  fi
  dir=$(dirname -- "$old")
  name=$(basename -- "$old")
  upper=$(printf '%s' "$name" | tr '[:lower:]' '[:upper:]')
  new="$dir/$upper"
  if [[ "$old" == "$new" ]]; then
    echo "Already uppercase: $old"
  elif [[ -e "$new" ]]; then
    echo "Skipping: destination already exists: $new"
  else
    mv -v -- "$old" "$new"
  fi
done
