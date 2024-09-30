#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 10000

void extract_value(const char *source, const char *key, char *result) {
    char *start = strstr(source, key);
    if (start) {
        start += strlen(key) + 3;
        char *end = strchr(start, '"');
        if (end) {
            size_t length = end - start;
            strncpy(result, start, length);
            result[length] = '\0';
        }
    }
}

void parse_json(const char *json) {
    const char *results_start = strstr(json, "\"results\":");
    if (results_start) {
        char name[100], species[100];
        const char *pos = results_start;

        while ((pos = strstr(pos, "\"name\":")) != NULL) {
            extract_value(pos, "name", name);
            extract_value(pos, "species", species);
            printf("Nombre: %s, Especie: %s\n", name, species);
            pos += strlen("\"name\":");
        }
    }
}

int main() {
    FILE *file = fopen("data.json", "r");
    if (file == NULL) {
        printf("No se pudo abrir el archivo\n");
        return 1;
    }

    char buffer[BUFFER_SIZE];
    fread(buffer, sizeof(char), BUFFER_SIZE, file);
    fclose(file);

    parse_json(buffer);

    return 0;
}
