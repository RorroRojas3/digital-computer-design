#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>
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
cl_mem input_buf;

// Problem data.
int N; // problem size
char input_a; 
unsigned char *output;
char ref_output;
bool test;

// Function prototypes
bool init_opencl();
void init_problem();
void run();
void cleanup();

char *inputs;
char **output_codes;

// Entry point.
int main(int argc, char **argv) {
	test = false;

  	// Initialize the problem data.
  	init_problem();

  	// Initialize OpenCL.
  	if(!init_opencl()) {
    		return -1;
  	}

  	// Run the kernel.
  	run();

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
  	std::string binary_file = getBoardBinaryFile("traffic", *device);
  	//printf("Using AOCX: %s\n", binary_file.c_str());
  	program = createProgramFromBinary(context, binary_file.c_str(), device, num_devices);

  	// Build the program that was just created.
  	status = clBuildProgram(program, 0, NULL, "", NULL, NULL);
  	checkError(status, "Failed to build program");

  	// Command queue.
  	queue = clCreateCommandQueue(context, *device, CL_QUEUE_PROFILING_ENABLE, &status);
  	checkError(status, "Failed to create command queue");

  	// Kernel.
  	const char *kernel_name = "traffic_kernel";
  	kernel = clCreateKernel(program, kernel_name, &status);
  	checkError(status, "Failed to create kernel");

	//Input buffer.
	input_buf = clCreateBuffer(context, CL_MEM_READ_ONLY, 
			sizeof(char) * 10, NULL, &status);
	checkError(status, "Failed to create buffer for input");

  	// Output buffer.
  	output_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
        		sizeof(unsigned char) * 10, NULL, &status);
  	checkError(status, "Failed to create buffer for output");

  	return true;
}

//Initialize data for the problem.
void init_problem() {

	int i;

	output = (unsigned char*) malloc(sizeof(unsigned char) * 10);
	output_codes = (char**)malloc(sizeof(char**) * 8);
	inputs = (char*) malloc(sizeof(char) * 10);  

	/*
	inputs[0] = 0;
	inputs[1] = 0;
	inputs[2] = 1;
	inputs[3] = 2;
	inputs[4] = 3;
	inputs[5] = 4;
	inputs[6] = 6;
	inputs[7] = 5;
	inputs[8] = 7;
	inputs[9] = 2;
	inputs[10] = 0;
	*/
	inputs[0] = 0;
	inputs[1] = 1;
	inputs[2] = 2;
	inputs[3] = 3;
	inputs[4] = 4;
	inputs[5] = 6;
	inputs[6] = 5;
	inputs[7] = 7;
	inputs[8] = 2;
	inputs[9] = 0;
	
	for(i = 0; i < 8; i++){
		output_codes[i] = (char*)malloc(sizeof(char*) * 15);

		switch(i){
		
			case 0:
				strcpy(output_codes[i], "Green");
			break;
			
			case 1:
				strcpy(output_codes[i], "Yellow");
			break;

			case 2:
				strcpy(output_codes[i], "Red");
			break;

			case 3:
				strcpy(output_codes[i], "Left & Red");
			break;

			case 4:
				strcpy(output_codes[i], "Left & Green");
			break;

			case 5:
				strcpy(output_codes[i], "Right & Red");
			break;

			case 6:
				strcpy(output_codes[i], "Flash Yellow");
			break;

			case 7:
				strcpy(output_codes[i], "Flash Red");
			break;
		}
	}	
}

void run() {
	int i, size = 10;
  	cl_int status;
	
  	const double start_time = getCurrentTimestamp();

  	// Launch the problem for each device.
  	cl_event kernel_event;
  	cl_event finish_event;
	cl_event write_event;

	status = clEnqueueWriteBuffer(queue, input_buf, CL_FALSE,
			0, sizeof(char) * 10, inputs, 0, NULL, &write_event);
	checkError(status, "Failed to write input buffer");
		

	// Set kernel arguments.
  	unsigned argi = 0;
 	status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_buf);
  	checkError(status, "Failed to set argument %d", argi - 1);
  	status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
	checkError(status, "Failed to set argument %d", argi - 1);
	status = clSetKernelArg(kernel, argi++, sizeof(int), &size);
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
  	const size_t global_work_size = 1;
	//printf("Launching for device %d (%d elements)\n", 0, global_work_size);

  	status = clEnqueueNDRangeKernel(queue, kernel, 1, NULL,
       		&global_work_size, NULL, 1, &write_event, &kernel_event);
  	checkError(status, "Failed to launch kernel");

	clWaitForEvents(num_devices, &kernel_event);
  
  	// Read the result. This the final operation.
	status = clEnqueueReadBuffer(queue, output_buf, CL_FALSE,
       		0, sizeof(char)*10, output, 1, &kernel_event, &finish_event);


  	// Wait for all devices to finish.
	clWaitForEvents(num_devices, &finish_event);

  	const double end_time = getCurrentTimestamp();
	unsigned char *output_decoder = (unsigned char*) malloc(sizeof(char) * 255);
	output_decoder[254] = 0;
	output_decoder[253] = 1;
	output_decoder[251] = 2;
	output_decoder[247] = 3;
	output_decoder[239] = 4;
	output_decoder[223] = 5;
	output_decoder[191] = 6;
	output_decoder[127] = 7;

	for(i = 0; i < 10; i++){
		printf("Input: %d -> Light: %s\n", inputs[i], output_codes[output_decoder[output[i]]]);
	}

	// Wall-clock time taken.
 	//printf("\nTime: %0.3f ms\n", (end_time - start_time) * 1e3);

	// Get kernel times using the OpenCL event profiling API.
  	cl_ulong time_ns = getStartEndTime(kernel_event);
	//printf("Kernel time (device 0): %0.3f ms\n", double(time_ns) * 1e-6);i
	
	// Release all events.
  	clReleaseEvent(kernel_event);
	clReleaseEvent(finish_event);

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
  

  	if(program) {
    		clReleaseProgram(program);
  	}
  	if(context) {
    		clReleaseContext(context);
  	}
}

