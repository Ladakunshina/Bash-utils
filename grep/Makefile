C_FLags=-Wall -Werror -Wextra -std=c11

all: build 

build: s21_grep 

s21_grep: s21_grep.c
	gcc $(C_FLags) s21_grep.c -o s21_grep

style: s21_grep.c
	clang-format -style=google -n s21_grep.c

clean:
	rm -rf s21_grep
