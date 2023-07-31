
// Minimum Spanning Tree

#include<iostream>
#include<string>
using namespace std;
struct set
{
    int* A;
    int  n;
};

struct set* cset(int n){
    struct set* S = new struct set();
    S->A = new int[n];
    S->n = n;
    return S;
}

struct set* Union(struct set* a,struct set* b){
    struct set* s = cset(a->n+b->n);
    int x = a->n + b->n;
    int i;
    for(i=0;i<a->n;i++){
        s->A[i]=a->A[i];
    }
    for(;i<x;i++){
        s->A[i]=b->A[i];
    }
    return s;
}

struct edge{
    string source;
    string destination;
    int weight;
};

struct edge* cedge(){
    struct edge* e = new struct edge();
    cout <<"Enter Source: ";
    cin >> e->source;
    cout << "Enter destination: ";
    cin >> e->destination;
    cout << "Enter weight: ";
    cin >> e->weight;
    return e;
}


struct graph{
    int v;
    int e;
    edge** ed;
    int ** adj;
};

// Using Adjacency Matrix
struct graph* cgraph(int v , int e){
    struct graph* g = new graph();
    g->e = e;
    g->v = v;
    g->ed = new struct edge*[g->e];
    g->adj = new int*[v*v];
    
    for(int i=0; i<g->v; i++)
      for(int j=0; j<g->v; j++)
              g->adj[i][j]=0;
    
    return g;
}


int main(){
    cout << "Enter number of vertices: ";
    int v,e;
    cin >> v;
    cout <<"Enter number of Edges: ";
    cin >> e;
    struct graph* g = cgraph(v,e); //Orignal graph
    struct graph* minSpanning = cgraph(v,v-1); //Min Spanning tree
    for(int i=0; i<g->e ; i++){
        g->ed[i] = cedge();
        cout << "Enter indices of source and destination in adjacency matrix"<< endl;
        int a,b;
        cin >> a >> b;
        g->adj[a][b] = g->ed[i]->weight;
        g->adj[b][a] = g->ed[i]->weight;
    }


}
