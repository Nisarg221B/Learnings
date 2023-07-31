//
//  array introduction.cpp
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
    int a[5] = {63,54,84,66,44};//array intializer list
            //  0  1  2  3  4
    cout << "value ---- element number"<<endl;
    
    for(int x=0; x<=4 ; x++){
        cout<< a[x] <<"    ----" << x+1 <<endl;
    }
}
