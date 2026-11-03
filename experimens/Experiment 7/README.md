# Practical: CPU-Bound vs I/O-Bound C Programs Using top

## Aim
To write and run a CPU-bound C program and an I/O-bound C program, and compare their CPU usage and process behaviour using the `top` command.

## Source files
- `cpu_bound.c`
- `io_bound.c`

## Concepts
- A CPU-bound process spends most of its time performing calculations.
- An I/O-bound process spends time performing input/output operations such as writing a file.
- `top` displays running processes and their CPU and memory usage.
- CPU percentage and process state can change during execution and depend on the computer.

## Compile and run on Ubuntu
```bash
gcc cpu_bound.c -o cpu_bound
gcc io_bound.c -o io_bound
./cpu_bound &
CPU_PID=$!
./io_bound &
IO_PID=$!
top -p "$CPU_PID,$IO_PID"
```
Press `q` to exit `top`. Then wait for the programs to finish:
```bash
wait "$CPU_PID"
wait "$IO_PID"
```

## Sample output
```text
CPU-bound process completed
Loop iterations: (value depends on the computer)

I/O-bound process completed
Bytes written: 67108864
```

**Note:** The CPU-bound program runs a calculation loop for about 15 seconds. The I/O-bound program writes 64 MiB to `io_data.bin`. Actual CPU percentages and loop iterations vary by system. The file `io_data.bin` is created in the current directory.
