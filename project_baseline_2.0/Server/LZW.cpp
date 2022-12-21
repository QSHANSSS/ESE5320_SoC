#include <bits/stdc++.h>
#include <string>
#include <math.h>
//#include "encoder.h"
using namespace std;

 void encoding(string s1,vector<unsigned char> &output)
{
    //printf("match:%d\n",match);
    //static vector<unsigned char> output;
    static int last=0;
    int count=0;
    uint32_t header=0;
    unordered_map<string, int> table;
    int16_t *lzw_out=(int16_t*)malloc(sizeof(uint16_t)*8192);
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
               // cout << p << "\t" << table[p] << "\t\t"
                //    << p + c << "\t" << code <<"\t"<< endl;
                lzw_out[count++]=table[p];
                //cout<<"lzw_out:"<<lzw_out[count-1]<<"\n"<<endl;
                output_code.push_back(table[p]);
                //count++;
                table[p + c] = code;   
                code++;
                p = c;
            }
            c = "";
        }
        //cout << p << "\t" << table[p] << endl;
        output_code.push_back(table[p]);
        lzw_out[count]=table[p];
        //cout<<"lzw_bouandary:"<<lzw_out[count]<<"\n"<<endl;
        lzw_out[++count]=0;

        header=(((count*13/8)+1)<<1 | 0);
        output.push_back((unsigned char)(header));
        output.push_back((unsigned char)(header>>8));
        output.push_back((unsigned char)(header>>16));
        output.push_back((unsigned char)(header>>24));

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
       cout<<"string length:"<<s1.length()<<"\n"<<endl;
       cout<<"code length:"<<count<<"\n"<<endl;
       cout<<"output size:"<<output.size()<<"\n"<<endl;
        //last=output.size();
        
  
    
    /*header=(output.size()<<1 | 0);
    FILE *outfd = fopen("output_compressed.bin", "ab");//int bytes_written=0;
	int bytes_written = fwrite((unsigned char *)&header, 1, sizeof(header), outfd);
	printf("write file with %d\n", bytes_written);
    fclose(outfd);

    FILE *outfd2 = fopen("output_compressed.bin", "ab");//int bytes_written=0;
    int bytes_written_2= fwrite(&output[0], 1, (count*13/8)+1, outfd);
	printf("write file with %d\n", bytes_written_2);
	fclose(outfd2);*/
    //}
    
    /*else 
    {
         header=(match<<1 | 1);
        output.push_back((unsigned char)(header));
        output.push_back((unsigned char)(header>>8));
        output.push_back((unsigned char)(header>>16));
        output.push_back((unsigned char)(header>>24));
        FILE *outfd = fopen("output_compressed.bin", "ab");
	    int bytes_written = fwrite((unsigned char *)&header, 1, sizeof(header), outfd);
	    printf("write file with %d\n", bytes_written);
	    fclose(outfd);*/
        
    //}
    
    //return output;
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
