
int bitpair(int);

__kernel void bitpair_kernel(__global const short* A, __global const short* B,  __global int* restrict product)

{
	int temp, i; 
	
 	i = get_global_id(0);	
	temp =  0 | A[i];
	temp = (temp << 16) | B[i];

	product[i] = bitpair(temp);
//	printf("Sending%d,received%don%d", temp, product[i], i);
}
