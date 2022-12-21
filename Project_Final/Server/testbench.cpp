#include <bits/stdc++.h>
using namespace std;
#define PLATFORM_BIG_ENDIAN

void encoding_sw(string s1,vector<unsigned char> &output)
{
    //printf("match:%d\n",match);
    //static vector<unsigned char> output;
    static int last;
    int count=0;
    uint32_t header=0;
    unordered_map<string, int> table;
    uint16_t *lzw_out=(uint16_t*)malloc(sizeof(uint16_t)*10000);
    for (int i = 0; i <= 255; i++) {
        string ch = "";
        ch += char(i);
        table[ch] = i;
    }
    string p = "", c = "";
    p += s1[0];
    uint16_t code = 256;
    vector<int> output_code;
    //cout << "String\tOutput_Code\tAddition\n";
    //if(match==0)
    //{
        //cout<<"length:"<<s1.length()<<"\n"<<endl;
        for (unsigned int i = 0; i < s1.length(); i++) {
            if (i != s1.length() - 1)
                c += s1[i + 1];
            if ((table.find(p + c) != table.end()) /*&& i<s1.length()*/) {
                p = p + c;
             }
            else /*if(i<s1.length() && (table.find(p + c) == table.end()))*/{
                std::cout << p << "\t" << table[p] << "\t\t"
                 << p + c << "\t" << "code: "<<code <<"\t"<< endl;
                lzw_out[count++]=table[p];
                //cout<<"lzw_out:"<<lzw_out[count-1]<<"\n"<<endl;
                output_code.push_back(table[p]);
                //count++;
                table[p + c] = code;  
                //printf("code:%d \n",code); 
                code++;
                p = c;
            }
            c = "";
        }
        cout << p << "\t" << table[p] << endl;
        output_code.push_back(table[p]);
        lzw_out[count]=table[p];
        //cout<<"lzw_bouandary:"<<lzw_out[count]<<"\n"<<endl;
        lzw_out[s1.length()]=0;
        //lzw_out[count+1]=0;

       /*header=(((code-255)*13/8+1)<<1 | 0);
        cout<<"header:"<<header<<"\n"<<endl;
        output.push_back((header));//printf("header0:%d\n",output[output.size()-1]);
        output.push_back((header>>8));//printf("header1:%d\n",output[output.size()-1]);
        output.push_back((header>>16));//printf("header2:%d\n",output[output.size()-1]);
        output.push_back((header>>24));//printf("header3:%d\n",output[output.size()-1]);
        */

        for ( int i = 0; i < (count*13/8)+1/*(code-255)*13/8+1)*/; i++){
           switch(i%13){
            case 0:output.push_back((lzw_out[(i/13)*8+0]>>5)); break;
            case 1:output.push_back((lzw_out[(i/13)*8+0])<<3 | (lzw_out[(i/13)*8+1]>>10)); 
            break;    
            case 2:output.push_back((lzw_out[(i/13)*8+1]>>2)); break;
            case 3:output.push_back((lzw_out[(i/13)*8+1])<<6 | (lzw_out[(i/13)*8+2]>>7)); 
            break;   
            case 4:output.push_back((lzw_out[(i/13)*8+2]<<1) | (lzw_out[(i/13)*8+3]>>12)); 
            break;
            case 5:output.push_back((lzw_out[(i/13)*8+3])>>4  );
            break;    
            case 6:output.push_back((lzw_out[(i/13)*8+3]<<4)| (lzw_out[(i/13)*8+4]>>9)); 
            break;
            case 7:output.push_back((lzw_out[(i/13)*8+4])>>1);  break;     
            case 8:output.push_back((lzw_out[(i/13)*8+4]<<7)| (lzw_out[(i/13)*8+5]>>6)); 
            break;
            case 9:output.push_back((lzw_out[(i/13)*8+5])<<2 | (lzw_out[(i/13)*8+6]>>11)); 
            break;   
            case 10:output.push_back((lzw_out[(i/13)*8+6]>>3)); break;
            case 11:output.push_back(((lzw_out[(i/13)*8+6])<<5 | (lzw_out[(i/13)*8+7]>>8))); 
            break;
            case 12:output.push_back((lzw_out[(i/13)*8+7]));
            break;    
            }
            
        }
       //cout<<"string length:"<<s1.length()<<"\n"<<endl;
       //cout<<"code length:"<<count<<"\n"<<endl;
       //cout<<"output size:"<<output.size()<<"\n"<<endl;
        //last=output.size();
        
    
}



