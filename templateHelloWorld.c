/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "alt_types.h"
#include "system.h"
#include "altera_avalon_performance_counter.h" /*Use to measure code performance*/

int main() {
	int count = 0;
	PERF_RESET(PERFORMANCE_COUNTER_0_BASE);
	PERF_START_MEASURING(PERFORMANCE_COUNTER_0_BASE);

	PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE, 3);
	PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE, 1);

	for (count = 0; count < 10000; count++)
		;
	printf("Hello from Nios II!\n");

	PERF_END(PERFORMANCE_COUNTER_0_BASE, 1);

	PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE, 2);

	for (count = 0; count < 10000; count++)
		;
	printf("Hello from Nios II!\n");

	PERF_END(PERFORMANCE_COUNTER_0_BASE, 2);
	PERF_END(PERFORMANCE_COUNTER_0_BASE, 3);

	PERF_STOP_MEASURING(PERFORMANCE_COUNTER_0_BASE);
	perf_print_formatted_report((void*) PERFORMANCE_COUNTER_0_BASE,
			ALT_CPU_FREQ, 2, "total", "blabla");
	return 0;
}