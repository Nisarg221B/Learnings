
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
    int t;
    string a,b;
    cin >> t ;
    while(t>0){
        int  i=0,j=0,count=0;
        cin >> a >> b;
        if (a.length()==b.length()){
            for(i=0;i<a.length();i++){
                for(j=0;j<b.length();j++){
                    if(a[i]==b[j]){
                        b[j]=0;
                        count++;
                        break;
                    }
                }
            }
        }
        else{
            cout << "NO" << endl;
        }
        if(count==a.length()){
            cout << "YES" << endl;
        }
        else{
            cout << "NO" << endl;
        }
        t--;
    }
}


