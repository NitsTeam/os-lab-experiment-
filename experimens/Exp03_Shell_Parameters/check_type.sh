#!/usr/bin/env bash
set -u
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 PATH [PATH ...]"
  exit 1
fi

for path in "$@"; do
  if [[ -f "$path" ]]; then
    echo "FILE: $path"
    wc -c < "$path" | awk '{print "Size: " $1 " bytes"}'
  elif [[ -d "$path" ]]; then
    echo "DIRECTORY: $path"
    ls -lah -- "$path"
  else
    echo "NOT FOUND or unsupported file type: $path"
  fi
done
