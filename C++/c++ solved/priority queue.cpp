// Priority queue implementation using array
// Nisarg patel
// 19BCE145
// DSA lab 3B.cpp

#include<iostream>
using namespace std;


//declaring structure for queue
template<typename x>
struct queues {
    int* front;
    int* rear;
    int max;
    x** que;
};


/* function which intialize struct queue and returns pointer pointing to it */
template<typename x>
struct queues<x>* cqueue(int a){
    struct queues<x>* q;
    q =(struct queues<x>*) malloc(sizeof(struct queues<x>));
    q->max = a;
    q->front = new int[a]; // array which stores front values of each priority
    q->rear = new int[a]; // array which stores rear values of each priority
    
    // Now declaring 'a' queues(rows)for each priority
    // thus a*a matrix
    q->que = new x*[a];
    for(int i=0;i<a;i++){
        q->que[i]= new x[a];
    }
    for(int i=0;i<a;i++){
        q->front[i]=-1;
        q->rear[i]=0;
    }
    return q;
}


//fuction which adds element according to its priority
template<typename x>
void addq(struct queues<x>* y,x z,int b){
    if(y->front[b]==-1 && y->rear[b]==0){
        y->front[b]++;
        y->rear[b]++;
    }
    else{
        y->rear[b]++;
    }
    y->que[b][y->rear[b]-1] = z;
}


//function for getting element back according to priority
template<typename x>
x deq(struct queues<x>* y){
    for(int j=0;j<7;j++){
        if(y->front[j]==-1 && y->rear[j]==0){
            
        }
        else if(y->front[j]==y->rear[j]){
            
        }
        else{
            y->front[j]++;
            return y->que[j][y->front[j]-1];
        }
    }
    cout <<"No more request pending"<< endl;
    return("no more request");
}


// printing current status
template<typename x>
void printq(struct queues<x>* y){
    for(int j=0;j<7;j++){
        cout << "Priority("<<j <<") : ";
        if(y->front[j]==-1 && y->rear[j]==0){
            
        }
        else if(y->front[j]==y->rear[j]){
            
        }
        else{
        for(int i=y->front[j];i<y->rear[j];i++){
                cout << y->que[j][i] << " " ;
           }
        }
        cout << endl;
    }
}

int main(){
    struct queues<string>* q;
    cout << "Max number of clients = 7" << endl;
    q = cqueue<string>(7);
    while(true){
        int n;
        cout << "1 - Request services to server" << endl; //to add element to priority queue
        cout << "2 - Returning request" << endl; // to get element back priority wise
        cout << "3 - Displaying status" << endl; // to print current elements in priority queue
        cout << "4 - To exit" << endl;
        cin >> n;
        switch(n){
            case 1:{
                cout << "how many clients are requesting service"<< endl;
                int t;
                cin >> t;
                cout << "Request a service and its priority(from 0-6) in format:" << endl;
                cout << "Eg \" xxx 4 \" "<< endl;
                while(t--){
                string a;
                cin >> a;
                int x;
                cin >> x;
                addq(q,a,x);
                }
                break;
            }
            case 2:{
                cout << "getting service from server  : " ;
                cout << deq(q) << endl;
                break;
            }
            case 3:{
                printq(q);
                break;
            }
            case 4:{
                goto label ;
            }
            default:{
                cout << " Enter something valid " <<endl;
            }
        }
    }
       label:{}
}

