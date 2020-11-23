#
# Copyright (c) 2019, Ampere Computing LLC
#
# THIS WORK CONTAINS PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF
# Ampere Computing LLC AND IS SUBJECT TO THE TERMS OF NON-DISCLOSURE AGREEMENT
# BETWEEN Ampere Computing LLC AND THE COMPANY USING THIS FILE.
#
#

SHELL = /bin/bash

CC = aarch64-none-elf-gcc
OBJDUMP = aarch64-none-elf-objdump

CFLAGS = -nostdlib -ansi -g -Werror -Wall -Wextra -Wlogical-op -Wshadow -Wformat=2 -e main -Ttext 0x90001000 -Tdata 0x90002000

all : loop_test.axf
.PHONY : all

%.axf : %.o
	$(CC) -I. $(CFLAGS) -o $@ $^
	$(OBJDUMP) -S $@ > $*.list
	$(OBJDUMP) -t $@ > $*.map
	-rm -f $^

%.o : %.c
	$(CC) -I. $(CFLAGS) -c $^

.PHONY : clean
clean :
	-rm -f *.axf
	-rm -f *.list *.map
	-rm -f *.o
