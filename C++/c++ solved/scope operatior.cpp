//
//  scope operatior.cpp
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

int a = 2; // global varialbe (every single program has this variable
int main()
{
    double a = 3;
    cout << a << endl;
    cout << ::a << endl;// uninary scope operatior :: its for telling the computer to use globle variable.

    
}
