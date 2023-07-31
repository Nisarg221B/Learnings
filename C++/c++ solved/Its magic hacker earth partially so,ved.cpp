/*
// Sample code to perform I/O:

cin >> name;                            // Reading input from STDIN
cout << "Hi, " << name << ".\n";        // Writing output to STDOUT

// Warning: Printing unwanted or ill-formatted data to output will cause the test cases to fail
*/

// Write your code here
#include<iostream>
#include<string>
using namespace std;
int main(){
    int t,n,i,count;
    string s;
    while(t--){
       count =0;
       cin >> n ;
       cin >> s;
       for(i=1;i<n;i++){
           if(s[i]=='a'||s[i]=='e'||s[i]=='i'||s[i]=='o'||s[i]=='u'){
               if (s[i-1]!='a'&& s[i-1]!='e'&& s[i-1]!='i'&& s[i-1]!='o'&& s[i-1]!='u' {
                   count++;
               }
           }
       }
       cout << count << endl;
    }
}
