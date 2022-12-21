#include <stdlib.h>
#include <stdio.h>
#define SIZE 8
int top=-1; 
int stack[SIZE];
void display()
{
        for (int j=0;j<SIZE;j++)
       {
          int output=pop();
          printf("%#x:",&stack[top]);
          if(top<1) 
             printf("%d\n",output);
          else 
             printf("%d\n",output);
          
       }
}
void push(int x)
{ 
    if (top<SIZE)
    {
        top++;
        stack[top] = x;  
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
                x=stack[top];
                top--;
          }
          return(x);

}
int main()
{
    int a[2][4] = {{10, 20, 30, 40}, {50, 60, 70, 80}};
    for(int i=0;i<2;i++)
    {
        for (int j=0;j<4;j++)
       {
          push(a[i][j]);
       }
    }
    
    for(int i=0;i<2;i++)
    {
        for (int j=0;j<4;j++)
       {
          printf("&a[%d][%d]:%p, a[%d][%d]:%d\n",i,j,&a[i][j],i,j,a[i][j])
          ;
       }
    }
    
    //display();*/
    return 0;
}