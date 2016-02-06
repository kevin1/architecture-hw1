#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	// Parse arguments
	if (argc != 2) {
		printf("wrong number of arguments\n");
		return 1;
	}
	int dim = atoi(argv[1]);
	int size = dim * dim;

	// Allocate matrices
	int32_t *m1 = malloc(size * sizeof(int32_t));
	int32_t *m2 = malloc(size * sizeof(int32_t));
	int32_t *m3 = malloc(size * sizeof(int32_t));
	if (!m1 || !m2 || !m3) {
		printf("out of memory");
		return 1;
	}

	// Fill the matrix
	const int32_t FILL_VAL = 250;
	for (int i = 0; i < size; ++i) {
		m1[i] = m2[i] = FILL_VAL;
		m3[i] = 0;
	}

	// Multiply: m3 = m1 * m2
	for (int i = 0; i < dim; ++i)
		for (int j = 0; j < dim; ++j)
			for (int k = 0; k < dim; ++k)
				m3[dim * i + j] += m1[dim * i + k] * m2[dim * k + j];

	// Prevent the compiler from optimizing the entire program away
	printf("%d\n", m3[0]);

	free(m1);
	free(m2);
	free(m3);

	return 0;
}