void decoding(vector<int> op)
{
    cout << "\nDecoding\n";
    unordered_map<int, string> table;
    for (int i = 0; i <= 255; i++) {
        string ch = "";
        ch += char(i);
        table[i] = ch;
    }
    int old = op[0], n;
    string s = table[old];
    string c = "";
    c += s[0];
    cout << s;
    int count = 256;
    for (int i = 0; i < op.size() - 1; i++) {
        n = op[i + 1];
        if (table.find(n) == table.end()) {
            s = table[old];
            s = s + c;
        }
        else {
            s = table[n];
        }
        cout << s;
        c = "";
        c += s[0];
        table[count] = table[old] + c;
        count++;
        old = n;
    }
}
uint64_t murmur_hash_64(const void * key, int len, uint64_t seed)
{
    const uint64_t m = 0xc6a4a7935bd1e995ULL;
    const int r = 47;

    uint64_t h = seed ^ (len * m);

    const uint64_t * data = (const uint64_t *)key;
    const uint64_t * end = data + (len / 8);

    while (data != end)
    {
#ifdef PLATFORM_BIG_ENDIAN
        uint64_t k = *data++;
        char *p = (char *)&k;
        char c;
        c = p[0]; p[0] = p[7]; p[7] = c;
        c = p[1]; p[1] = p[6]; p[6] = c;
        c = p[2]; p[2] = p[5]; p[5] = c;
        c = p[3]; p[3] = p[4]; p[4] = c;
#else
        uint64_t k = *data++;
#endif

        k *= m;
        k ^= k >> r;
        k *= m;

        h ^= k;
        h *= m;
    }

    const unsigned char * data2 = (const unsigned char*)data;

    switch (len & 7)
    {
    case 7: h ^= uint64_t(data2[6]) << 48;
    case 6: h ^= uint64_t(data2[5]) << 40;
    case 5: h ^= uint64_t(data2[4]) << 32;
    case 4: h ^= uint64_t(data2[3]) << 24;
    case 3: h ^= uint64_t(data2[2]) << 16;
    case 2: h ^= uint64_t(data2[1]) << 8;
    case 1: h ^= uint64_t(data2[0]);
        h *= m;
    };

    h ^= h >> r;
    h *= m;
    h ^= h >> r;

    return h;
}



