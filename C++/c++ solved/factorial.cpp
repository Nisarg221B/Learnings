//
//  factorial.cpp
//  C++ learning
//
//  Created by Nisarg on 10/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//recursive funtions

#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int factorial(int x){
    if(x==1 || x==0){
        return 1;
    }
    else{
        return x*factorial(x-1);
    }
}
int main()
{
    cout<< factorial(5)<<endl;
}
