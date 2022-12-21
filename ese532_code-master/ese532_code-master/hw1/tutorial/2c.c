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
}