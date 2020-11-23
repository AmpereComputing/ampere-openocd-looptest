/*
 * Copyright (c) 2019, Ampere Computing LLC
 *
 * THIS WORK CONTAINS PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF
 * Ampere Computing LLC AND IS SUBJECT TO THE TERMS OF NON-DISCLOSURE AGREEMENT
 * BETWEEN Ampere Computing LLC AND THE COMPANY USING THIS FILE.
 *
 */

#include <inttypes.h>

void loop(uint32_t);
uint32_t calc(uint32_t);

int main(int argc, char *argv[])
{
	int32_t loopcount;

	(void)argc;
	(void)argv;

	loopcount = 15;

	loop(loopcount);

	return(0);
}

void loop(uint32_t maxcount)
{
	uint32_t count=0;

	for (count = 0; count <= maxcount ; count++) {
		calc(count);
	}

	return;
}

uint32_t calc(uint32_t value)
{
	uint32_t demo;

	demo = value * value;

	return demo;
}

