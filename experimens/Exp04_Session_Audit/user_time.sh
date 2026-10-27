#!/usr/bin/env bash
# Shows login timestamps when available. `who` output usually does not include
# a full year/time-zone, so this script reports the session row and current epoch.
set -u
echo "Current Unix Epoch seconds:"
date +%s
echo
echo "Current login sessions (from who):"
who
echo
echo "Note: exact login-duration calculation requires a reliable login timestamp."
echo "On Linux, use: last -F \"$USER\" | head"
