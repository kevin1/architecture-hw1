LDLIBS =
LDPATHS =
INCLUDES =

FLAGS = -O2 -Wall -Wunreachable-code $(INCLUDES) $(LDPATHS) $(LDLIBS)
CFLAGS = $(FLAGS) -std=c11
CXXFLAGS = $(FLAGS) -std=c++14

.PHONY: all
all: clean cmatrix-clang cmatrix-gcc

cmatrix-clang: cmatrix.c
	clang cmatrix.c $(CFLAGS) -o $@

cmatrix-gcc: cmatrix.c
	gcc cmatrix.c $(CFLAGS) -o $@

cmatrix-dev: cmatrix.c
	clang cmatrix.c $(CFLAGS) -fsanitize=address -g -o $@

cmatrix.s: cmatrix.c
	clang cmatrix.c $(CFLAGS) -S -o $@

.PHONY: clean
clean:
	rm -rf *.o *.jar cmatrix-clang cmatrix-gcc cmatrix-dev
