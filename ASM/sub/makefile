sub: sub.o
	ld -o sub sub.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

sub.o: sub.s
	as -arch arm64 -o sub.o sub.s