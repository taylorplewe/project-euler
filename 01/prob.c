#include <stdio.h>
#include <stdlib.h>

unsigned long sumAllMultsBelowTotal(int mult1, int mult2, int total) {
	unsigned long sum = 0;
	for (int i = mult1; i < total; i += mult1)
		sum += i;
	for (int i = mult2; i < total; i += mult2)
		if (i % mult1 != 0) sum += i;
	return sum;
}

int main(int argc, char** argv) {
	int mult1, mult2, total;
	mult1 = argc < 2 ? 3 : atoi(argv[1]);
	mult2 = argc < 3 ? 5 : atoi(argv[2]);
	total = argc < 4 ? 1000 : atoi(argv[3]);

	printf("multiples: %i and %i; total: %i\n", mult1, mult2, total);
	printf("%lu\n", sumAllMultsBelowTotal(mult1, mult2, total));

	return 0;
}
