#include "stdio.h"
#include "stdlib.h"
void main()
{
   double a[] = {3.14, 2.71};
   unsigned char *p1=(unsigned char*)a;
   int i=0;
   while(i<sizeof(a))
  {
     printf("%#x: ",p1);
     printf("%x\n",*p1);
     i++;
     p1++;

  }
}