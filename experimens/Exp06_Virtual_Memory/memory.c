#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    long mb = (argc > 1) ? strtol(argv[1], NULL, 10) : 100;
    if (mb <= 0 || mb > 65536) {
        fprintf(stderr, "Usage: %s [MB: 1..65536]\n", argv[0]);
        return 1;
    }

    size_t bytes = (size_t)mb * 1024 * 1024;
    volatile unsigned char *mem = malloc(bytes);
    if (!mem) {
        perror("malloc");
        return 1;
    }

    printf("PID: %ld\n", (long)getpid());
    printf("Allocated: %ld MiB; touching one byte per 4096-byte page.\n", mb);
    printf("Inspect with: ps -o pid,vsz,rss,stat,comm -p %ld\n", (long)getpid());
    fflush(stdout);

    for (size_t i = 0; i < bytes; i += 4096) mem[i] = (unsigned char)(i / 4096);
    printf("Finished touching pages. Press Enter to exit.\n");
    fflush(stdout);
    getchar();
    free((void *)mem);
    return 0;
}
