//
//  inheritance basics.cpp
//  C++ learning
//
//  Created by Nisarg on 19/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <stdio.h>
#include<iostream>
using namespace std;

class mother{
public:
    mother(){
        cout<<"I am mother constructor"<<endl;
    }
    void sayname(){
        std::cout<<"i am Harsha"<<endl;
    }
    ~mother(){
        cout <<"Iam mother deconstructor"<<endl;
    }
    
};

class daughter  /*inherited class */ : public mother //base class
{
public:
    daughter(){
        cout<<"i am daughter constructor"<<endl;
    }
    ~daughter(){
        cout<<"I am daughter deconstructor"<<endl;
    }
    
};

int main(){
    
 
    daughter tina;
    tina.sayname();
    
}
    
