//
//  imp pointer.cpp
//  C++ learning
//
//  Created by Nisarg on 11/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//


#include <iostream>
#include <cstdio>
#include <stdio.h>
using namespace std;
void update(int *a,int *b) {
    int bn ,bx ;
    cout<<a<<endl;
    cout<<*a<<endl;
    }



int main() {
    int a, b;
    int *pa = &a, *pb = &b;
    cout<<pa<<endl;
    scanf("%d %d", &a, &b);
    cout<<pa<<endl;
    cout<<*pa<<endl;
    update(pa, pb);

    cout<<*pa<<endl;
    return 0;
}
