CC = gcc
CFLAGS = -D_POSIX_C_SOURCE=200809L -Wall -Wextra -std=c11
TARGET = color

all: $(TARGET)

$(TARGET): color.c
	$(CC) $(CFLAGS) -o $(TARGET) color.c

ex: $(TARGET)
	sudo mv $(TARGET) /opt/homebrew/bin/$(TARGET)
	sudo chmod +x /opt/homebrew/bin/$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all ex clean
