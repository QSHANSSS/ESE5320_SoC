#include <bits/stdc++.h>
#include "encoder.h"
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




int main()
{
 
    //unsigned char *ch=(unsigned char *)malloc(sizeof(unsigned char)*8192);
    unsigned char ch[18]={'W','Y','S','*','W','Y','G','W','Y','S','*','W','Y','S','W','Y','S','G'};
    int *input_length=(int *)malloc(sizeof(int)*2);
    input_length[0]=18;
    int *output_length=(int *)malloc(sizeof(int)*2);
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

    encoding(ch,input_length,output,output_length);
   
    bool result=1;
    //cout << output_code.size() << endl;
    for(int i = 0; i < output_length[0]; i++) {
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
