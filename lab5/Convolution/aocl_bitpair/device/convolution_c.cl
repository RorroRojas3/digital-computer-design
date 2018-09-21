float convolution(float *inputArray, int size, int c1)
{
	float result;
	float kernelArray[3] = {1.0/3.0, 1.0/2.0, 1.0/6.0};
	//short tempA, tempB;
	//tempA = (short)(input >> 16);
	//tempB = (short)input;
	//product = (int) tempA * (int) tempB;
	if (c1 == 0)
	{
		result = (inputArray[c1] * kernelArray[1]) + (inputArray[c1 + 1] * kernelArray[2]);
	}
	else if (c1 == (size - 1))
	{
		result = (inputArray[c1 - 1] * kernelArray[0]) + (inputArray[c1] * kernelArray[1]);
	}
	else
	{
		result = (inputArray[c1 - 1]  * kernelArray[0]) + (inputArray[c1] * kernelArray[1]) + (inputArray[c1 + 1] * kernelArray[2]);
	}

	return result;
}
