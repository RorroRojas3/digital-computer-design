Here you will find your entire assignment.

!!!!!!!!!!!!!!!DO NOT EDIT THE FOLDER STRUCTURE UNLESS OTHERWISE TOLD TO DO SO!!!!!!!!!!!!!!!!!

When finished editing, you need only type "make" in the device and aocl_PROJECT folders to compile the code.  Keep in mind YOU MUST BE ON A ULLAB COMPUTER for compilation to succeed (we will not help you install the AOCL utilities on your own computer, the process is very complicated).  This will generate the.aocx file you need.

Refer to the Compilation and Usage Instructions document for information about setting up the FPGA for OpenCL and Copying files to your SD card.

Usage is as follows:

./bitpair -i INFILE -o OUTFILE [-t] [-v]
-t runs a test multiplication and makes the i and o flags useless.
-v will print out the result of each multiplication during the check process for sanity checks

This project WILL NOT display the results by default.  Nor will it save the data in a human readable format.  I have NOT provided a vector printer or a variable method of inputting numbers to the multiplier.  If you choose to do this, enter the vectors folder and modify the C source code to put any numbers you want into the vector.  You can also create your own print vector function to view outputs of the binary files if needed.  You can check the host Makefile if interested in cross-compiling to run this on the ARM.
