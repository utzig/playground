#include <stdio.h>

int main(void)
{
  unsigned int i, n, m;

  while (1) {
    if (scanf("%u", &n) == EOF) break;
    for (i = 1, m = 0; i <= n; m += i*i, i++) {}
    if (m > 0) printf("%u\n", m);
  }

  return 0;
}
