# Practical: Observing Process Memory Maps Using pmap

## Aim
To examine the virtual memory mappings of the CPU-bound and I/O-bound programs from Experiment 7 using the `pmap` command.

## Source files
- `pmap_commands.sh`
- `../Experiment-7/cpu_bound.c`
- `../Experiment-7/io_bound.c`

## Concepts
- Every process has its own virtual address space.
- The text segment stores program instructions.
- The data and BSS segments store global and static variables.
- The heap is used for dynamic memory allocation.
- The stack stores local variables and function-call information.
- Shared libraries are mapped into a process when required.
- `pmap -x PID` displays detailed memory usage for a process.
- `/proc/PID/maps` displays the process memory mappings.

## Compile and run on Ubuntu
Run the commands from the main folder containing the three experiment folders:
```bash
cd Experiment-8
chmod +x pmap_commands.sh
./pmap_commands.sh
```
The script compiles the Experiment 7 programs, starts both processes, displays their memory maps, and opens `top` so the processes can be observed. Press `q` to exit `top`.

You can also inspect a process manually while it is running:
```bash
pmap -x PID
cat /proc/PID/maps
```
Replace `PID` with the actual process ID.

## Sample output
```text
--- CPU-bound process memory map ---
Address           Kbytes     RSS   Dirty Mode  Mapping
...               ...        ...   ...    ...   cpu_bound
...               ...        ...   ...    ...   [heap]
...               ...        ...   ...    ...   [stack]

--- I/O-bound process memory map ---
Address           Kbytes     RSS   Dirty Mode  Mapping
...               ...        ...   ...    ...   io_bound
...               ...        ...   ...    ...   [heap]
...               ...        ...   ...    ...   [stack]
```

**Note:** The dots represent system-specific values. Memory addresses, RSS, and total memory values are different on each run. Run `pmap` while the process is still active; after it exits, its PID and `/proc/PID` entry are no longer available.
