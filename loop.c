#include <stdio.h>
int main()
{
  int array[9999];
  for (int j = 0; j < 9999; j++) {
    array[j] += 100;
  }
  printf("array[9998]: %d\n", array[9998]);
  return 0;
}
