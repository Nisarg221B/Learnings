#include<bits/stdc++.h>
using namespace std;
/*

const are used to create read only variables.

getlin(cin,s) is used to read the whole line in buffer in string s

a class is a blueprint for creating objects (a particular data structure), 
providing initial values for state (member variables or attributes), and 
implementations of behavior (member functions or methods).

Objects holds information about state(whats the characteristic) and behaviour(what object can do)
    eg : state :- a computer is either on or off , player has a name
    Behaviour :- actions the object can perform

Strive for low coupling and high cohesion
    cohesion :- grouping together the code which performs a single task
    coupling :- This means that one object doesn’t directly change or modify the state or behavior of another object. 

*/

/*
OOP

1. Encapsulation : its a mechanism which binds the data and its operation. it also
                    reduces the ability of an object to change the state and 
                   behaviour of other object or coupling. in c++ it is achieved through access specifiers.

2. Abstraction   : it is used to hide internal implementations and show only necessary details to the 
                   outside world , it is achieved through abstract classes and interface in c++.
                   here when we have multiple objects what we can do is abstract the common elements or 
                   qualities from all the objects into a more generalized class.

3. Inheritance   : it is used to inherit the properties of one class into another other.
                    private elements are not inherited
                    public  elements are inherited based on the type of inheritence specifier
                            if its private all public elements inherited as private
                            same for public and protected specifier
                    protected remains as protected under public and protected specifier
                               and as private under private inheritance specifier

concept of copy constructor 
it is used to copy the contents of object a to object b , both object being the instance of the same class.
i.e. it is a constructor which take argument of data type of that class.

Polymorphism referes to multiple forms.

-> compile time - static or early binding
      -> method overloading
      -> operator overloading

-> runtime - dynamic or late binding
      -> virtural functions
      -> method overriding

*/
namespace carspace{
    string shape;

}

class car{
    private:
    int a,b,gear;
    static string companyname;
    string type;
    public:
        car(){
            this->type = "default";
            this->gear = 0;
        } // default
        car(int x , string c){
            this->type = c;
        } // parameterized constructor
        void set_ab(int a ,int b){
            this->a = a;
            this->b = b;
        }
        void get_ab(){
            cout << a << " " << b << endl;
        }
        void get_type(){
            cout << type << endl;
        }
        int get_gear_no(){
            return this->gear;
        }
        virtual void shift_up(){
            if(gear == 4){
                throw("gear limit reached");
            }
            this->gear++;
            cout << (this->gear) << endl;
        }
        void increase_gear(){
            this->gear++;
            cout << (this->gear) << endl;
        }
        static void set_company_name(string d){
            car::companyname = d;
        }
       // virtual void turbo()=0; // pure virtual functions
};

class sports_car : public car
{
    public:
        sports_car():car(5,"sports_car"){
            this->get_type();
            
        }
        void shift_up(){
            if(this->get_gear_no() == 6){
                throw("gear limit reached for sportscar");
            }
            increase_gear();
        }
        void turbo(){

        }
};

string car::companyname = "Volkswagen";

template<typename T>
void swap(T &a , T &b){

}

int main(){
    string s;
    // getline(cin,s);
    // cout << s << endl;
    car c,a;
    c.set_ab(5,4);
    a = c; // the copy constructor in invoked
    /*
        car(car & c){ 
            this->a = c.a;
            this->b = c.b;
        }
    */
    a.get_ab();
    sports_car audi;
    car *p;
    p = &audi;
    p->shift_up();
}