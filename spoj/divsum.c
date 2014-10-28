#include <stdio.h>
#include <math.h>

unsigned long sum_divisor(unsigned int n)
{
  unsigned long l;
  unsigned int r = sqrt(n);
  unsigned int i, j;

  if (n < 2) return 0;

  l = 1;
  for (i = 2; i <= r; i++) {
    if ((n % i) == 0) {
      l += i;
      j = n / i;
      if (j != i) {
        l += j;
      }
    }
  }

  return l;
}

int main(void)
{
  unsigned int t, n, i;

  scanf("%u", &t);
  for (i = 0; i < t; i++) {
    scanf("%u", &n);
    printf("%lu\n", sum_divisor(n));
  }

  return 0;
}
