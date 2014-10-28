#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define SIZE 400

unsigned char symbols[SIZE];
unsigned int symbols_off;
unsigned char letters[SIZE];
unsigned int letters_off;

static int isop(char c)
{
  switch (c) {
  case '+':
  case '-':
  case '*':
  case '/':
  case '^':
    return 1;
  }
  return 0;
}

static int convert(char *s)
{
  unsigned int n, i;
  char c;

  n = strlen(s);
  symbols_off = letters_off = 0;
  for (i = 0; i < n; i++) {
    c = s[i];
    if (isalpha(c)) {
      printf("%c", c);
    } else if (isop(c)) {
      symbols[symbols_off++] = c;
    } else if (c == ')') {
      printf("%c", symbols[--symbols_off]);
    }
  }
  printf("\n");
}

int main(void)
{
  char line[SIZE];
  char *c;
  int i, n, end;

  scanf("%d\n", &n);
  for (i = 0; i < n; i++) {
    fgets(line, SIZE, stdin);
    for (end = strlen(line) - 1; isspace(line[end]); --end)
      line[end] = 0;
    convert(line);
  }

  return 0;
}
