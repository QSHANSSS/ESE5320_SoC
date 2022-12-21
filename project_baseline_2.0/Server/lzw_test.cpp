#include <bits/stdc++.h>
using namespace std;

vector<unsigned char> encoding(string s1,int match,int index,vector<unsigned char> output)
{

    cout << "Encoding\n";
    static int last=0;
    int count;
    unordered_map<string, int> table;
    uint16_t *lzw_out=(uint16_t*)malloc(sizeof(uint16_t)*8192);
    for (int i = 0; i <= 255; i++) {
        string ch = "";
        ch += char(i);
        table[ch] = i;
        //lzw_out[i]=i;
    }
    string p = "", c = "";
    p += s1[0];
    uint16_t code = 256;
    uint16_t last_code=0;
    vector<int> output_code;
    cout << "String\tOutput_Code\tAddition\n";
    if(match==0)
    {
        //int table_count=0;
        uint32_t header=0;
        /*header=(s1.length()<<1 | 0);
        //cout <<"header:\n"<<header<<endl;
        output.push_back(char(header));
        output.push_back(char(header>>8));
        output.push_back(char(header>>16));
        output.push_back(char(header>>24));*/
        for (unsigned int i = 0; i < s1.length(); i++) {
            if (i != s1.length() - 1)
                c += s1[i + 1];
            if ((table.find(p + c) != table.end()) /*&& i<s1.length()*/) {
                p = p + c;
                //lzw_out[i]=table[p];
             }
            else /*if(i<s1.length() && (table.find(p + c) == table.end()))*/{
                cout << p << "\t" << table[p] << "\t\t"
                    << p + c << "\t" << code << endl;
                lzw_out[count]=table[p];
                cout<<"lzw_out:"<<lzw_out[count]<<"\n"<<endl;
                output_code.push_back(table[p]);
                count++;
                table[p + c] = code;
                
               
                code++;
                p = c;

            }//uint8_t j=0;
            c = "";
        }
       cout << p << "\t" << table[p] << endl;
        output_code.push_back(table[p]);
        lzw_out[count]=table[p];
        cout<<"lzw_out:"<<lzw_out[count]<<"\n"<<endl;
        count++;
        cout<<"count:"<<count<<"\n"<<endl;
        for (unsigned int i = 0; i < (count*13/8+1); i++){
            printf("index:%d\n",(i/13)*8+i);
           switch(i%13){
            case 0:output.push_back((unsigned char)(lzw_out[(i/13)*8+0]>>5)); break;
            case 1:output.push_back((unsigned char)(lzw_out[(i/13)*8+0])<<3 | (unsigned char)(lzw_out[(i/13)*8+1]>>10)); 
            break;    
            case 2:output.push_back((unsigned char)(lzw_out[(i/13)*8+1]>>2)); break;
            case 3:output.push_back((unsigned char)(lzw_out[(i/13)*8+1])<<6 | (unsigned char)(lzw_out[(i/13)*8+2]>>7)); 
            break;   
            case 4:output.push_back((unsigned char)(lzw_out[(i/13)*8+2]<<1) | (unsigned char)(lzw_out[(i/13)*8+3]>>12)); 
            break;
            case 5:output.push_back((unsigned char)(lzw_out[(i/13)*8+3])<<4 ); break;    
            case 6:output.push_back((unsigned char)(lzw_out[(i/13)*8+3]<<4)| (unsigned char)(lzw_out[(i/13)*8+4]>>9)); 
            break;
            case 7:output.push_back((unsigned char)(lzw_out[(i/13)*8+4])>>1);  break;     
            case 8:output.push_back((unsigned char)(lzw_out[(i/13)*8+4]<<7)| (unsigned char)(lzw_out[(i/13)*8+5]>>6)); 
            break;
            case 9:output.push_back((unsigned char)(lzw_out[(i/13)*8+5])<<2 | (unsigned char)(lzw_out[(i/13)*8+6]>>11)); 
            break;   
            case 10:output.push_back((unsigned char)(lzw_out[(i/13)*8+6]>>3)); break;
            case 11:output.push_back((unsigned char)(lzw_out[(i/13)*8+6])<<5 | (unsigned char)(lzw_out[(i/13)*8+7]>>8)); 
            break;
            case 12:output.push_back((unsigned char)(lzw_out[(i/13)*8+7]));
            break;    
            }
            cout<<"string length:"<<s1.length()<<"\n"<<endl;
           // cout<<"code length:"<<sizeof(lzw_out)<<"\n"<<endl;
           // cout<<"output size:"<<output.size()-last<<"\n"<<endl;
            last=output.size();
        }
#ifdef shift
    //std::vector<unsigned char> compressed_r; 
    //u_int16_t output_code[1]={8191};
    int count = 0;
    int count_1 = 1;
    int count_2 = 1;
    u_int16_t temp = lzw_out[0];
    //cout<<"temp:"<<lzw_out[0]<<endl;
    u_int8_t compressed_code = 0;
        while( true)
        {
            int i=0;
            if (count_1==14)
        {
            count ++;
            if (count==s1.length()+1)
            {
                if (compressed_code != 0)
                {
                    compressed_code = compressed_code << (8-count_2+1);
                    output.push_back(char(compressed_code));
                
                }break;
            }
            count_1=1;
            temp=lzw_out[count];
        }

        if (count_2==9)
        {
            count_2=1;
            output.push_back(char(compressed_code));
            compressed_code=0;
        }

        if (temp%2 == 1)
        {
             //printf("%u ",compressed_code);
             compressed_code = compressed_code + pow(2, (count_2-1)); 
        }
          temp = temp >> 1;
        //printf("%u ",count_1);
        //printf("%u ",count_2);
        //printf("%u ",compressed_code);
        //printf("%u\n",temp);

          count_1++;
          count_2++;
        }
        
#endif      
    }
    
    else 
    {
        uint32_t header=(index<<1 | 1);
        output.push_back(char(header));
        output.push_back(char(header>>8));
        output.push_back(char(header>>16));
        output.push_back(char(header>>24));
    }
    for (int i = 0; i < output.size(); i++) {
		    printf("output[%d]:%u\n",i,output[i]);
	    }  
         return output;    
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
int main()
{
 
    char *ch=(char *)malloc(sizeof(char)*256);
    //string s="";
    
    //string s="TheLittlePrince Chapte rIOncewhejfowjfopwjf wpejfpowjfpo24fj pojfdopwjfop2 mjopewjfpf pjdpowjfpo2fj pofmn2opfjo2pfj pjnopwjfpo3f nIwa ssixyearsoldIsaw amagnificentpi llllll llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllctureinabookBoa";
    for(int i=0;i<=255;i++)
     {
        ch[i]= char(i);
        //cout << ch[i] << endl;
       //s=s+string(1,ch[i]);
     } 
    string str="abcdefghij";
    //str=ch[0];
    vector<unsigned char> output;
    vector<unsigned char> output_code = encoding(str,0,0,output);
    uint32_t header=output_code.size();
    header=header<<1;
    FILE *outfd = fopen("output_test.bin", "ab");
    int bytes_written = fwrite((unsigned char *)&header, 1, 4, outfd);
    printf("write file with %d\n", (27/13)*8);
    int bytes_written2 = fwrite(&output_code[0], 1, output_code.size(), outfd);
	printf("write file with %d\n", bytes_written2);
	fclose(outfd);
    //cout << output_code.size() << endl;
    //for (int i = 0; i < output_code.size(); i++) {
      //  cout << output_code[i] << " ";
   // }
    //cout << endl;
    //decoding(output_code);
   // free(ch);
}