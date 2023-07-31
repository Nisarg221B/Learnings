#include<bits/stdc++.h>
using namespace std;

class Empty_car{

};

class car{
    char* shape;
    char* color;
    int number_of_gears;
    // default constructor will not exist if there is any constructor defined by the user
    // same with the copy constructor
    public : 
    // simple constructor
    car(int number_of_gears){
        this->shape = new char[100];
        this->color = new char[100];
        char shape[] = "sporty";
        char color[] = "white";
        strcpy(this->shape,shape);
        strcpy(this->color,color);
        this->number_of_gears = number_of_gears;
    }
    // parameterized constructor
    car(char* shape , char* color , int no_of_gears){
        this->shape = new char[100];
        this->color = new char[100];
        strcpy(this->shape,shape);
        strcpy(this->color,color);
        this->number_of_gears = no_of_gears;
    }
    // default copy constructor ,car c , car x(c) <- default copy constructor will be called
    car(car &x){ // & has to be added else there will be an infinite loop as the its a pass by value whenever it is called.
        // this->shape = x.get_shape(); this happens in default conpy construtor , shallow copy
        // this->color = x.get_color();
        this->shape = new char[100];
        this->color = new char[100];
        strcpy(this->shape,x.get_shape());
        strcpy(this->color,x.get_color());
        this->number_of_gears = x.number_of_gears;
    }
    // getter setter
    char* get_shape(){
        return this->shape;
    }
    char* get_color(){
        return this->color;
    }
    int get_number_of_gears(){
        return this->number_of_gears;
    }
    void set_shape(char shape[]){
        strcpy(this->shape,shape);
    }
    void set_color(char color[]){
        strcpy(this->color,color);
    }
    void print_details(){
        cout << this->shape << " "<< this->color << " "<< this->number_of_gears << endl;
    }
    ~car(){
        cout << "distructor has been called for ";
        print_details();
        cout << endl;
    }
};

class new_car{
    public:
    char* shape;
    char* color;
    int number_of_gears;

    // simple constructor
    new_car(int number_of_gears){
        this->shape = new char[100];
        this->color = new char[100];
        char shape[] = "sporty";
        char color[] = "white";
        strcpy(this->shape,shape);
        strcpy(this->color,color);
        this->number_of_gears = number_of_gears;
    }
    // parameterized constructor
    new_car(char shape[] , char color[] , int no_of_gears){
        this->shape = new char[100];
        this->color = new char[100];
        strcpy(this->shape,shape);
        strcpy(this->color,color);
        this->number_of_gears = no_of_gears;
    }
    // default copy constructor // shallow copy
    void print_details(){
        cout << this->shape << " "<< this->color << " "<< this->number_of_gears << endl;
    }
};

void fun(){
    // static object 
    car a(5);
}
car *x;
void fun2(){
    // object creation dynamically
    // car *x = new car(7);
    x = new car(7); // this will run default constructor
}

void shallow_deep_copy(){
    cout << "\nShallow Copy\n" << endl;
    char c[] = "sedan";
    char r[] = "red";
    new_car *sd = new new_car(c,r,3);
    new_car *new_sd = new new_car((*sd)); // predefined copy constructor ( shallow copy )
    char ch[] = "black";
    sd->print_details();
    new_sd->print_details();

    strcpy(new_sd->color,ch);

    sd->print_details();
    new_sd->print_details(); // changing just new_sd color resulted in changing sd color too.
    // as the default copy constructor does the shallow copy 
    // i.e. new_sd->color = sd->color , for this reason both the pointers points to the same location
    // thus we define new constructor to perform deep copy through strcpy in case of char array

    // deep copy
    cout << "\nDeep copy\n" << endl;
    car *sdc = new car(c,r,3);
    car *new_sdc = new car((*sdc));
    char chc[] = "blue";
    sdc->print_details();
    new_sdc->print_details();

    new_sdc->set_color(chc);

    sdc->print_details();
    new_sdc->print_details(); 
}

int main(){
    cout << sizeof(Empty_car) << endl; // 1Byte
    fun();
    cout << "Static objects , gets deallocated once their scope is over , thus for static object destructor will be called automatically \n" << endl;
    fun2();
    cout << "For the dynamically allocated object, destructor is needed to be called specifically or else they won't be deallocated \n" << endl;
    delete x; // to deallocate dynamic objects or pointer
    shallow_deep_copy();
}