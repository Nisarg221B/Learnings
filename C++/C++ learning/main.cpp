

#include <iostream>
#include <string>
using namespace std;


struct btnode
{
    string name;
    int phonenumber;
    int freq;
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

struct btnode *cbtnode(int phonenumber, string name)
{
    struct btnode *y = (struct btnode *)malloc(sizeof(struct btnode));
    y->phonenumber = phonenumber;
    y->left = NULL;
    y->freq = 0;
    y->right = NULL;
    y->name = name;
    return (y);
}

struct btnode *find(struct btnode *root, string data)
{
    if (root == NULL)
    {
        cout << "no such person found" << endl;
        return (NULL);
    }
    else if (data.compare(root->name) < 0)
    {
        return (find(root->right, data));
    }
    else if (data.compare(root->name) == 0)
    {
        return (root);
    }
    else
    {
        return (find(root->left, data));
    }
}

void insert(struct tree *t, int phonenumber, string name)
{

    struct btnode *y = cbtnode(phonenumber, name);
    struct btnode *x = t->root;

    if (t->root == NULL)
    {
        t->root = y;
    }
    else
    {
        while (x)
        {
            if (x->name.compare(y->name) > 0)
            {
                if (x->right == NULL)
                {
                    x->right = y;
                    x->right->freq = 1;
                    break;
                }
                x = x->right;
            }
            else if (x->name.compare(y->name) < 0)
            {
                if (x->left == NULL)
                {
                    x->left = y;
                    x->left->freq = 1;
                    break;
                }
                x = x->left;
            }
            else
            {
                x->freq++;
                break;
            }
        }
    }
}

struct btnode *deleten(struct btnode *root, string name)
{
    if ((root) == NULL)
    {
        return (NULL);
    }
    else if (name.compare((root)->name) < 0)
    {
        return (deleten(root->right,name));
    }
    else if (name.compare((root)->name) > 0)
    {
        return (deleten(root->left , name));
    }
    else
    {
        if ((root)->left && (root)->right)
        {
            struct btnode* temp = (root)->left;
            struct btnode* parent = (root)->left;
            while (temp->right)
            {
                temp = parent;
                temp = temp->right;
            }
            (root)->name = temp->name;
            (root)->phonenumber = temp->phonenumber;
            struct btnode* x = temp;
            if (temp->left == NULL && temp->right == NULL)
            {
                if(temp->name == (root)->left->name){
                    (root)->left = NULL;
                }
                else{
                    parent->right = NULL;
                }
            }
            else
            {
                if(temp->name == (root)->left->name){
                    (root)->left = temp->left;
                }
                else{
                    parent->right = temp->left;
                }
            }
            free(x);
        }
        else
        {
            struct btnode *temp =  (root);
            if ((root)->left == NULL && (root)->right == NULL)
            {
                root = NULL;
            }
            else if((root)->left == NULL)
            {
                (root) = (root)->right;
            }
            else
            {
                (root) = (root)->left;
            }
            free(temp);
        }
        return (root);
    }
}

void preorder(struct btnode *b)
{
    if(b!=NULL)
    {
        preorder(b->right);
        cout << b->name << " ";
        cout << b->phonenumber << endl;
        preorder(b->left);
    }
}

int main()
{
    struct tree *tr = cbtree();
    cout << "1.To insert in phonebook" << endl;
    cout << "2.To find a number of a person" << endl;
    cout << "3.To delete persons details" << endl;
    cout << "4.To display whole phonebook" << endl;
    cout << "5.To show the Menu again" << endl;
    cout << "6.To Exit" << endl;
    while (true)
    {
        cout << "Enter: ";
        int k;
        cin >> k;
        cin.clear();
        switch (k)
        {
        case 1:{
            cout << "how many entries you want to enter: ";
            int t;
            cin >> t;
            cin.clear();
            cout << "insert phonenumbers with name, -1 to exit" << endl;
            // eg: Nisarg 933241231
            while (t--)
            {
                string n;
                cin >> n;
                int x;
                cin >> x;
                insert(tr, x, n);
            }
            break;
        }
        case 2:{
            cout << "Enter name of the person: ";
            string n;
            cin >> n;
            struct btnode *x = find(tr->root, n);
            if (x == NULL)
            {
                break;
            }
            cout << x->name << " = " << x->phonenumber << endl;
            break;
        }
        case 3:{
            cout << "Enter name of the person whoes details" << endl;
            cout << "you want to delete: ";
            string n;
            cin >> n;
            deleten((tr->root), n);
            cout << n << "\'s details have been removed" << endl;
            break;
        }
        case 4:{
            cout << endl;
            cout << endl;
            preorder(tr->root);
            break;
        }
        case 5:{
            cout << "1.To insert in phonebook" << endl;
            cout << "2.To find a number of a person" << endl;
            cout << "3.To delete persons details" << endl;
            cout << "4.To display whole phonebook" << endl;
            cout << "5.To show the Menu again" << endl;
            cout << "6.To Exit" << endl;
            break;
        }
        case 6:{
            goto label;
        }
        }
    }
label:
{
};
}












