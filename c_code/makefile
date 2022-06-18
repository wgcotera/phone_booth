CC = gcc
DEPS = functions.h
CFLAGS = -c -I.

cabina: main.o functions.o $(DEPS)
	$(CC) -o cabina main.o functions.o

main.o: main.c $(DEPS)
	$(CC) $(CFLAGS) main.c

functions.o: functions.c $(DEPS)
	$(CC) $(CFLAGS) functions.c


.PHONY: clean
clean:
	rm -rf cabina *.o