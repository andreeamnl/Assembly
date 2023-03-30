Add: Add.o
	ld -o Add Add.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

Add.o: Add.s
	as -arch arm64 -o Add.o Add.s