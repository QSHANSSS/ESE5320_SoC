#include <stdlib.h>
#include <stdio.h>
int main()
{
    //int a=80;
    int a[2][4] = {10, 20, 30, 40, 50, 60, 70, 80};
    int *p1[2];
    int **p2=NULL;
    for(int i=0;i<2;i++) 
       p1[i]=(int *)a+i*4;
    p2=(int **)p1;
    for(int i=1;i>=0;i--)
    {
        for(int j=3;j>=0;j--)
        {
            printf("&a[%d][%d]=%p, a[%d][%d]=%d\n",i,j,*(p2+i)+j,i,j,*(*(p2+i)+j) );
           
        }
    }
    /*int **ppa;
    **ppa=(p2+1)+0;
    int **ppb; **ppb=*(p2+0)+0;
    int **ppc; **ppc=(int*)ppb; */
    //printf("%p: %p\n %p: %p\n%p: %p\n",*ppa,**ppa,*ppb,**ppa,*ppc,**ppc);
    *(p2+8)=(int)(*(p2+1)+0);
    *(p2+9)=(int)*p2;
    *(p2+10)=(int)(*(p2+9));
    for(int i=0;i<3;i++)
       printf("%p: %p\n",*(p2+8+i), *(*(p2+8+i)));