// Library Section
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define N 1000000

int main(int argc, char *argv[])
{
	// Variable Declaration Section
	float *inputArray;
	inputArray = (float *)malloc(N * sizeof(float));
	int c1;
	for (c1 = 0; c1 < N; c1++)
	{
		inputArray[c1] = (float)c1 + 3;
	}
	int lengthOfInputArray = sizeof(inputArray) / sizeof(inputArray[0]);
	float kernelArray[3] = {1.0/3.0, 1.0/2.0, 1.0/6.0};
	float *result;
	result = (float *)malloc(N * sizeof(float));
	
	// Start Timing
	clock_t begin = clock();

	// Calculates convolution of the two arrays
	for (c1 = 0; c1 < N; c1++)
	{
		if (c1 == 0)
		{
			result[c1] = (inputArray[c1] * kernelArray[1]) + (inputArray[c1 + 1] * kernelArray[2]); 
		}
		else if (c1 == (lengthOfInputArray - 1))
		{
			result[c1] = (inputArray[c1 - 1] * kernelArray[0]) + (inputArray[c1] * kernelArray[1]);
		}
		else
		{
			result[c1]  = (inputArray[c1 - 1]  * kernelArray[0]) + (inputArray[c1] * kernelArray[1]) + (inputArray[c1 + 1] * kernelArray[2]);
		}
	}
	
	// End timing
	clock_t end = clock();
	// Calculate timing
	double time_spent = (double)(end - begin)*1000 / CLOCKS_PER_SEC;
	/*
	for (c1 = 0; c1 < N; c1++)
	{
		printf("Result #%d: %lf\n", c1 + 1, result[c1]);
	}
	*/
	
	printf("\nConvolution Algorithm Time: %lf\n\n", time_spent);


	return 0;
}
