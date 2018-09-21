
char traffic(char);

__kernel void traffic_kernel(global char* restrict A, global char* restrict lanes)

{
	int i;
	
	for(i = 0; i < 51; i++){
		lanes[i] = traffic(A[i]);
	}
	
}
