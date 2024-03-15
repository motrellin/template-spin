#    	Copyright (C) 2024  Max Ole Elliger
#
#    	This program is free software: you can redistribute it and/or modify
#    	it under the terms of the GNU General Public License as published by
#    	the Free Software Foundation, either version 3 of the License, or
#    	(at your option) any later version.
#
#    	This program is distributed in the hope that it will be useful,
#    	but WITHOUT ANY WARRANTY; without even the implied warranty of
#    	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    	GNU General Public License for more details.
#
#    	You should have received a copy of the GNU General Public License
#    	along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
