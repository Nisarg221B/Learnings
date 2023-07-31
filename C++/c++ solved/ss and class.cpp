//
//  ss and class.cpp
//  C++ learning
//
//  Created by Nisarg on 17/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <stdio.h>
#include <iostream>
#include <sstream>
#include <string>
using namespace std;

class Student {
    public:
    void set_age(int age){
        a = age;
    }
    int get_age(){
        return a;
    }
    void set_first_name(string x){
        f = x;
    }
    string get_first_name(){
        return f;
    }
    void set_standard(int standard){
        s = standard;
    }
    int get_standard(){
        return s;
    }
    void set_last_name(string last_name){
        l = last_name;
    }
    string get_last_name(){
        return l;
    }
    string to_string(){
        stringstream ss;
        string x,hm;
        char ch;
        ch=',';
        ss << a << ch << f << ch << l << ch << s;
        return ss.str() ;
    }
    private:
    int a,s;
    string f,l;

};
int main() {
    int age, standard;
    string first_name, last_name;
    
    cin >> age >> first_name >> last_name >> standard;
    
    Student st;
    st.set_age(age);
    st.set_standard(standard);
    st.set_first_name(first_name);
    st.set_last_name(last_name);
    
    cout << st.get_age() << "\n";
    cout << st.get_last_name() << ", " << st.get_first_name() << "\n";
    cout << st.get_standard() << "\n";
    cout << "\n";
    cout << st.to_string();
    
    return 0;
}

