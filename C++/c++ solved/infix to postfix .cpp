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
int checkpre(char a){
     if(a=='+' || a=='-')
        return 1;
     else if(a=='*' || a=='/')
        return 2;
     else
        return 3;
}
void postfix(string s){
    astack<char>a(s.length());
    astack<char>c(s.length());
    for(int i=0;i<s.length();i++){
        char x= s[i];
        if((x>=65 && x<=90) || (x>=97 && x<=122))
        {
            c.push(x);
        }
        else
        {
            if(a.isempty()){
                a.push(x);
            }
            else{
                if(checkpre(x)>checkpre(a.peek())){
                    a.push(x);
                }
                else{
                    while(!a.isempty()){
                        c.push(a.pop());
                    }
                    a.push(x);
                }
            }
        }
    }
    while(!a.isempty()){
        c.push(a.pop());
    }
    c.printstack();
}
int main(){
    string s;
    cin>>s;
    postfix(s);
}


