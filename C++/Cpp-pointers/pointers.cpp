#include<iostream>
#include<array>

using namespace std;
/*
read pdf, other doubts are cleared here.
*/
void fun(const int *arr, int size) ;

int main(){
    /*
    a. 
    when & is used in a declaration (including function formal parameters), 
    it is part of the type identifier and is used to declare a reference 
    variable (or reference or alias or alternate name). It is used to 
    provide another name, or another reference, or alias to an existing variable.
    */
    int first_name = 5;
    int &second_name = first_name; // & as reference operator 
    cout << first_name<< " " << second_name << endl;
    second_name = 3;
    cout << first_name<< " " << second_name << endl;

    /*
    A pointer variable has its own identity: a distinct, 
    visible memory address that can be taken with the unary & operator 
    and a certain amount of space that can be measured with the sizeof 
    operator. Using those operators on a reference returns a value 
    corresponding to whatever the reference is bound to; the reference’s 
    own address and size are invisible. Since the reference assumes the 
    identity of the original variable in this way, it is convenient to 
    think of a reference as another name for the same variable.
    */
    cout << &first_name << endl;
    cout << &second_name << endl;

    int value{5};
    cout << value << endl;

    int n;
    cin >> n;
    int a[n];
    int b[n];
    int *c = new int[n];
    for(int i=0 ; i< n ;i++){
        a[i] = i;
        b[i] = i*i;
        c[i] = i+2;
    }
    for(int i=0 ; i< n ;i++){
       cout << a[i] << " ";
    }
    cout << endl;
    cout << a << endl;
    cout << *a << endl;
    cout << *(a+1) << endl;
    

    cout << *c << endl;
    c = b;
    cout << *c << endl;
    /* 
    a = b; not allowed , as a is same as &a[0] , 
    and its static and decided at complie time so no changing it no.
    or  it's(a) just a memory location. It cannot point 
    to arbitrary location in memory, nor can be controlled by the programmer 
    */

    int * p = 0;
    p = b;
    cout <<p[2] <<endl;// same as *(p+2) or b[2]

    int numbers[100];

    int max(int numbers[], int size);
    int max(int *numbers, int size);
    int max(int number[50], int size);
    // all same as 
    // int max(int*, int);
    /*
    The size of the array is not part of the array parameter,
    and needs to be passed in another int parameter. Compiler
    is not able to deduce the array size from the array pointer,
    and does not perform array bound check.

    check to concept of const pointers , interesting and similar , in the same pdf.
    */
    const int SIZE = 5;
    int a[SIZE] = {8, 4, 5, 3, 2};
    cout << "sizeof in main() is " << sizeof(a) << endl;  // 20
    cout << "address in main() is " << a << endl;
    fun(a, SIZE); 
}


void fun(const int *arr, int size) {
   cout << "sizeof in function is " << sizeof(arr) << endl; // 4
   cout << "address in function is " << arr << endl;
}
