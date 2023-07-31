//
//  pointers intro.cpp
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

int main ()
{
    int kkd = 8;
    cout << &kkd <<endl;
    
    int *lionpointer;
   
    lionpointer = &kkd;
    cout << lionpointer << endl;
}
