# Practical: Process ID and wait() in C

## Aim
To create a child process using `fork()`, display process IDs, and make the parent wait for the child using `wait()`.

## Source file
- `process_id_wait.c`

## Concepts
- `fork()` creates a child process.
- `getpid()` returns the current process ID.
- `getppid()` returns the parent process ID.
- `wait(NULL)` makes the parent wait until a child process terminates.
- `pid == 0` means the code is running in the child.
- `pid > 0` means the code is running in the parent; the value is the child's PID.
- `pid < 0` means `fork()` failed.

## Compile and run on Ubuntu
```bash
gcc process_id_wait.c -o process_id_wait
./process_id_wait
```

## Sample output
```text
Child Process
Child PID: 2456
Parent PID: 2455
Parent Process
Parent PID: 2455
Child PID: 2456
```

**Note:** The PID numbers above are examples. Your system will show different PID values. The parent output appears after the child finishes because the parent calls `wait(NULL)`.
