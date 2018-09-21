PROJECT = convolution

all: default
	
default:
	aoc -g -v $(PROJECT).cl

optm:	
	aoc -g -v -c $(PROJECT).cl --report
	
clean:
	rm -rf *.aoco *.aoclib *.aocx $(PROJECT) $(PROJECT)_rtl
