CC=gcc
BIN_DIR=bin
OUTPUT=$(BIN_DIR)/main

OBJ_DIR=obj
SRC_DIR=src

# Change this to the file you want to compile
FILE_PREFIX=1-7
FILE_NAME=$(SRC_DIR)/$(FILE_PREFIX).c

CFLAGS=-Wall -Wextra -Werror -pedantic -std=c2x -c
LDFLAGS=
LDLIBS=

COMPILE=$(CC) $(CFLAGS) $(LDFLAGS)

VALGRIND_IMG=valgrind:latest

.PHONY: build
build: clean bin_dir obj_dir
	@$(MAKE) compile
	@$(MAKE) link

.PHONY: compile
compile:
	$(COMPILE) -o $(OBJ_DIR)/$(FILE_PREFIX).o $(FILE_NAME) $(LDLIBS)
	$(COMPILE) -o $(OBJ_DIR)/apue.o $(SRC_DIR)/apue.c $(LDLIBS)

.PHONY: link
link:
	$(CC) -o $(OUTPUT) $(OBJ_DIR)/apue.o $(OBJ_DIR)/$(FILE_PREFIX).o

.PHONY: run
run: build
	@./$(OUTPUT) $(ARGS)

.PHONY: valgrind
valgrind: build
	valgrind -s --leak-check=full --show-leak-kinds=all ./$(OUTPUT)

.PHONY: clean
clean:
	@rm -rf $(BIN_DIR)

bin_dir:
	@mkdir -p $(BIN_DIR)

obj_dir:
	@mkdir -p $(OBJ_DIR)

valgrind_build:
	docker build -t $(VALGRIND_IMG) .

valgrind_run: valgrind_build
	docker run -it -v $(PWD):/tmp -w /tmp $(VALGRIND_IMG)
