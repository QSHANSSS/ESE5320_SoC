cdc.o: cdc.cpp stopwatch.h
	g++ -c cdc.cpp stopwatch.h -o cdc.o
LZW.o:LZW.cpp
	g++ -c LZW.cpp -o LZW.o
LZW:LZW.o
	g++ -pg LZW.cpp -o LZW
all: cdc.o LZW.o
	g++ -pg cdc.cpp LZW.cpp -o cdc
