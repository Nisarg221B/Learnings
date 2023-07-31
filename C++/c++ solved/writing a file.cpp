//
//  writing a file.cpp
//  C++ learning
//
//  Created by Nisarg on 16/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

 
    int main() {
        string filename;
        cin>>filename;
        
        ofstream fout;
        fout.open(filename);//or fout.open("anything");
        if(fout.is_open()){
          cout<< "file is open "<<endl;
        }
        vector<string> names;
        names.push_back("Nisarg");
        names.push_back("patel");
        
        for(string name : names){
            fout<< name <<endl;
        }
        int age = 25;
        fout<< "I am "<< age <<endl;
    
        return 0;
    }

