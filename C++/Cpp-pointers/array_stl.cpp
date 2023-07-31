#include<iostream>
#include<array>

using namespace std;

#define print(x) cout << x << endl

/*
stl array is basically static array implemented with buitin methods 
to facilliate the programmer

header - > <array>
template< class T, std::size_t N > struct array;

Element access 
functions --> at , [] , front/back (access front/back element), data ( returns pointer to the first element &a[0])

iterators  -> begin,end,rbegin,rend

capacity -> empty, size ,max_size

Operations and functions -> fill, swap

*/
template<class Os, class V> Os& operator<<(Os& os, const V& v) {
    for (auto i : v) os << i << " ";
    return os << "";
}

void pointer_func(const int* p, std::size_t size)
{
    std::cout << "data = ";
    for (std::size_t i = 0; i < size; ++i)
        std::cout << p[i] << ' ';
    std::cout << '\n';
}
 
 
int main()
{
    std::array<int,4> container { 1, 2, 3, 4 };

    // 1. Element access
    // data returns Pointer to the underlying element storage ,For non-empty containers, 
    //  the returned pointer compares equal to the address of the first element.
    pointer_func(container.data(), container.size());
    pointer_func(&container[0], container.size()); // same as above
     // pointer_func(container , container.size()); 
     // remember container is an object of class templated array not a pointer
     // Prefer container.data() over &container[0]

     print(container[3]);
     print(container.at(3));

     // just one diff between two, [] operator works without bound check and at() funciton checks for the bound of the array
     // eg

     print(container[5]); // executes without checks 
     // print(container.at(5));// exception std::out_of_range , abort trap: 6

     print(container.front()); // first element 
     print(container.back()); // last element 

     std::array<int,4>b{container}; // or b = container , b's data is overwrittten with containers element ( size should be same )
     pointer_func(b.data(),b.size());

     /*
     2. Iterators 

     a. begin and cbegin
     both returns iterators to the beginning 
     diff is just that 
     begin returns iterator or const iterator  depending on the const-qualification of the object it is called on.
     wheres cbegin always returns const iterator unconditionally

     similarly 
     end(), cend()
     end() points to the element after last element  or past the last element 

     */

    int* it = container.begin();
    const int* cit = container.cbegin();// cit (non-constant pointer pointing to constant data)
    // *cit = 5; error
    *it = 5;
    pointer_func(container.begin(),container.size());
    pointer_func(container.cbegin(),container.size());

    int* eit = container.end();
    print(*eit);//random value (theoretical element after last element of the array)
    print(*(eit-1)); // last element 

    /*
        crbegin and rbegin ,rend and crend

        rbegin means it will give reverse iterator contains value of last element 
        reverse iterator means on increasing iterator it will move back.

        rend returns a reverse iterator pointing to the theoretical element right 
        before the first element in the array container. it is always use with 
        rbegin as done below

    */
    array<int,5> v{11,12,13,14,15};
    for (auto it = v.rbegin(); it != v.rend(); it++)
    cout << *it << " ";
    cout << endl;

    /*
    3. CAPACITY
    */
    if(!v.empty()) print("not empty");  //checks whether the container is empty 
    printf("number of elements: %d \n",v.size()); // returns the number of elements 
    printf("max possible number of elements = %d \n",v.max_size());
    // as array is a fixed-size container, the value returned by max_size equals N (which is also the value returned by size)

    /*
    4. Operations and functions

    */
    array<int,6> sixs;
    sixs.fill(6);
    cout << sixs << endl; // operator << overloaded at the top (interesting)

    std::array<int, 3> a1{1, 2, 3}, a2{4, 5, 6};
    auto it1 = a1.begin();
    auto it2 = a2.begin();
    int& ref1 = a1[1];
    int& ref2 = a2[1];
 
    std::cout << a1 << " | " << a2 << " | "<< *it1 << ' ' << *it2 << ' ' << ref1 << ' ' << ref2 << '\n';
    a1.swap(a2);
    std::cout << a1 << " | " << a2 << " | "<< *it1 << ' ' << *it2 << ' ' << ref1 << ' ' << ref2 << '\n';
 
    // swap just exchanges the values of the two containers, without changing the addresses
    // thus all the references and pointers still points to the same location which implies 
    // they will show the swaped value.
    // array, e.g. `it1` still points to element a1[0], `ref1` still refers to a1[1].

    // do not apply swap function on individual elements
}

