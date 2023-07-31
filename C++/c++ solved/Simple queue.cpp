//Program 3A.cpp
//19BCE145 Nisarg patel
//printer spooler application (assuming 5 user)
// implementing by making simple queue(through array)


/* I have made this practical using template keyword so that I can use it for other applications too hope you will understand */

#include<iostream>
using namespace std;
template<typename x>
struct queues {                            // making structure for queue
    int front;
    int rear;
    int max;
    x* que;
};

template<typename x>
struct queues<x>* cqueue(int a){               //fuction to create struct queue and return
    struct queues<x>* q;                       //pointer to it
    q =(struct queues<x>*) malloc(sizeof(struct queues<x>));
    q->max = a;
    q->front=-1;
    q->rear=-1;
    q->que = new x[a];
    return q;
}

template<typename x>
int isfullq(struct queues<x>* y){              // fuction to check if queue is full or not
    if(y->rear==y->max-1){
        return 1;
    }
    else{
        return 0;
    }
}

template<typename x>
void addq(struct queues<x>* y,x z){          // fuction to add element in queue
    if(isfullq(y)){
        cout << "Cannot Enter more" <<endl;
    }
    else{
    y->rear++;
    y->que[y->rear]=z;
    }
}

template<typename x>
x deq(struct queues<x>* y){                  // fuction to delete element from queue
    if(y->front == y->max-1){
        cout << "nothing to print"<< endl;
        return ("nothing to print");
    }
    else
    return y->que[y->front++];
}
template<typename x>
void printq(struct queues<x>* y){           // fuction to print queue
    for(int i = y->front+1; i<=y->rear;i++){
        cout << y->que[i];
    }
}

int main(){
    struct queues<string>* q;
    q = cqueue<string>(5);
    while(true){
        int n;
        cout << "1 - to print(max request =5)" << endl;
        cout << "2 - to get printout" << endl;
        cout << "3 - to exit" << endl;
        cin >> n;
        switch(n){
            case 1:{
                cout << "Send a file to print" << endl;
                string a;
                cin >> a;
                addq(q,a);
                printq(q);
                cout << endl;
                break;
            }
            case 2:{
                cout << "Getting a printout" << endl;
                deq(q);
                printq(q);
                cout << endl;
                break;
            }
            case 3:{
                goto label ;
            }
            default:{
                cout << " Enter something valid " <<endl;
            }
        }
    }
       label:{}
}



