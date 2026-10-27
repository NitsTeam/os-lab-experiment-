#!/usr/bin/env bash
set -eu
if [[ $# -ne 3 ]]; then
  echo "Usage: $0 FILE START_LINE END_LINE"
  exit 1
fi
file=$1
start=$2
end=$3
if [[ ! -f "$file" ]]; then
  echo "Error: file not found: $file" >&2
  exit 1
fi
if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ ]] || (( start < 1 || end < start )); then
  echo "Error: START_LINE and END_LINE must be positive integers, with END_LINE >= START_LINE" >&2
  exit 1
fi
sed -n "${start},${end}p" "$file"
