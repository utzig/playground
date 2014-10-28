#include <stdio.h>
#include <string.h>

int main(void)
{
  char l[200];
  char r[200];
  unsigned int i, n, row, col, rows, cols;

  while (1) {
    scanf("%u", &cols);
    if (cols == 0) break;

    scanf("%s", l);
    n = strlen(l);
    memset(r, '0', n);
    rows = n / cols;
    for (i = 0; i < n; i++) {
      row = i / cols;
      col = i % cols;
      if (row % 2) {
        r[row + ((cols - col - 1) * rows)] = l[i];
      } else {
        r[row + (col * rows)] = l[i];
      }
    }
    r[i] = 0;
    printf("%s\n", r);
  }

  return 0;
}
