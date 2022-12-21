#include <stdlib.h>
#include <stdio.h>
void temp(int i) {
  int a[2];
  int b[3];
  int *c;
  int *d;
  c = (int *)malloc(sizeof(int) * 4);
  d = (int *)malloc(sizeof(int) * 5);

  // print addresses for arrays here....
  printf("%#x\n",a);
  printf("%#x\n",b);
  printf("%#x\n",c);
  printf("%#x\n",d);

  return;
}
int main()
{
    temp(1);
    return 0;
}