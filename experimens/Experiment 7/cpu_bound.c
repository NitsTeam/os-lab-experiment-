#include <stdio.h>
#include <time.h>

int main(void)
{
    volatile unsigned long long counter = 0;
    struct timespec start, now;

    clock_gettime(CLOCK_MONOTONIC, &start);

    do {
        counter++;
        clock_gettime(CLOCK_MONOTONIC, &now);
    } while ((now.tv_sec - start.tv_sec) < 15);

    printf("CPU-bound process completed\n");
    printf("Loop iterations: %llu\n", counter);

    return 0;
}
