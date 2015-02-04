LIBS := $(shell pkg-config --libs IL)

all: test

test: test.c
	gcc -o test test.c $(LIBS)
