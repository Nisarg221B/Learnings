//
//  multidimensional vector.cpp
//  C++ learning
//
//  Created by Nisarg on 15/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <iostream>
#include <vector>
#include <iomanip>
#include <limits>

#include <cstdio>
#include <stdio.h>
using namespace std;

 
    int main() {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT */
        int n,q,k,i,j,m;
        cin>>n>>q;
        vector<vector<int> >a;

         for (i=0;i<n;i++){
             cin>>k;
             vector<int>b;
            
             for(j=0;j<k;j++){
                 cin>>m;
                 b.push_back(m);
             }
             a.push_back(b);
             b.clear();
         }
         for (;q>0;q--){
             cin>>i>>j;
             cout<<a[i][j]<<endl;
         }
        
    return 0;
    }
