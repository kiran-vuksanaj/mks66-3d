OBJECTS= main.o draw.o display.o matrix.o parser.o
CFLAGS= -Wall
LDFLAGS= -lm
CC= gcc

run: all
	./main script

anim: all gen
	rm frames/*.png
	./gen | ./main
	convert frames/frame*.png anim.gif

gen: script_gen.o
	$(CC) -o gen script_gen.o

all: $(OBJECTS)
	$(CC) -o main $(OBJECTS) $(LDFLAGS)

main.o: main.c display.h draw.h ml6.h matrix.h parser.h
	$(CC) -c main.c

draw.o: draw.c draw.h display.h ml6.h matrix.h
	$(CC) $(CFLAGS) -c draw.c

dsiplay.o: display.c display.h ml6.h matrix.h
	$(CC) $(CFLAGS) -c display.c

matrix.o: matrix.c matrix.h
	$(CC) $(CFLAGS) -c matrix.c

parser.o: parser.c parser.h matrix.h draw.h display.h ml6.h
	$(CC) $(CFLAGS) -c parser.c


script_gen.o: script_gen.c
	$(CC) $(CFLAGS) -c script_gen.c


clean:
	rm *.o *~
