//
//  String stream.cpp
//  C++ learning
//
//  Created by Nisarg on 17/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <sstream>
#include <vector>
#include <iostream>
using namespace std;

vector<int> parseInts(string str)
{
stringstream ss(str);
vector<int> out;
char ch;
int temp,count=0;
while(ss >> temp)
{
    count ++;
    ss >> ch;
}
for(i=0;i<count;i++){
        cin>>out[i]>>endl;
    }
return out;
}

int main() {
    string str;
    cin >> str;
    vector<int> integers = parseInts(str);
    for(int i = 0; i < integers.size(); i++) {
        cout << integers[i] << "\n";
    }
    
    return 0;
}




