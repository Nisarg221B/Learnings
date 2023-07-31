
// 4A.cpp   DSA LAB
// 19BCE145
// Nisarg patel

#include<iostream>
using namespace std;

struct node{            //struct for a node in list
    int data;
    struct node *link;
};

struct list{           //struct for list
   // pointer which will always point to first element of list
    struct node* head;
   // number of elements in list
    int n;
};

// function which returns pointer to struct list after allocating memmory to it and initiallizing it
struct list* clist(){
    struct list* l;
    l = (struct list*) malloc(sizeof(struct list));
    l->head = NULL; // initiallizing head to null
    l->n = 0; //setting number of elements to zero
    return l;
};

//fuction which returns pointer to struct node after allocating memmory to it and initiallizing it
struct node* cnode(){
    struct node* n;
    n = (struct node*) malloc(sizeof(struct node));
    return(n);
};


//function for inserting new node
void iNode(struct list* l,int d){
    struct node* temp;
    temp = cnode();
    temp->data = d;
    temp->link=NULL;
    if(l->head==NULL){
        l->head = temp;
    }
    else{
        struct node* last = NULL;
        last = l->head;
        while(last->link!=NULL){
            last = last->link;
        }
        last->link = temp;
    }
    l->n = l->n + 1;
}

//function for deleting node (PS: no use in these program made it for future use)
void dNode(struct list* l,int i){
    struct node* x;
    if(l->head==NULL){
        cout << "List is empty" << endl;
    }
    else{
        switch(i){
            case 0:{
                 x = l->head;
                 l->head = l->head->link;
                 delete(x);
            }
        }
    }
}

//fuction which get element in list at particular index
int getel(struct list* l,int i){
    struct node* x;
    x = l->head;
    while(i--){
      x = x->link;
    }
    return (x->data);
}

//fuction to print list
void printl(struct list* l){
    struct node* x;
    x = l->head;
    while(x->link != NULL){
        cout << x->data << " -> ";
        x = x->link;
    }
    cout << x->data << endl;
}

int main(){
    list* a = clist();  //main list
    list* b = clist();  //sublist 1
    list* c = clist();  //sublist 2
    list* d = clist();  //sublist 3
    list* e = clist();  //sublist 4
    
    cout << "Enter number of elements " << endl;
    int t;
    cin >> t;
    for(int i=1;i<=t;i++){
        iNode(a,i);
    }
    for(int i=1;i<=a->n;i=i+4){
        iNode(b,getel(a,i-1));
    }
    cout << "1st sublist - ";
    printl(b);
    
    for(int i=2;i<=a->n;i=i+4){
        iNode(c,getel(a,i-1));
    }
    cout << "2nd sublist - ";
    printl(c);
    
    for(int i=3;i<=a->n;i=i+4){
        iNode(d,getel(a,i-1));
    }
    cout << "3rd sublist - ";
    printl(d);
    
    for(int i=4;i<=a->n;i=i+4){
        iNode(e,getel(a,i-1));
    }
    cout << "4th sublist - ";
    printl(e);
}


