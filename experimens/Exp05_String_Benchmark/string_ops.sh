#!/usr/bin/env bash
set -eu
str=${1:-"Hello World"}
start=${2:-6}
length=${3:-5}
echo "String: $str"
echo "Length: ${#str}"
echo "Substring: ${str:start:length}"
