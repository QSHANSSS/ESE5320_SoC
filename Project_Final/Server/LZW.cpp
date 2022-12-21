//#include <bits/stdc++.h>
//#include <string>
//#include <math.h>
#include <hls_stream.h>
//using namespace std;
#define PLATFORM_BIG_ENDIAN

unsigned long long murmur_hash_64(const unsigned char key[20], int len, unsigned long long seed)
{
    const unsigned long long m = 0xc6a4a7935bd1e995;
    const int r = 47;

    unsigned long long h = seed ^ (len * m);

     unsigned long long  data[20];
     unsigned long long end[20];

     for(int i=0;i<20;i++){
	 #pragma HLS unroll
    	 data[i]= (const unsigned long long )key[i];
    	 end[i]= data[i+len / 8];
     }
     int t=0;
    while (t<(len / 8 ))
    {
//#pragma HLS pipeline
#ifdef PLATFORM_BIG_ENDIAN
        unsigned long long k = data[t++];
        char p[7] ;
        p[0]= (char )k;p[1]= (char )(k>>8);
        p[2]= (char )(k>>16);p[3]= (char )(k>>24);
        p[4]= (char )(k>>32);p[5]= (char )(k>>40);
        p[6]= (char )(k>>48);p[7]= (char )(k>>56);
        char c;
        c = p[0]; p[0] = p[7]; p[7] = c;
        c = p[1]; p[1] = p[6]; p[6] = c;
        c = p[2]; p[2] = p[5]; p[5] = c;
        c = p[3]; p[3] = p[4]; p[4] = c;
#else
        unsigned long long k = data[t++];//unsigned long long k = *data++;
#endif

        k *= m;
        k ^= k >> r;
        k *= m;

        h ^= k;
        h *= m;
    }

    unsigned char data2[7];
    data2[0]= (const unsigned char)data[0];
    data2[1]= (const unsigned char)data[1];
    data2[2]= (const unsigned char)data[2];
    data2[3]= (const unsigned char)data[3];
    data2[4]= (const unsigned char)data[4];
    data2[5]= (const unsigned char)data[6];
    data2[6]= (const unsigned char)data[6];


    switch (len & 7)
    {
    case 7: h ^= (data2[6]) << 48;
    case 6: h ^= (unsigned long long)(data2[5]) << 40;
    case 5: h ^= (unsigned long long)(data2[4]) << 32;
    case 4: h ^= (unsigned long long)(data2[3]) << 24;
    case 3: h ^= (unsigned long long)(data2[2]) << 16;
    case 2: h ^= (unsigned long long)(data2[1]) << 8;
    case 1: h ^= (unsigned long long)(data2[0]);
        h *= m;
    };

    h ^= h >> r;
    h *= m;
    h ^= h >> r;

    return h;
}




void encoding(unsigned char *buff,int *input_length,unsigned char *output,int *output_length)
{
	//input_length[0]=0;
#pragma HLS INTERFACE m_axi     port=buff    offset=slave bundle=p0 depth=10000
#pragma HLS INTERFACE m_axi     port=input_length    offset=slave bundle=p1 depth=2
#pragma HLS INTERFACE m_axi     port=output   offset=slave bundle=p2 depth=10000
#pragma HLS INTERFACE m_axi     port=output_length    offset=slave bundle=p3 depth=2

    //cout << "encodding test" <<endl;
    unsigned int c_flag=0;
    unsigned int p_low=0;
    unsigned int p_high=0;//string p = "", c = "";p += s1[0];
    //int16_t temp[8192];
    unsigned int lzw_out[8192]; //(int16_t*)malloc(sizeof(unsigned int)*8192);
    unsigned long long  table[8192];
    unsigned int out_length=0;
    //uint32_t header=0;
    for (int i = 0; i <= 255; i++) {
	#pragma HLS unroll
    	unsigned char temp[1];
    	temp[0]=(unsigned char)(i);
        table[i]=murmur_hash_64(temp,1,67);
        //table[i]=hash_func(temp,1);
    }
    unsigned int code = 256;
    unsigned long long pc_hash=0;
    unsigned long long p_hash=0;
        for ( int i = 0; i <input_length[0]; i++) {
		#pragma HLS pipeline
            bool match=0;
            int location=0;

            if (i != (input_length[0] - 1) ) {
                c_flag++; //c += s1[i + 1];
            }
            pc_hash=murmur_hash_64(buff+p_low,c_flag-p_low+1,67);
            for(int x=0;x<code;x++){
			#pragma HLS pipeline
               // pc_hash=hash_func(buff+p_low,c_flag-p_low+1);

               if (pc_hash == table[x]) {   //if ((table.find(p + c) != table.end())
                  match=1;
                  break;
                  }
            }
           // printf("match:%d\n",match);
                if(match){
                 if(i != (input_length[0] - 1))
                   p_high=c_flag;
                }
                else{
                    p_hash=murmur_hash_64(buff+p_low,p_high-p_low+1,67);
                	//p_hash=hash_func(buff+p_low,p_high-p_low+1);
                    for(int x=0;x<code;x++){
                        if( p_hash==table[x])
                            location=x;
                    }
                    lzw_out[out_length]=location;
                    table[code]=pc_hash;  //table[p + c] = code;
                    //for(int j=0;j<p_high-p_low+1;j++)
                    //   printf("%c",buff[p_low+j]);
                   // printf("\n");
                    //cout <<  "lzw_code:\t" << lzw_out[out_length] << "\t"<<"p_hash:"<<p_hash<<"\t"
                   // <<"code:"<<code<<"\tpc_hash:"<<"\t"<<pc_hash<<"\n\n"<<endl;
                    code++;//code++;
                    p_high=c_flag;//p = c;
                    p_low=c_flag;

                    out_length++;
                    //c = "";
                }

        }
        //unsigned long long last_hash=hash_func(buff+p_low,p_high-p_low+1);
        unsigned long long last_hash=murmur_hash_64(buff+p_low,p_high-p_low+1,67);
       // cout << " last_hash " << last_hash << endl;

        int x=0;
        for(int t=0;t<code;t++){
		#pragma HLS unroll
                   if( last_hash==table[t]) x=t;
        }
        lzw_out[out_length]=x-1;  //lzw_out[count]=table[p];

       // for(int j=0;j<p_high-p_low+1;j++)
           //            printf("%c",buff[p_low+j]);
           //         printf("\t");
       // cout <<  "lzw_code:\t" << lzw_out[out_length] <
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
       output_length[0]=(out_length*13/8)+1;
       //cout<<"string length:"<<length[0]<<"\n"<<endl;
       //cout<<"code length:"<<out_length<<"\n"<<endl;
       //cout<<"output size:"<<length[1]<<"\n"<<endl;

}


