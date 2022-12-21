#include <stdlib.h>
#include <stdio.h>
main()
{
    double a=20.0;
    double *b=&a;
    double *c=0;
    double *d=0;
    int e=(int)malloc(sizeof(7));
    e=7;
    int f=(int)malloc(sizeof(6));
    f=6;
    int g=(int)malloc(sizeof(50));
    g=50;
    char *h=(char*)malloc(16);
    h="5";
    //char h[16]="5";
    c=&h;
    d=&g;
    printf("%#x:%g\n",&a,a);
    printf("%#x:%#x\n",&b,b);
    printf("%#x:%#x\n",&c,c);
    printf("%#x:%#x\n",&d,d);
    printf("%#x:%d\n",&e,e);
    printf("%#x:%d\n",&f,f);
    printf("%#x:%d\n",&g,g);
    printf("%#x:%s\n",&h,h);

}