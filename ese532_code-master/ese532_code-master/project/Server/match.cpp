#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include "stopwatch.h"
#include "encoder.h"

void match(unsigned char *chunk_hash)
{
for(int i=0; i<chunk; i++)
{
	if (chunk_match[i]==0)
          {
		for (int j=1; j<chunk-i ;j++)
		{
			if (chunk_hash[i]==chunk_hash[i+j])
                              {
                                        chunk_match[i+j]=i;	
                              }
                    }        
          }
}
}
