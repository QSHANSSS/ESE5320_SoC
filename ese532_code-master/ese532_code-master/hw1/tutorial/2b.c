#include <stdlib.h>
#include <stdio.h>
#define SIZE 10
int top=-1; 
int *stack[SIZE];
int a[2][4] = {{10, 20, 30, 40}, {50, 60, 70, 80}};
void display()
{
        for (int j=0;j<SIZE;j++)
       {
          printf("%#x:",stack[top]);
          int output=pop();
          if(top<1)         
            printf("%#x\n",output); 
          else        
             printf("%d\n",output);
          
       }
}

void push( )
{ 
    if (top<SIZE)
    {
      for(int i=0;i<2;i++)
      {
         for (int j=0;j<4;j++)
        {
          
          top++;
          stack[top] = *(a+i)+j;
        }
      }
          
    }
    else printf("stack overflow!");   
}
int pop()
{
    int x;
         if(top<0)
         {
                printf("stack is empty");
                return 0;
         }
         else
         {
                x=*stack[top];
                top--;
          }
          return(x);

}
int main()
{
    if(top<0)
          {
            top++;
            stack[top++]=&stack[2];
            stack[top]=&stack[6];
          } 
    push();
    display();
    //2c
    int **p=(int**)stack[0];
    for(int i=1;i>=00;i--)
    {
        for(int j=3;j>=00;j--)
        {
            printf("%p: %d\n",*((p+i*4)+j),*(*((p+4*i)+j)) ); 
        }
    }
    *(p+8)=(int*)(p+4);
    *(p+9)=(int*)(p+0);
    *(p+10)=(int*)(p+9);
    for(int i=0;i<3;i++)
       printf("%p: %p\n",*(p+8+i), *(*(p+8+i)));
    return 0;
}