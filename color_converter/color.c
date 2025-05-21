#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <ctype.h>
#include <limits.h>
#include <sys/stat.h>
#include <signal.h>
#include <dirent.h>

static void usage(const char *prog) {
    fprintf(stderr,
        "Usage:\n"
        "  %s -rgbth R G B   # convert RGB to hex\n"
        "  %s -htrgb HEX     # convert hex to RGB\n",
        prog, prog);
    exit(EXIT_FAILURE);
}

static int hexval(char c) {
    if ('0' <= c && c <= '9') return c - '0';
    c = tolower(c);
    if ('a' <= c && c <= 'f') return 10 + (c - 'a');
    return -1;
}

int main(int argc, char *argv[]) {
    if (argc < 3) usage(argv[0]);

    if (strcmp(argv[1], "-rgbth") == 0) {
        if (argc != 5) usage(argv[0]);
        int r = atoi(argv[2]);
        int g = atoi(argv[3]);
        int b = atoi(argv[4]);
        if (r<0||r>255||g<0||g>255||b<0||b>255) {
            fprintf(stderr, "RGB values must be 0–255\n");
            return EXIT_FAILURE;
        }
        char hex[8];
        snprintf(hex, sizeof hex, "#%02X%02X%02X", r, g, b);
        printf("\x1b[38;2;%d;%d;%dm%s\x1b[0m\n", r, g, b, hex);
        return EXIT_SUCCESS;
    }
    else if (strcmp(argv[1], "-htrgb") == 0) {
        char *h = argv[2];
        if (h[0] == '#') h++;
        if (strlen(h) != 6) usage(argv[0]);
        int hi = hexval(h[0])<<4 | hexval(h[1]);
        int gi = hexval(h[2])<<4 | hexval(h[3]);
        int bi = hexval(h[4])<<4 | hexval(h[5]);
        if (hi<0||gi<0||bi<0) {
            fprintf(stderr, "Invalid hex string\n");
            return EXIT_FAILURE;
        }
        char out[32];
        snprintf(out, sizeof out, "r:%d g:%d b:%d", hi, gi, bi);
        printf("\x1b[38;2;%d;%d;%dm%s\x1b[0m\n", hi, gi, bi, out);
        return EXIT_SUCCESS;
    }
    else {
        usage(argv[0]);
    }
}
