
// Sample code to perform I/O:
#include <stdio.h>

int main(){
    int num;
    scanf("%d", &num);                          // Reading input from STDIN
    printf("Input number is %d.\n", num);       // Writing output to STDOUT
}

// Warning: Printing unwanted or ill-formatted data to output will cause the test cases to fail
*/

// Write your code here
#include<iostream>
#include <string>
using namespace std;
int main(){
    string t;
    cin >> t ;
    int i,a=0,b=0;
    for (i=0 ; i< t.length() ; i++){
     if (t[i]== 'z'){
    a++;
    }
     else{
    b++;
    }
    }
    if(2*a==b){
        cout << "Yes" << endl;
    }
    else
    cout<< "No" << endl;
}
