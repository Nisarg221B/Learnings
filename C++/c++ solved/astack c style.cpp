//reversing a string using stack
#include<iostream>
#include<string>
using namespace std;

template<class x>
struct arraystack           // creating an struct for stack using array
{
public:
    int top;
    int capacity;
    x *array;
};
template<typename x>    // defining an pointer to point struct arraystack
struct arraystack<x>* cstack(int cap){
    struct arraystack<x>* stack;
    stack =(struct arraystack<x>*) malloc(sizeof(struct arraystack<x>));
    stack->capacity=cap;
    stack->top=-1;
    stack->array=(x*)malloc(sizeof(x)*(cap));
    return(stack);
}

template<typename x>    // a function to check if stack is full or not
int isfull(struct arraystack<x>* stack){
    if(stack->top == stack->capacity-1){
        return 1;
    }
    else{
        return 0;
    }
}
 
template<class x>       // a function to push an element in stack
void push(struct arraystack<x>* stack, x i){
    if(isfull(stack)){
        cout<< "cannot insert more"<< endl;
    }
    else{
        stack->top++;
        stack->array[stack->top]=i;
    }
}

