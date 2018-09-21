int bitpair(int input){
	int product;
	short tempA, tempB;
	tempA = (short)(input >> 16);
	tempB = (short)input;

	product = (int) tempA * (int) tempB;

	return product;
}
