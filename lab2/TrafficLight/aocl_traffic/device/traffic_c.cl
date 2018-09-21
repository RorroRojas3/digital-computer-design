char traffic(char in){
	unsigned char output = 0;

	switch(in){
		case 0: output = 254;
		break;

		case 1: output = 253;
		break;
		
		case 2: output = 251;
		break;
		
		case 3: output = 247;
		break;

		case 4: output = 239;
		break;

		case 5: output = 223;
		break;

		case 6: output = 191;
		break;
		
		case 7: output = 127;
		break;
	}

	return output;
	
}
