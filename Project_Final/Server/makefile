encoder.o:encoder.cpp cdc.cpp 
	g++ -c encoder.cpp cdc.cpp
cdc.o: cdc.cpp stopwatch.h
	g++ -c cdc.cpp stopwatch.h -o cdc.o
LZW.o:LZW.cpp
	g++ -c LZW.cpp -o LZW.o
SHA.o: SHA.cpp
	g++ -c cdc.cpp -o SHA.o
match.o:match.cpp
	g++ -c match.cpp -o match.o
#lzw_test.o:lzw_test.cpp
#	g++ -c lzw_test.cpp -o lzw_test.cpp
all:  testbench.o
	g++ -pg testbench.cpp -o all

