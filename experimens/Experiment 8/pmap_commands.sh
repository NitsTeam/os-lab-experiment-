#!/bin/bash
# Run this script from the Experiment-8 directory.
set -e

gcc ../Experiment-7/cpu_bound.c -o cpu_bound
gcc ../Experiment-7/io_bound.c -o io_bound

./cpu_bound &
CPU_PID=$!
./io_bound &
IO_PID=$!

echo "CPU-bound PID: $CPU_PID"
echo "I/O-bound PID: $IO_PID"
echo
echo "--- CPU-bound process memory map ---"
pmap -x "$CPU_PID"
echo
echo "--- I/O-bound process memory map ---"
pmap -x "$IO_PID"
echo
echo "--- Detailed CPU-bound mappings ---"
cat "/proc/$CPU_PID/maps"
echo
echo "--- Detailed I/O-bound mappings ---"
cat "/proc/$IO_PID/maps"

echo
echo "Both processes are being monitored. Press q to exit top."
top -p "$CPU_PID,$IO_PID"
wait "$CPU_PID"
wait "$IO_PID"
