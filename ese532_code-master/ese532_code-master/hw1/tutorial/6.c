#include <stdlib.h>
#include <stdio.h>
void main()
{
int a[3];
int b[4];
int c[5];
int *p=b+4;
*p=40;

// intervening code omitted

b[100]=13;
printf("a:%p,b:%p, c:%p\n, p:%p, *p:%d, &b[4]: %p, b[4]:%d",a,b,c,p,*p,&b[4],b[4]);
}