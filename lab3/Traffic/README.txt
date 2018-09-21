Here you will find your entire assignment.

!!!!!!!!!!!!!!!DO NOT EDIT THE FOLDER STRUCTURE UNLESS OTHERWISE TOLD TO DO SO!!!!!!!!!!!!!!!!!

You will only need to edit the traffic_machine.vhd and traffic.vhd files in aocl_traffic/device.
Please keep in mind that you may need to edit the .xml file to include the decoder file.
You will not need to edit the host code at all.

If you run ./traffic -t , your expected output is shown below.

Signal: Red
Signal: Red
Signal: Red
Signal: Red
Signal: Left & Red
Signal: Yellow
Signal: Red
Signal: Green
Signal: Yellow
Signal: Right & Red
Signal: Red
Signal: Right & Red
Signal: Red
Signal: Left & Red
Signal: Green
Signal: Yellow
Signal: Red
Signal: Red


If your OpenCL outputs an extra state when manually typing inputs, this is OK.  

Please make sure to type qqq to exit, otherwise it may appear the program hangs up.
I did not make the UI super sophisticated, but it should let you know if you make a typo.
