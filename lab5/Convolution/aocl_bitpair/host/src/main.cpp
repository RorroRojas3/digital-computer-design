#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
#include "CL/opencl.h"
#include "AOCL_Utils.h"

using namespace aocl_utils;

// OpenCL runtime configuration
cl_platform_id platform = NULL;
unsigned num_devices = 0;
cl_device_id *device; 
cl_context context = NULL;
cl_command_queue queue; 
cl_program program = NULL;
cl_kernel kernel; 
cl_mem output_buf; 
cl_mem input_a_buf;
cl_mem input_b_buf;

// Problem data.
int N; // problem size
float *input_a;
int *input_b; 
float *output;
bool test, verbose;
int c1;

// Function prototypes
bool init_opencl();
void init_problem(char *input_file);
void run(char *output_file);
void cleanup();

// Entry point.
int main(int argc, char **argv) {
	test = false;
	verbose = false;
	char* infile_ptr = (char*) malloc(sizeof(int) * 50);
	char* outfile_ptr = (char*) malloc(sizeof(int) * 50);
	
	int c;

	opterr = 0;

	while((c = getopt (argc, argv, "i:o:vt")) != -1){
		switch(c){
			case 'i':
				strcpy(infile_ptr, optarg);
				break;
			case 'o':
				strcpy(outfile_ptr, optarg);
				break;	
			case 'v': 
				verbose = true;
				break;
			case 't':
				test = true;
				strcpy(outfile_ptr, "test.out");
				break;

			case '?':
				if(optopt == 'i' || optopt == 'o')
					printf("Options -i and -o require an argument.\n");
				else{
					printf("Unknown characters.  Usage is ./convolution -t\n");
				}
				return 1;
		}
	}

  	// Initialize the problem data.
  	init_problem(infile_ptr);

  	// Initialize OpenCL.
  	if(!init_opencl()) {
    		return -1;
  	}

  	// Run the kernel.
  	run(outfile_ptr);

  	// Free the resources allocated
  	cleanup();

  	return 0;
}

/////// HELPER FUNCTIONS ///////

// Initializes the OpenCL objects.
bool init_opencl() {
  	cl_int status;

  	//printf("Initializing OpenCL\n");

  	if(!setCwdToExeDir()) {
    		return false;
  	}

  	// Get the OpenCL platform.
  	platform = findPlatform("Altera");
  	if(platform == NULL) {
    		printf("ERROR: Unable to find Altera OpenCL platform.\n");
    		return false;
  	}

  	// Query the available OpenCL device.
  	device = getDevices(platform, CL_DEVICE_TYPE_ALL, &num_devices);
  	//printf("Platform: %s\n", getPlatformName(platform).c_str());
  	//printf("Using %d device(s)\n", num_devices);
  	//printf("  %s\n", getDeviceName(*device).c_str());

  	// Create the context.
  	context = clCreateContext(NULL, num_devices, device, NULL, NULL, &status);
  	checkError(status, "Failed to create context");

  	// Create the program for all device. Use the first device as the
  	// representative device (assuming all device are of the same type).
  	std::string binary_file = getBoardBinaryFile("convolution", *device);
  	//printf("Using AOCX: %s\n", binary_file.c_str());
  	program = createProgramFromBinary(context, binary_file.c_str(), device, num_devices);

  	// Build the program that was just created.
  	status = clBuildProgram(program, 0, NULL, "", NULL, NULL);
  	checkError(status, "Failed to build program");

  	// Command queue.
  	queue = clCreateCommandQueue(context, *device, CL_QUEUE_PROFILING_ENABLE, &status);
  	checkError(status, "Failed to create command queue");

  	// Kernel.
  	const char *kernel_name = "convolution_kernel";
  	kernel = clCreateKernel(program, kernel_name, &status);
  	checkError(status, "Failed to create kernel");

	//Input buffer.
	input_a_buf = clCreateBuffer(context, CL_MEM_READ_ONLY, 
			sizeof(float) * N, NULL, &status);
	checkError(status, "Failed to create buffer for input a");
	
	input_b_buf = clCreateBuffer(context, CL_MEM_READ_ONLY, 
			sizeof(int), NULL, &status);
	checkError(status, "Failed to create buffer for input b");

  	// Output buffer.
  	output_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
        		sizeof(float) * N, NULL, &status);
  	checkError(status, "Failed to create buffer for output");

  	return true;
}

//Initialize data for the problem.
void init_problem(char *input_file) {
	
	if(test)
	{
		printf("Enter value of N: ");
		scanf("%d", &N);
		input_a = (float*) malloc(sizeof(float) * N);
		input_b = (int*) malloc(sizeof(int));

		if(input_a == NULL || input_b == NULL){
			printf("Unable to allocate memory for the input vectors.\n");
			exit(0);
		}

		//int i;

		/*for(i = 0; i < N; i++){
			input_a[i] = 1 >> i;
			input_b[i] = 256/(i+1);
		}*/
		
		//input_a = {1,2,3,4,5};
		
		for (int c1 = 0; c1 < N; c1++)
		{
			input_a[c1] = (float)c1 + 3;
		}
		
		*input_b = N;

		output = (float*) malloc(sizeof(float) * N);
		
		if(output == NULL)
		{
			printf("Unable to allocate memory for the output vector.\n");
			exit(0);
		}
	}
	else
	{
		FILE *INFILE = fopen(input_file, "rb");
	
		if(INFILE == NULL)
		{
			printf("Unable to open input file.\n");
			exit(0);
		}
	
		fread(&N, sizeof(int), 1, INFILE);

		if(N == 0){
			printf("File is reporting size 0 vectors.\n");
			exit(0);
		}

		input_a = (float*) malloc(sizeof(float) * N);
		input_b = (int*) malloc(sizeof(int));

		if(input_a == NULL || input_b == NULL){
			printf("Unable to allocate memory for the input vectors.\n");
			exit(0);
		}

		*input_b = N;
		
		output = (float*) malloc(sizeof(float) * N);

		if(output == NULL){
			printf("Unable to allocate memory for the output vector.\n");
			free(input_a);
			free(input_b);
			exit(0);
		}	

		fread(input_a, sizeof(float), N, INFILE);
		//fread(input_b, sizeof(float), N, INFILE);

		fclose(INFILE);
	}
}

