mult: mult.o
	ld -o mult mult.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

mult.o: mult.s
	as -arch arm64 -o mult.o mult.s