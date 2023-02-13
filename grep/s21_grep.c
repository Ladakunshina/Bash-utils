#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFF 10000
#define SBUFF 1000

typedef struct {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int files;
  int empty;
} opt;

void find_line(char** argv, FILE* f, char* pattern, int file_index,
               opt* options);
int find_files(int argc, char** argv, opt* options);

void parse_flags(int argc, char* argv[], char* pattern, opt* options);

int main(int argc, char** argv) {
  opt options = {0};
  char pattern[SBUFF] = {0};

  if (argc > 1) {
    parse_flags(argc, argv, pattern, &options);

    FILE* f = NULL;

    for (int i = find_files(argc, argv, &options); i < argc; ++i) {
      if ((f = fopen(argv[i], "r")) != NULL) {
        fseek(f, 0, SEEK_SET);
        find_line(argv, f, pattern, i, &options);
        fclose(f);
      } else {
        printf("s21_grep: %s: No such file or directory\n", argv[i]);
      }
    }
  }
  return 0;
}

void parse_flags(int argc, char* argv[], char* pattern, opt* options) {
  int files_in;
  int opt = 0;

  while ((opt = getopt_long(argc, argv, "+eivclnhsfo", NULL, NULL)) != -1) {
    switch (opt) {
      case 'e':
        options->e = 1;
        break;
      case 'i':
        options->i = 1;
        break;
      case 'v':
        options->v = 1;
        break;
      case 'c':
        options->c = 1;
        break;
      case 'l':
        options->l = 1;
        break;
      case 'n':
        options->n = 1;
        break;
    }
  }
  files_in = find_files(argc, argv, options);
  if ((files_in < argc - 1)) options->files = 1;

  if (argv[files_in - 1][0] != '\0')
    strcat(pattern, argv[files_in - 1]);
  else
    strcat(pattern, ".");
}

void find_line(char** argv, FILE* f, char* pattern, int file_index,
               opt* options) {
  char line[BUFF] = {0};
  int status, number_lines = 0, matching_lines = 0;
  int cflags = REG_EXTENDED;
  regex_t compiled;
  regmatch_t pm[1];

  if (options->i) cflags = REG_ICASE;
  regcomp(&compiled, pattern, cflags);
  while (fgets(line, BUFF, f) != NULL) {
    ++number_lines;
    if (!options->v) {
      status = regexec(&compiled, line, 1, pm, 0);

      if (status == REG_NOMATCH) {
        continue;
      } else {
        ++matching_lines;
        if (line[strlen(line) - 1] == '\n') line[strlen(line) - 1] = 0;

        if (options->files && !options->c && !options->l)
          printf("%s:", argv[file_index]);

        if (options->n && !options->c && !options->l) {
          printf("%d:", number_lines);
        }

        if (!options->c && !options->l) {
          printf("%s\n", line);
        }
      }
    } else {
      status = regexec(&compiled, line, 1, pm, 0);
      if (options->v) {
        if (status != REG_NOMATCH) continue;
      } else {
        if (status == REG_NOMATCH) continue;
      }
      ++matching_lines;
      if (line[strlen(line) - 1] == '\n') line[strlen(line) - 1] = 0;
      if (!options->c && !options->l) {
        if (options->files) printf("%s:", argv[file_index]);
        if (options->n) printf("%d:", number_lines);
        printf("%s\n", line);
      }
    }
  }
  regfree(&compiled);
  if (options->c) {
    if (options->files) printf("%s:", argv[file_index]);
    if (options->l && matching_lines)
      printf("1\n");
    else
      printf("%d\n", matching_lines);
  }
  if (options->l && matching_lines) printf("%s\n", argv[file_index]);
}

int find_files(int argc, char** argv, opt* options) {
  char* ptr_e = NULL;
  int i = 1;

  while (i < argc) {
    if (argv[i][0] == '-') {
      ptr_e = strchr(argv[i], 'e');
      if (ptr_e) {
        ++ptr_e;
        if (*ptr_e == '\0') ++i;
      }
      ++i;
    } else {
      break;
    }
  }
  return (options->e) ? i : i + 1;
}
