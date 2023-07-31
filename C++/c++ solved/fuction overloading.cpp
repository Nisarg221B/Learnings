//
//  fuction overloading.cpp
//  C++ learning
//
//  Created by Nisarg on 10/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.

// using fuction with same name just different data type

#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;
void printnumber(int x){
    cout<<"i am printing an integer "<<x<<endl;
}
void printnumber(float x){
    cout<<"now i am printing a float "<<x<<endl;
}
int main()
{
    int a= 55;
    float b= 33.333;
    printnumber(a);
    printnumber(b);
}
