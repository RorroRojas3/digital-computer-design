#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv){
	
	FILE *outfile = fopen("vector_squares", "wb");

	short *squares = malloc(sizeof(short) * 15);
	short *zeroes = malloc(sizeof(short) * 15);
	short *ones = malloc(sizeof(short) * 15);

	int i;

	for(i = 0; i < 15; i++){
		squares[i] = i;
		zeroes[i] = 0;
		ones[i] = 1;
	}
	
	i = 15;

	fwrite(&i, sizeof(int), 1, outfile);
	fwrite(squares, sizeof(short), i, outfile);
	fwrite(squares, sizeof(short), i, outfile);

	fclose(outfile);

	outfile = fopen("halfzero", "wb");

	fwrite(&i, sizeof(int), 1, outfile);
	fwrite(zeroes, sizeof(short), i, outfile);
	fwrite(squares, sizeof(short), i, outfile);

	fclose(outfile);

	outfile = fopen("halfones", "wb");
	
	fwrite(&i, sizeof(int), 1, outfile);
	fwrite(ones, sizeof(short), i, outfile);
	fwrite(squares, sizeof(short), i, outfile);
	
	fclose(outfile);

}
