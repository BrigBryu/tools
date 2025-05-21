/*
 * catcpy – copy absolute path, an empty separator line,
 *          and the full contents of a file to the macOS clipboard.
 *
 * Usage:  catcpy <file>
 */

#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

int main(int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Usage: catcpy <file>\n");
        return 1;
    }

    /* Resolve absolute path */
    char abs[PATH_MAX];
    if (!realpath(argv[1], abs)) {
        perror("realpath");
        return 1;
    }

    /* Open pbcopy for writing */
    FILE *clip = popen("pbcopy", "w");
    if (!clip) {
        perror("pbcopy");
        return 1;
    }

    /* 1) Write the path */
    fputs(abs, clip);
    fputc('\n', clip);// nicer paste: put path on its own line
    fputc('\n', clip);           // blank line as separator

    /* 2) Stream the file’s contents */
    FILE *in = fopen(abs, "r");
    if (!in) {
        perror("fopen");
        pclose(clip);
        return 1;
    }

    char buf[4096];
    size_t n;
    while ((n = fread(buf, 1, sizeof buf, in)) > 0)
        fwrite(buf, 1, n, clip);

    fclose(in);
    pclose(clip);

    /* Optional feedback */
    printf("Copied %s and its contents to the clipboard\n", abs);
    return 0;
}
