#include <stdlib.h>
#include <stdio.h>
#define SIZE 11
int top=-1; 
int **stack[SIZE];
int *temp[SIZE];
int a[2][4] = {{10, 20, 30, 40}, {50, 60, 70, 80}};
void display()
{
        for (int j=0;j<SIZE;j++)
       {
          int output;
          printf("%p:",*stack[top]);
          output=pop();
          if(top<2) 
             printf("%p\n",output);
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
          temp[top]= &a[i][j];
          stack[top]=&temp[top];
        }
      }      
    }
    else printf("stack overflow!");   
}
int pop( )
{
    int x;
         if(top<0)
         {
                printf("stack is empty\n");
                return 0; 
         }
         else
         {    
                x=**stack[top];
                top--;
          }
        return(x);
}
int main()
{
    if(top<2)
          {
            top++;
            stack[top++]=&stack[1];
            stack[top++]=&stack[3];
            stack[top]=&stack[7];        
          }
         push();
         display();
    return 0;
}