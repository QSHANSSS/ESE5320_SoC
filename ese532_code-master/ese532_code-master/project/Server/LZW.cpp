#include <bits/stdc++.h>
#include <string>
#include "encoder.h"
using namespace std;
string UCharToString(unsigned char p)
{
 
 string str="";
 str+=p;
 return str;
 
}

vector<int> encoding(unsigned char * buff,int *chunk_match,vector<int> output_code)
{
    cout << "Encoding\n";
    chunk_match++;
    unordered_map<string, int> table;
    for (int i = 0; i <= 255; i++) {
        string ch = "";
        ch += char(i);
        table[ch] = i;
    }
    string s1;
    if(*chunk_match==0)
    {
       for(int i=0;i<sizeof(buff);i++)
            s1=s1+UCharToString(buff[i]);  

    string p = "", c = "";
    p += s1[0];
    int code = 256;
    vector<int> output_code;
    cout << "String\tOutput_Code\tAddition\n";
    for (int i = 0; i < s1.length(); i++) {
        if (i != s1.length() - 1)
            c += s1[i + 1];
        if (table.find(p + c) != table.end()) {
            p = p + c;
        }
        else {
            cout << p << "\t" << table[p] << "\t\t"
                 << p + c << "\t" << code << endl;
            output_code.push_back(table[p]);
            table[p + c] = code;
            code++;
            p = c;
        }
        c = "";
    }
    cout << p << "\t" << table[p] << endl;
    output_code.push_back(table[p]<<32 || (sizeof(buff))<<31 || (1<<0) );
    return output_code;
  }
  else
  {
    vector<int> output_code;
    output_code.push_back( (sizeof(buff)<<31) || (0<<0) );
  }
    

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
/*int main()
{
    unsigned char * s=(unsigned char *)malloc(sizeof(unsigned char)*20);
    *s= 'WYS*WYGWYS*WYSWYSG';
    vector<int> output_code = encoding(s);
    cout << "Output Codes are: ";
    for (int i = 0; i < output_code.size(); i++) {
        cout << output_code[i] << " ";
    }
    cout << endl;
    decoding(output_code);
}*/