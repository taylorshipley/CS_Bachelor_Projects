#include <stdio.h>
#include <stdlib.h>

#define RECORD_SIZE sizeof(int)

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s fileName\n", argv[0]);
        return 1;
    }

    char *fileName = argv[1];

    FILE *file = fopen(fileName, "rb");
    if (file == NULL) {
        perror("Unable to open file");
        return 1;
    }

    int min, max;
    int value;

    fread(&min, RECORD_SIZE, 1, file);
    max = min;

    while (fread(&value, RECORD_SIZE, 1, file) == 1) {
        if (value < min)
            min = value;
        if (value > max)
            max = value;
    }

    fclose(file);

    printf("Minimum value: %d\n", min);
    printf("Maximum value: %d\n", max);

    return 0;
}
