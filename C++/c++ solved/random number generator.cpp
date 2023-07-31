//
//  random number generator.cpp
//  C++ learning
//
//  Created by Nisarg on 10/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main()
{
    srand(time(0));
    for(int x=1;x<25;x++){
        cout<<1+(rand()%6)<<endl;
    
    }
}
