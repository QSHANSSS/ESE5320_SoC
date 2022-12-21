App.o: App.cpp App.h 
	g++ -c App.cpp -o App.o

Compress.a: Compress.c App.h
	gcc -c Compress.c -o Compress.a

Differentiate.a: Differentiate.c App.h
	gcc -c Differentiate.c -o Differentiate.a

Filter.o: Filter.cpp App.h
	gcc -c Filter.cpp -o Filter.o

Scale.a: Scale.c App.h
	gcc -c Scale.c -o Scale.a

GPROF_MAIN = App
SRCS = ~/Desktop/SoC/hw2/assignment/APP.cpp ./assignment/Compress.c ./assignment/Scale.c ./assignment/Filter.cpp ./assignment/Differentiate.c
CC = g++

# define any compile-time flags
CFLAGS = -Wall -g -O2 -Wno-unused-label

# define any directories containing header files other than /usr/include
# e.g. -I/home/newhall/include  -I../include
INCLUDES = -I/src/sw/ -I/src/host/ -I/hw2/assignment

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like: -L/home/newhall/lib  -L../lib
LFLAGS =

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname
#   option, something like (this will link in libmylib.so and libm.so:
#   -L/home/newhall/lib  -L../lib
LIBS =
OBJS = $(SRCS:.c=.a)

$(GPROF_MAIN): App.o Compress.a Differentiate.a Filter.o Scale.a
	$(CC) -pg App.cpp Scale.a Compress.a Filter.o Differentiate.a -o App

gprof:	$(GPROF_MAIN)
	@echo  Executable $(GPROF_MAIN) compiled!
	@echo  Running ./$(GPROF_MAIN) to get gmon.out for gprof...
	@./$(GPROF_MAIN)
	@echo  Running gprof -p ./$(GPROF_MAIN)...
	@gprof -p ./$(GPROF_MAIN)


clean:
	rm -f App.o Compress.o Differentiate.o Filter.o Scale.o App Output.bin