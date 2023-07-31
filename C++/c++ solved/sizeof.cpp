//
//  sizeof.cpp
//  C++ learning
//
//  Created by Nisarg on 10/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;
void passbyvalue(int x);
void passbyreference(int *x);
int main ()
{
    double c[9];
    cout << sizeof(c)<<endl;
    cout << sizeof(c)/sizeof(c[0])<<endl;
}