void encoding(unsigned char *buff,int *length,uint8_t *output)
{
    //cout << "encoding test" <<endl;
    uint16_t c_flag=0;
    uint16_t p_low=0;
    uint16_t p_high=0;//string p = "", c = "";p += s1[0];
    //int16_t temp[8192];
    int16_t lzw_out[8192]; //(int16_t*)malloc(sizeof(uint16_t)*8192);
    unsigned int table[8192];
    uint16_t out_length=0;
    //uint32_t header=0;
    for (int i = 0; i <= 255; i++) {
	//#pragma HLS unroll  
        table[i]=murmur_hash_64(&(i),1,67);
    }
    uint16_t code = 256;
    unsigned int pc_hash=0;
    unsigned int p_hash=0;
        for ( int i = 0; i <length[0]; i++) {
		//#pragma HLS pipeline
            bool match=0; 
            int location=0;
            
            if (i != (length[0] - 1) ) {
                c_flag++; //c += s1[i + 1];
            }
            for(int x=0;x<code;x++){ 
                pc_hash=murmur_hash_64(buff+p_low,c_flag-p_low+1,67);//+MurmurHash2(buff+c_flag,1,2);
                //p_hash=MurmurHash2(buff+p_low,p_high-p_low+1,2);
               // cout << " p_hash " << p_hash << endl;
                //cout << " pc_hash " << pc_hash << endl;              
               if (pc_hash == table[x]) {
                 //if ((table.find(p + c) != table.end())
                  match=1; 
                  break;      
                  }         
            }
           // printf("match:%d\n",match);
                if(match){
                 if(i != (length[0] - 1))
                   p_high=c_flag;
                }
                else{    
                    p_hash=murmur_hash_64(buff+p_low,p_high-p_low+1,67);
                    for(int x=0;x<code;x++){ 
                        if( p_hash==table[x])
                            location=x;                   
                    }
                    lzw_out[out_length]=location;
                    table[code]=pc_hash;  //table[p + c] = code; 
                    for(int j=0;j<p_high-p_low+1;j++)
                       printf("%c",buff[p_low+j]);
                    printf("\n");
                    cout <<  "lzw_code:\t" << lzw_out[out_length] << "\t"<<"p_hash:"<<p_hash<<"\t"
                    <<"code:"<<code<<"\tpc_hash:"<<"\t"<<pc_hash<<"\n\n"<<endl;
                    code++;//code++;
                    p_high=c_flag;//p = c;
                    p_low=c_flag;
                    
                    out_length++;
                    //c = "";
                }
                
        }
         printf("code:%d\n",code);
        unsigned int last_hash=murmur_hash_64(buff+p_low,p_high-p_low+1,67);
        cout << " last_hash " << last_hash << endl;
        int t=0;
        while(last_hash!=table[t++]) ;
        lzw_out[out_length]=t-1;  //lzw_out[count]=table[p]; 
        for(int j=0;j<p_high-p_low+1;j++)
                       printf("%c",buff[p_low+j]);
                    printf("\t");
        cout <<  "lzw_code:\t" << lzw_out[out_length] <<endl;
        lzw_out[++out_length]=0;//lzw_out[++count]=0;
        
        /*header=(((out_length*13/8)+1)<<1 | 0);// header=(((count*13/8)+1)<<1 | 0);
        printf("header:%d\n",header);
        output[0]=(header);
        output[1]=((header>>8));
        output[2]=((header>>16));
        output[3]=((header>>24));*/

        for ( int i = 0; i < (out_length*13/8)+1; i++){
			//#pragma HLS unroll
            //printf("i:%d\n",i);
           switch(i%13){
            case 0:output[i]=((lzw_out[(i/13)*8+0]>>5));  
           // printf("%d\n",lzw_out[(i/13)*8+0]);
            break;   
            case 1:output[i]=((lzw_out[(i/13)*8+0])<<3 | (lzw_out[(i/13)*8+1]>>10)); 
            //printf("%d,%d\n",lzw_out[(i/13)*8+0],lzw_out[(i/13)*8+1]);
            break;    
            case 2:output[i]=((lzw_out[(i/13)*8+1]>>2)); 
           // printf("%d,%d\n",lzw_out[(i/13)*8+1]>>2,output[i+4]);
            break;
            case 3:output[i]=( (lzw_out[(i/13)*8+1]<<6) | (lzw_out[(i/13)*8+2]>>7) ); 
            //printf("%d,%d\n",(unsigned char)(lzw_out[(i/13)*8+1]<<6),lzw_out[(i/13)*8+2]>>7);
           // cout<<output[i+4]<<endl;
            break;   
            case 4:output[i]=((lzw_out[(i/13)*8+2]<<1) | (lzw_out[(i/13)*8+3]>>12)); 
           // printf("%d,%d\n",lzw_out[(i/13)*8+2],lzw_out[(i/13)*8+3]);
            break;
            case 5:output[i]=((lzw_out[(i/13)*8+3])>>4  );
            //printf("%d\n",lzw_out[(i/13)*8+3]);
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
       length[1]=(out_length*13/8)+1;
       cout<<"string length:"<<length[0]<<"\n"<<endl;
       cout<<"code length:"<<out_length<<"\n"<<endl;
       cout<<"output size:"<<length[1]<<"\n"<<endl;
    
}
 /*
 void encoding(unsigned char *buff,int length[],unsigned char *output)
{
    //cout << "encoding test" <<endl;
    uint16_t c_flag=0;
    uint16_t p_low=0;
    uint16_t p_high=0;//string p = "", c = "";p += s1[0];
    //int16_t temp[8192];
    int16_t lzw_out[8192]; //(int16_t*)malloc(sizeof(uint16_t)*8192);
    unsigned int table[8192];
    uint16_t out_length=0;
    uint32_t header=0;
    for (int i = 0; i <= 255; i++) {
	//#pragma HLS unroll  
        table[i]=MurmurHash2(&(i),1,2);
    }
    uint16_t code = 256;
    unsigned int new_hash;
    unsigned char new_key[8192];
        for ( int i = 0; i < length[0]; i++) {
	//	#pragma HLS pipeline
            bool match=0; 
            int location;
            
            new_hash=MurmurHash2(buff+p_low,c_flag-p_low+1,2);
            
            if (i != (length[0] - 1) ) {
                c_flag++; //c += s1[i + 1];
            }
            new_hash=MurmurHash2(buff+p_low,c_flag-p_low+1,2);
            //printf("p+c: ");
            //for (unsigned int i = p_low; i < c_flag-p_low + 1; i++){
             //printf(*(buff+i));
            //} 
            //printf("\n");
            //new_hash=MurmurHash2(buff+p_low,c_flag-p_low,2);
            //fill(new_key,new_key+8192,0);
            cout << " new_hash " << new_hash << endl;
            //cout << "code " << code << endl;
            for(int x=0;x < code;x++){
                //cout <<"  table.find  " << table[x] << endl;
               if (new_hash == table[x])  {  //if ((table.find(p + c) != table.end())
                  match=1;
                  location=x;
                break;
               }
            }
            printf("match:%d\n",match);
                if(match==0){ //if p+c is in the string table 
                 p_high++; // p = p+c
                }
                
                else{   // if p+c is not in the string table 
                    lzw_out[out_length]=location; //output the code for p
                    cout << "location " << location << endl;
			
		    //add P+c to the string table	                    
                    table[code]=new_hash;  //table[p + c] = code; 
                    printf("code:%d\n",code);
                    
                    code++;//code++;
                    
                    p_high=c_flag;//p = c;
                    p_low=c_flag;
                    
                    cout <<  "lzw_code:\t" << lzw_out[out_length] << "\t"<<endl;
                    out_length++;
                    
                    
            //c = "";
                }
            
        }
        cout << "code " << code << endl; 
        lzw_out[out_length-1]=code-1;  //lzw_out[count]=table[p];
        cout << "out_length "<<out_length << endl; 
        lzw_out[length[0]]=0;//lzw_out[++count]=0;
        //cout << "length " << length << endl;
        
        header=((((code-256)*13/8)+1)<<1 | 0);// header=(((count*13/8)+1)<<1 | 0);
        printf("header:%d\n",header);
        output[0]=(header);
        output[1]=((header>>8));
        output[2]=((header>>16));
        output[3]=((header>>24));

        for ( int i = 0; i < (out_length*13/8)+1; i++){
			//#pragma HLS unroll
           switch(i%13){
            case 0:output[i+4]=((lzw_out[(i/13)*8+0]>>5)); break;
            case 1:output[i+4]=((lzw_out[(i/13)*8+0])<<3 | (lzw_out[(i/13)*8+1]>>10)); 
            break;    
            case 2:output[i+4]=((lzw_out[(i/13)*8+1]>>2)); break;
            case 3:output[i+4]=((lzw_out[(i/13)*8+1])<<6 | (lzw_out[(i/13)*8+2]>>7)); 
            break;   
            case 4:output[i+4]=((lzw_out[(i/13)*8+2]<<1) | (lzw_out[(i/13)*8+3]>>12)); 
            break;
            case 5:output[i+4]=((lzw_out[(i/13)*8+3])>>4  );
            break;    
            case 6:output[i+4]=((lzw_out[(i/13)*8+3]<<4)| (lzw_out[(i/13)*8+4]>>9)); 
            break;
            case 7:output[i+4]=((lzw_out[(i/13)*8+4])>>1);  break;     
            case 8:output[i+4]=((lzw_out[(i/13)*8+4]<<7)| (lzw_out[(i/13)*8+5]>>6)); 
            break;
            case 9:output[i+4]=((lzw_out[(i/13)*8+5])<<2 | (lzw_out[(i/13)*8+6]>>11)); 
            break;   
            case 10:output[i+4]=((lzw_out[(i/13)*8+6]>>3)); break;
            case 11:output[i+4]=(((lzw_out[(i/13)*8+6])<<5 | (lzw_out[(i/13)*8+7]>>8))); 
            break;
            case 12:output[i+4]=((lzw_out[(i/13)*8+7]));
            break;    
            }
            
        }
        length[1] = (out_length*12/8) + 1;
      // cout<<"string length:"<<s1.length()<<"\n"<<endl;
      // cout<<"code length:"<<count<<"\n"<<endl;
      // cout<<"output size:"<<output.size()<<"\n"<<endl;
    
}
 */

int main()
{
 
    //unsigned char *ch=(unsigned char *)malloc(sizeof(unsigned char)*8192);
    unsigned char ch[18]={'W','Y','S','*','W','Y','G','W','Y','S','*','W','Y','S','W','Y','S','G'};
    int io_length[2]={18,0};
    //string s="";
    //cout << "init_begin \n" << endl;
    //string s="TheLittlePrince Chapte rIOncewhejfowjfopwjf wpejfpowjfpo24fj pojfdopwjfop2 mjopewjfpf pjdpowjfpo2fj pofmn2opfjo2pfj pjnopwjfpo3f nIwa ssixyearsoldIsaw amagnificentpi llllll llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllctureinabookBoa";
    for(int i=0;i<18;i++)
     {
        //ch[i]= char(97); 
        printf("ch:%c",ch[i]);
     } 
     printf("\n");
     
     string str="";
     for(int j=0;j<18;j++){
	    str=str+string(1,ch[j]);
	    cout << str[j] ;
     }
     cout << endl;
     
    vector<unsigned char> output_sw;
    unsigned char *output=(unsigned char*)malloc(sizeof(unsigned char)*8192);
    //cout << "malloc test" << endl; 
    
    encoding_sw(str,output_sw);
    encoding(ch,io_length,output);
   
    bool result=1;
    //cout << output_code.size() << endl;
    for(int i = 0; i < output_sw.size(); i++) {
        printf("hw:%x,sw:%x\n",output[i],output_sw[i]);
       if(output[i]!=output_sw[i]){
         cout<<"err location"<<i<<"\n"<<endl;
         result=0;
         //break;
       }
       
    }
     if(result) cout<<"test passed"<<endl;
    //cout << endl;
    //decoding(output_code);
    //free(ch);
    free(output);
}
