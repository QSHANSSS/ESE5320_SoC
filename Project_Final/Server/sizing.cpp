#include <bits/stdc++.h>
using namespace std;
void sizing(uint16_t *lzw_out,unsigned char *output,int out_length)
{
    // lzw_out[out_length]=0;
    // lzw_out[out_length+1]=0;
    // lzw_out[out_length+2]=0;
        // for(int j=0;j<out_length;j++)
        // {
        //     if(lzw_out[j]>255) 
        //         lzw_out[j]=lzw_out[j]-22735;
        // }
    // for(int j=0;j<out_length;j++){	
	// 			printf("lzw_code2[%d]:%d\n",j,lzw_out[j]);
	// 	    }
     for ( int i = 0; i < (out_length*13/8)+1; i++){
           switch(i%13){
            case 0:output[i]=((lzw_out[(i/13)*8+0]>>5));
            /*if (i==0) {
            	printf("%d\n",lzw_out[(i/13)*8+0]>>5);
                printf("%d\n",output[i]);}*/
            break;
            case 1:output[i]=((lzw_out[(i/13)*8+0])<<3 | (lzw_out[(i/13)*8+1]>>10)); 
            //printf("%d,%d\n",lzw_out[(i/13)*8+0]<<3,lzw_out[(i/13)*8+1]>>10);
           // cout<<output[i]<<endl;
            break;    
            case 2:output[i]=((lzw_out[(i/13)*8+1]>>2));
           // printf("%d\n",lzw_out[(i/13)*8+1]>>2);
           // cout<<output[i]<<endl;
            break;
            case 3:output[i]=( (lzw_out[(i/13)*8+1]<<6) | (lzw_out[(i/13)*8+2]>>7) );
           // printf("%d,%d\n",(unsigned char)(lzw_out[(i/13)*8+1]<<6),lzw_out[(i/13)*8+2]>>7);
            // cout<<output[i]<<endl;
            break;   
            case 4:output[i]=((lzw_out[(i/13)*8+2]<<1) | (lzw_out[(i/13)*8+3]>>12)); 
           // printf("%d,%d\n",lzw_out[(i/13)*8+2],lzw_out[(i/13)*8+3]);
            break;
            case 5:output[i]=((lzw_out[(i/13)*8+3])>>4  );
            break;    
            case 6:output[i]=((lzw_out[(i/13)*8+3]<<4)| (lzw_out[(i/13)*8+4]>>9)); 
            break;
            case 7:output[i]=((lzw_out[(i/13)*8+4])>>1);  break;     
            case 8:output[i]=((lzw_out[(i/13)*8+4]<<7)| (lzw_out[(i/13)*8+5]>>6)); 
            break;
            case 9:output[i]=((lzw_out[(i/13)*8+5])<<2 | (lzw_out[(i/13)*8+6]>>11)); 
            break;   
            case 10:output[i]=((lzw_out[(i/13)*8+6]>>3)); break;
            case 11:output[i]=(((lzw_out[(i/13)*8+6])<<5 | (lzw_out[(i/13)*8+7]>>8))); 
            break;
            case 12:output[i]=((lzw_out[(i/13)*8+7]));
            break;    
            }

        }
}