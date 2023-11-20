# Note, that this Makefile only works correctly, if you enter exact one file(-name) and this file exists (for example: file_name.pml must exist).

# Configuration

# Name of your .pml-file, without .pml-postfix
NAME :=
CC := gcc
CFLAGS :=

# More Variables for readability

FILE := $(NAME).pml
TRAIL := $(FILE).trail
CFILE := pan.c

all: $(TRAIL)
	spin -t -l $(FILE)

$(TRAIL): $(NAME)
	./$<

$(NAME): $(CFILE) Makefile
	$(CC) $(CFLAGS) -o $@ $<

$(CFILE): $(FILE)
	spin -a $(FILE)

clean:
	rm -f pan*
	rm -f _spin_nvr.tmp
	rm -f $(NAME)
	rm -f $(TRAIL)

.PHONY: all clean
