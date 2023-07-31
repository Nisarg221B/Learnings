#include <iostream>
using namespace std;

struct btnode
{
    int data;
    struct btnode *left;
    struct btnode *right;
};

struct tree
{
    struct btnode *root;
};

struct tree *cbtree()
{
    struct tree *t = (struct tree *)malloc(sizeof(struct tree));
    t->root = NULL;
    return t;
}

struct btnode *cbtnode(int data)
{
    struct btnode *y = (struct btnode *)malloc(sizeof(struct btnode));
    y->data = data;
    y->left = NULL;
    y->right = NULL;
    return (y);
}

struct btnode *ctree(int *in, int *pr, int size)
{
    if (size == 0)
    {
        return NULL;
    }
    struct btnode *root = cbtnode(pr[0]);
    if (size == 1)
    {
        root->left = NULL;
        root->right = NULL;
        return(root);
    }
    else
    {
        int c = 0;
        for (int i = 0; i < size; i++)
        {
            if (pr[0] == in[i])
            {
                break;
            }
            c++;
        }
        
        int Lin[c];
        int Lpr[c];
        int Lsize = c;
        for (int i = 0; i < c; i++)
        {
            Lpr[i] = pr[i+1];
        }
        for (int i = 0; i < c; i++)
        {
            Lin[i] = in[i];
        }
        root->left = ctree(Lin, Lpr, Lsize);

        int Rin[size - c - 1];
        int Rpr[size - c - 1];
        int Rsize = size - c - 1;
        int j=0;
        for (int i = c + 1; i < size; i++)
        {
            Rin[j] = in[i];
            Rpr[j] = pr[i];
            j++;
        }
        root->right = ctree(Rin, Rpr, Rsize);
    }
    return (root);
}

void inorder(struct btnode *b)
{
    if (b)
    {
        inorder(b->left);
        cout << b->data << " ";
        inorder(b->right);
    }
}

int main()
{
    int preorder[] = {1, 2, 4, 8, 9, 10, 11, 5, 3, 6, 7};
    int inorde[] = {8, 4, 10, 9, 11, 2, 5, 1, 6, 3, 7};
    struct tree *t = cbtree();
    t->root = ctree(inorde, preorder, 11);
    inorder(t->root);
    cout << endl;
}















