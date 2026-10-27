#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    const char *str = (argc > 1) ? argv[1] : "Hello World";
    long start = (argc > 2) ? strtol(argv[2], NULL, 10) : 6;
    long length = (argc > 3) ? strtol(argv[3], NULL, 10) : 5;

    size_t n = 0;
    while (str[n] != '\0') n++; /* Count until null terminator. */

    printf("String: %s\n", str);
    printf("Length: %zu\n", n);

    if (start < 0 || length < 0 || (size_t)start > n) {
        fprintf(stderr, "Invalid substring range.\n");
        return 1;
    }
    size_t available = n - (size_t)start;
    size_t take = (size_t)length < available ? (size_t)length : available;
    char *sub = malloc(take + 1);
    if (!sub) {
        perror("malloc");
        return 1;
    }
    for (size_t i = 0; i < take; i++) sub[i] = str[start + (long)i];
    sub[take] = '\0';
    printf("Substring: %s\n", sub);
    free(sub);
    return 0;
}
