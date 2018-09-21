
char traffic(char);

__kernel void traffic_kernel(global char* restrict A, global char* restrict output, int size)

{
	int i;
	
	for(i = 0; i < size; i++){
		output[i] = traffic(A[i]);
	}
	
}
