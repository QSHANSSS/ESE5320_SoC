#include <stdlib.h>
#include <stdio.h>

int main()
{
  struct s2 {
            float a;
            int b;
          };

  struct s1 {
            int c;
            struct s2 **d;
          };
  struct s1 x[5]; 
  char *p;
  //*p=(&((*(x->d))->b))
    printf("%p",(&((*(x[2].d))->b)));

}