
// CPP program to illustrate
// working of Virtual Functions
#include<iostream>
using namespace std;
  
class base {
public:
    void fun_1() { cout << "base-1\n"; }
    virtual void fun_2() { cout << "base-2\n"; } // virtual function so late binding
    virtual void fun_3() { cout << "base-3\n"; }
    virtual void fun_4() { cout << "base-4\n"; }
    void fun_5() {cout <<"base-5\n";}
};
  
class derived : public base {
public:
    void fun_1() { cout << "derived-1\n"; } // method overridden 
    void fun_2() { cout << "derived-2\n"; }
    void fun_4(int x) { cout << "derived-4\n"; }
    void fun_5(int x) {cout << "derived-5\n";}
};
  
int main()
{
    base *p;
    derived obj1;
    p = &obj1;
  
    // Early binding because fun1() is non-virtual
    // in base
    p->fun_1();
  
    // Late binding (RTP)
    p->fun_2();
  
    // Late binding (RTP)
    p->fun_3();
  
    // Late binding (RTP)
    p->fun_4();
  
    // Early binding but this function call is
    // illegal (produces error) because pointer
    // is of base type and function is of
    // derived class
    // p->fun_4(5);
    
    // early binding 
    p->fun_5();

    // p->fun_5(5); produces error as compiler do not find function with similar signature 


    return 0;
}