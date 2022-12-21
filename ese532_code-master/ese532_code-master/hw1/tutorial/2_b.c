#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{
   int a[2][4] = {{10, 20, 30, 40}, {50, 60, 70, 80}};
   int *p=a;
   for(int i=0;i<2;i++)
    {
        for (int j=0;j<4;j++)
       {
          printf("&a[%d][%d]:%p, a[%d][%d]:%d\n",i,j,(p+i*4+j),i,j,*(p+i*4+j));
          
       }
    }
    *(p+8)=p+3;
    *(p+9)=p+8;
    printf("%p: %p\n%p: %p\n",(p+8),*(p+8),(p+9),*(p+9));
    //2.c
    
    int **pa=p;
    for(int i=0;i<2;i++)
    {
        for(int j=0;j<4;j++)
        {
            //printf("&a[%d][%d]=%p, a[%d][%d]=%d\n",i,j,*(pa+i)+j,i,j,*(*(pa+i)+j) );
            printf("&a[%d][%d]=%p, a[%d][%d]=\n",i,j,*(pa+i)+j,i,j );
           
        }
    }
    *(pa+8)=*(pa+1)+3;
    *(pa+9)=*(pa+0)+1;
    *(pa+10)=(pa+9);
    for(int i=0;i<3;i++) ;
       //printf("%p, %p\n",*(pa+8+i), *(*(pa+8+i)));
}