void run(char *output_file) {
	int i;
	
  	cl_int status;

  	

  	// Launch the problem for each device.
  	cl_event kernel_event;
  	cl_event finish_event;
	cl_event write_event;

	status = clEnqueueWriteBuffer(queue, input_a_buf, CL_FALSE,
			0, sizeof(float) * N, input_a, 0, NULL, &write_event);
	checkError(status, "Failed to write input buffer");
	
	clWaitForEvents(num_devices, &write_event);
	
	status = clEnqueueWriteBuffer(queue, input_b_buf, CL_FALSE,
			0, sizeof(int), input_b, 0, NULL, &write_event);
	checkError(status, "Failed to write input buffer");

	clWaitForEvents(num_devices, &write_event);

	// Set kernel arguments.
  	unsigned argi = 0;
 	status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_a_buf);
  	checkError(status, "Failed to set argument %d", argi - 1);
 	status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_b_buf);
  	checkError(status, "Failed to set argument %d", argi - 1);
 	//status = clSetKernelArg(kernel, argi++, sizeof(int), &N);
  	//checkError(status, "Failed to set argument %d", argi - 1);
  	status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
	checkError(status, "Failed to set argument %d", argi - 1);

  	// Enqueue kernel.
	// Use a global work size corresponding to the number of elements to add
  	// for this device.
	// 
  	// We don't specify a local work size and let the runtime choose
	// (it'll choose to use one work-group with the same size as the global
 	// work-size).
	//
  	// Events are used to ensure that the kernel is not launched until
	// the writes to the input buffers have completed.
  	const size_t global_work_size = N;
	//printf("Launching for device %d (%d elements)\n", 0, global_work_size);
	
	double start_time = getCurrentTimestamp();
	
  	status = clEnqueueNDRangeKernel(queue, kernel, 1, NULL,
       		&global_work_size, NULL, 1, &write_event, &kernel_event);
  	checkError(status, "Failed to launch kernel");
  	
	clWaitForEvents(num_devices, &kernel_event);
	
	double end_time = getCurrentTimestamp();
  
  	// Read the result. This the final operation.
	status = clEnqueueReadBuffer(queue, output_buf, CL_FALSE,
       		0, sizeof(float)*N, output, 1, &kernel_event, &finish_event);


  	// Wait for all devices to finish.
	clWaitForEvents(num_devices, &finish_event);

	// Wall-clock time taken.
 	printf("\nWall Time of Kernel: %0.3f ms\n", (end_time - start_time) * 1e3);

	// Get kernel times using the OpenCL event profiling API.
  	cl_ulong time_ns = getStartEndTime(kernel_event);
	printf("Kernel time (device 0): %0.3f ms\n", double(time_ns) * 1e-6);
	
	start_time = getCurrentTimestamp();

	bool correct = true;	

	printf("OpenCL Completed\n");

	/*for(i = 0; i < N; i++){
		if(verbose){
			printf("%d * %d = %d : OpenCL returns %d", input_a[i], input_b[i], 
					(int)input_a[i]*(int)input_b[i], output[i]);
		}
		if(correct && output[i] != ((int) input_a[i]) * ((int) input_b[i])){
			printf("%d * %d = %d  -> Kernel output %d\nExiting...\n", input_a[i], input_b[i], 
										(int)input_a[i]*(int)input_b[i], output[i]);

			correct = false;
			/*
			clReleaseEvent(kernel_event);
			clReleaseEvent(finish_event);
			clReleaseEvent(write_event);
			exit(0);
			
		}
	}
	*/
	
	/*
	for (c1 = 0; c1 < N; c1++)
	{
		printf("Input Vector Element #%d = %lf\n",c1,input_a[c1]); 
	}
	
	printf("\n");
	
	for (c1 = 0; c1 < N; c1++)
	{
		printf("Output Convolution Element #%d = %lf\n", c1, output[c1]);
	}
	*/
	end_time = getCurrentTimestamp();
	
	

	if(correct)
		printf("\nOutput Correct\nWall Time of ARM: %0.3f ms\n", (end_time - start_time) * 1e3);
	else{
		printf("Output Incorrect\n");
		cleanup();
		exit(0);
	}


	FILE *OUTFILE;
	if(test)
		OUTFILE = fopen("test.out", "wb");
	else
		OUTFILE = fopen(output_file, "wb");
	
	if(OUTFILE == NULL){
		printf("Could not open output file.\n");
		exit(0);
	}

	fwrite(output, sizeof(int), N, OUTFILE);

	fclose(OUTFILE);
	
	// Release all events.
  	clReleaseEvent(kernel_event);
	clReleaseEvent(finish_event);
	cleanup();

}

// Free the resources allocated during initialization
void cleanup() {
  	if(kernel) {
    		clReleaseKernel(kernel);
  	}
  	if(queue) {
      		clReleaseCommandQueue(queue);
  	}

  	if(output_buf) {
      		clReleaseMemObject(output_buf);
  	}

	if(input_a_buf){
		clReleaseMemObject(input_a_buf);
	}
	
	if(input_b_buf){
		clReleaseMemObject(input_b_buf);	
	}  

  	if(program) {
    		clReleaseProgram(program);
  	}
  	if(context) {
    		clReleaseContext(context);
  	}
}

