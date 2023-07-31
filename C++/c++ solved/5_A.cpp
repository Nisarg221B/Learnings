// MUSIC PLAYLIST WITH DOUBLE ENDED QUEUE

//Nisarg patel
//DSA LAB practical 5A.cpp
//19BCE145

#include<iostream>
#include<string>
using namespace std;

struct node{            //struct for a node in list
    string data;
    struct node *link;
    struct node *plink;
};

struct list{           //struct for list
   // pointer which will always point to first element of list
    struct node* head;
    struct node* current;
   // number of elements in list
    int n;
};


// function which returns pointer to struct list after allocating memmory to it and initiallizing it
struct list* clist(){
    struct list* l;
    l = (struct list*) malloc(sizeof(struct list));
    l->head = NULL; // initiallizing head to null
    l->current = NULL;
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
void iNode(struct list* l,string d){
    struct node* temp;
    temp = cnode();
    temp->data = d;
    temp->link=NULL;
    temp->plink=NULL;
    
    if(l->head==NULL){
        l->head = temp;
        l->current = temp;
    }
    else{
        struct node* x = NULL;
        x = l->head;
        while(x->link!=NULL){
            x = x->link;
        }
        x->link = temp;
        temp->plink = x;
    }
    l->n = l->n + 1;
}


//function for deleting node
void dNode(struct list* l,int i){
    struct node* x;
    if(l->head==NULL){
        cout << "List is empty" << endl;
    }
    else{
        if(i<l->n){
            struct node*x =NULL;
            x = l->head;
            while(i--){
                x = x->link;
            }
            if(x->link==NULL){
                struct node*y = x->plink;
                y->link = NULL;
                delete(x);
            }
            else if(x->plink==NULL){
                l->head = l->head->link;
                l->head->plink = NULL;
                delete(x);
            }
            else{
                struct node*y = x->plink;
                struct node*z = x->link;
                y->link = z;
                z->plink = y;
                delete(x);
            }
        }
        else{
            cout << "Enter correct index" <<endl;
        }
    }
}

//fuction which get element in list at particular index
struct node* getel(struct list* l,int i){
    struct node* x;
    x = l->head;
    while(i--){
      x = x->link;
    }
    return(x);
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
    cout <<"current playing: " << l->current->data << endl;
}

//Fuction to add new songs
void addnewsong(list* l){
    cout <<"how many songs you want to add: ";
    int tt;
    cin >> tt;
    string c;
    getline(cin,c); //for flushing purpose
    cout <<"Enter name of the songs you want to add"<< endl;
    while(tt--){
      string x;
      getline(cin,x);
      iNode(l,x);
    }
    cout <<"Song added at the end of playlist in order "<<endl;
    cout <<"Current playing: " << l->current->data <<endl;
}

//function to play next song in playlist
void playnext(list* l){
    if(l->current->link==NULL){
        cout << "No more songs in playlist to play" <<endl;
    }
    else{
    l->current = l->current->link;
    cout <<"Current playing: " << l->current->data << endl;
    }
}

//function to play first song in playlist
void playfirst(list* l){
    l->current = l->head;
    cout <<"Playing first : " << l->current->data << endl;
}

//function to play previous of current playing song in playlist
void playprevious(list* l){
    if(l->current->plink==NULL){
        cout << "no more previous songs"<<endl;
    }
    else{
    l->current = l->current->plink;
    cout <<"Current playing: " << l->current->data << endl;
    }
}

//function to play specific song in playlist (INDEX OF FIRST SONG = 0)
void playspe(list* l,int n){
    struct node* x = getel(l,n);
    l->current = x;
    cout <<"Current playing: " << l->current->data << endl;
}

int main(){
    list* playlist;
    playlist = clist();
    while(true){
        cout<<"1.Add new songs"<<endl;
        cout<<"2.Play next" << endl;
        cout<<"3.Play first" <<endl;
        cout<<"4.Play previous"<<endl;
        cout<<"5.Play specific"<<endl;
        cout<<"6.To delete a song"<<endl;
        cout<<"7.To display songs in playlist" <<endl;
        cout<<"8.To exit"<<endl;
        int x;
        cin >> x;
        switch(x){
            case 1:{
                addnewsong(playlist);
                break;
            }
            case 2:{
                playnext(playlist);
                break;
            }
            case 4:{
                playprevious(playlist);
                break;
            }
            case 3:{
                playfirst(playlist);
                break;
            }
            case 5:{
                cout <<"enter index of song you want to play(Index of fisrt song being 0)" <<endl;
                int n;
                cin>>n;
                playspe(playlist,n);
                break;
            }
            case 6:{
                cout <<"enter index of song you want to delete from playlist(Index of fisrt song being 0)" <<endl;
                int n;
                cin>>n;
                dNode(playlist,n);
                printl(playlist);
                break;
            }
            case 7:{
                printl(playlist);
                break;
            }
            default:{
                goto label;
           }
        }
      }
   label:{}
}








