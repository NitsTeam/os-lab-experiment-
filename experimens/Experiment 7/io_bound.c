#include <stdio.h>
#include <unistd.h>
#include <time.h>

int main(void)
{
    FILE *fp;
    char data[4096];
    struct timespec delay = {0, 1000000}; /* 1 millisecond */
    unsigned long long total = 0;

    for (int i = 0; i < (int)sizeof(data); i++)
        data[i] = 'A';

    fp = fopen("io_data.bin", "wb");
    if (fp == NULL) {
        perror("fopen");
        return 1;
    }

    for (int i = 0; i < 16384; i++) {
        if (fwrite(data, 1, sizeof(data), fp) != sizeof(data)) {
            perror("fwrite");
            fclose(fp);
            return 1;
        }
        total += sizeof(data);

        if (i % 256 == 0) {
            if (fflush(fp) != 0 || fsync(fileno(fp)) != 0) {
                perror("file sync");
                fclose(fp);
                return 1;
            }
        }
        nanosleep(&delay, NULL);
    }

    if (fclose(fp) != 0) {
        perror("fclose");
        return 1;
    }

    printf("I/O-bound process completed\n");
    printf("Bytes written: %llu\n", total);
    return 0;
}
