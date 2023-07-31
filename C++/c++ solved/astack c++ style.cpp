#include<iostream>
#include<string>
using namespace std;

template<class x>
class astack
{
private:
    int top;
    int capacity;
    x *aray;
public:
    astack(int cap){
        capacity=cap;
        top=-1;
        aray = new x[cap];
    }
    int isfull(){
        if(top == capacity-1){
            return 1;
        }
        else{
            return 0;
        }
    }
    int isempty(){
        if(top == -1){
            return 1;
        }
        else{
            return 0;
        }
    }
    void push(x i){
        if(isfull()){
            cout<< "cannot insert more"<< endl;
        }
        else{
            top++;
            aray[top]=i;
        }
    }
    x pop(){
            x item;
            if(isempty()){
                cout<< "theres nothing in the stack to extract"<< endl;
                return(0);
            }
            else{
                item = aray[top];
                top--;
                return(item);
            }
    }
    x peek(){
        return aray[top];
    }
    x array(long k){
        return (aray[k]);
    }
    void printstack(){
        int k=0;
        while(k<=top){
            cout << aray[k] ;
            k++;
        }
    }
};
