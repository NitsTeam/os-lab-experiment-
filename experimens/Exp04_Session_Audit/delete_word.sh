#!/usr/bin/env bash
set -eu
if [[ $# -lt 2 ]]; then
  echo "Usage: $0 WORD FILE [FILE ...]"
  exit 1
fi
word=$1
shift
for file in "$@"; do
  if [[ ! -f "$file" ]]; then
    echo "Skipping missing file: $file" >&2
    continue
  fi
  cp -p -- "$file" "$file.bak"
  # Literal string deletion (not a regular expression); escape sed special chars.
  escaped=$(printf '%s' "$word" | sed 's/[][\\/.*^$]/\\&/g')
  sed -i "s/${escaped}//g" "$file"
  echo "Removed '$word' from $file (backup: $file.bak)"
done
