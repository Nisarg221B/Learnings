#include<bits/stdc++.h>
using namespace std;

/*

stl vector 

header - > <vector>
template<class T,class Allocator = std::allocator<T>> class vector;

Element access 
functions --> at , [] , front/back (access front/back element), data ( returns pointer to the first element &a[0])

iterators  -> begin,end,rbegin,rend

capacity -> empty, size ,max_size, (reserve , capacity , shirnk_to_fit)

Modifiers -> clear, inserts, emplace, erase, push_back, pop_back, emplace_back, 
             resize, swap

-- fill --(no fill function) that is obvious you cannot fill a dynamic container
 to fill a vector with a certain number
 use resize()

*/

void display_sizes(char const* comment,
                   const std::vector<int>& nums1,
                   const std::vector<int>& nums2,
                   const std::vector<int>& nums3)
{
    std::cout << comment
              << " nums1: " << nums1.size() << ','
              << " nums2: " << nums2.size() << ','
              << " nums3: " << nums3.size() << '\n';
}
 
void display(char const* comment, const std::vector<int>& v)
{
    std::cout << comment << "{ ";
    for (int e : v) {
        std::cout << e << ' ';
    }
    std::cout << "}\n";
}

class Person{
        
    public:
    int age;
    string name;

    Person(string name, int age){
        this->name =  name;
        this->age = age;
    }
};

int main(){

    /*
    1.

    operator '=' , copy assignment operator , copies data from one vector to the other
    std :: move() , moves data from one vector to the other. 

    assign() works same as '=' operator 
    vp.assign(5,'a'); is same as vp = {'a','a','a','a','a'}

    */
    std::vector<int> nums1 {3, 1, 4, 6, 5, 9};
    std::vector<int> nums2;
    std::vector<int> nums3;
 
    display_sizes("Initially:\n", nums1, nums2, nums3);
 
    // copy assignment copies data from nums1 to nums2
    nums2 = nums1;
 
    display_sizes("After assignment:\n", nums1, nums2, nums3);
 
    // move assignment moves data from nums1 to nums3,
    // modifying both nums1 and nums3
    nums3 = std::move(nums1);
 
    display_sizes("After move assignment:\n", nums1, nums2, nums3);
 
    display("Now nums3 = ", nums3);
 
    // copy assignment of an initializer_list copies data to nums3
    nums3 = {1, 2, 3};
 
    display("After assignment of initializer_list \n nums3 = ", nums3);
    cout << "\n\n";

    /*
    2. Modifiers 

    a. shrink_to_fit() --- reduces memory usage by freeing unused memory. 
       reduce capacity to match the size(element count) of the vector.

    b. resize(int count, Type value) -- resizes the container to contain the count element 
            I. if the current size is greater than count, the container is reduced 
               to its first count elements.(no effect on the capacity)
            II. If the current size is less than count, than additional values(' value ')are appended.
    c. clear() -- Erases all elements from the container.
                  After this call, size() returns zero.
                  Leaves the capacity() of the vector unchanged.
    */

    std::vector<int> c = {1, 2, 3};
    std::cout << "";
    display("The vector c holds: ",c);
    cout <<"capacity : "<< c.capacity() << endl;

    c.resize(5,10); // resize upto 5 and append 10's to fill extra space
    display("c after resize up to 5: ",c);
    cout <<"capacity : "<< c.capacity() << endl;

    c.resize(2);
    display("c after resize down to 2: ",c);
    cout <<"capacity : "<< c.capacity() << endl;

    c.shrink_to_fit();
    cout <<"capacity after shrink: "<< c.capacity() <<endl;

    c.clear();
    cout << "size after clear: " << c.size() << endl;
    cout << "capacity after clear: " << c.capacity() << endl;

    cout << "\n\n";

    /*
        d. iterator erase(iterator first, iterator last)  
       iterator erase(iterator pos)
                    -- Erases the specified elements from the container.
                    1) Removes the element at pos.
                    2) Removes the elements in the range [first, last).
                    -- return value
                    Iterator following the last removed element.
                    If pos refers to the last element, then the end() iterator is returned.
                    If last==end() prior to removal, then the updated end() iterator is returned.
                    If [first, last) is an empty range, then last is returned.

    */
    c = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    display("c = ",c);
    vector<int>::iterator itr = c.begin() + 4;
    itr = c.erase(itr); // now points to 5 or as it was point to c[4] which remains the same
    display("c after removing 5th element : ",c);
    itr++;
    c.erase(itr,itr+3);
    cout <<"c after removing 6th 7th and 8th element in the new c " << endl;
    display(": ",c);
    cout << "\n\n";

    /*
        e. insert()
        
        constructors : 

        1) iterator insert( const_iterator pos, T&& value );
        2) iterator insert( const_iterator pos, size_type count, const T& value );
        3) template< class InputIt >void insert( iterator pos, InputIt first, InputIt last);
        4) iterator insert( const_iterator pos, std::initializer_list<T> ilist );

        what does they do: 
        1) inserts value before pos
        2) inserts count copies of the value before pos
        3) inserts elements from range [first, last) before pos
        4) inserts elements from initializer list ilist before pos

        parameters : 
                pos	          -	iterator before which the content will be inserted. pos may be the end() iterator
                value	      -	element value to insert
                first, last	  -	the range of elements to insert, can't be iterators into container for which insert is called
                ilist         -	initializer list to insert the values from
        
        Inserts elements at the specified location in the container.

        Return value : 

        1) Iterator pointing to the inserted value
        2) Iterator pointing to the first element inserted, or pos if count==0.
        3) Iterator pointing to the first element inserted, or pos if first==last.
        4) Iterator pointing to the first element inserted, or pos if ilist is empty.

        Causes reallocation if the new size() is greater than the old capacity(). 
        If the new size() is greater than capacity(), all iterators and references 
        are invalidated. Otherwise, only the iterators and references before the 
        insertion point remain valid. The past-the-end iterator is also invalidated.

        * thus always catch the return value. for safety *

    */

   vector<int>vec(3,300);
   vector<int>::iterator it = vec.begin() + 1;

   display("vec: ",vec);
   it = vec.insert(it,100);
   cout<< "vec after inserting 100 at 2nd position" <<endl;
   display(": ",vec);

   it = it + 2;
   vec.insert(it,3,50);
   // "it" no longer valid, get a new one:
   cout<< "vec after skiping next element and inserting 3 50's " <<endl;
   display(": ",vec);
   it = vec.begin();

   std::vector<int>vec2(4,900);
   display("vec2: ",vec2);

   vec.insert(it+2,vec2.begin(),vec2.end());
   // vec.insert(it+1,vec.begin(),vec.end()); not allowed from the same vector
   cout<< "vec after inserting from vec2 starting from the 3rd position" <<endl;
   display(": ",vec);
   
   int arr[] = { 501,502,503 };
   vec.insert(vec.begin(), arr, arr+3);
   cout<< "vec after inserting from values from initializer list at the start" <<endl;
   display(": ",vec);

   /*
      f. emplace()   Inserts a new element into the container directly before pos.

        template< class... Args > iterator emplace( const_iterator pos, Args&&... args );

            pos	-	iterator before which the new element will be constructed
            args	-	arguments to forward to the constructor of the element

        The arguments args... are forwarded to the constructor as 
        std::forward<Args>(args).... args... may directly or indirectly 
        refer to a value in the container.

        returns Iterator pointing to the emplaced element.

        it does in-place insertion and avoids an unnecessary copy of object. 
        For primitive data types, it does not matter which one we use. 
        But for objects, use of emplace() is preferred for efficiency reasons.

       g. reserve() 
        void reserve( size_type new_cap );

        Increase the capacity of the vector to a value that's greater or equal to new_cap
        reserve() does not change the size of the vector.
        If new_cap is greater than the current capacity(), new storage is allocated, otherwise the method does nothing.
        
   */

  cout << "\n\n";
  vector<Person>vp;
  vp.reserve(10);
  Person p1("Nisarg",19);
  Person p3("nishant",21);
  
  vp.emplace_back(p1);
  for(auto i : vp){
      cout << i.name << " ";
  }
  cout << endl;
  
  vp.emplace(vp.begin(),"nikhil",20); 
  // arguments will be passed to the contructor of the person and o
  // object will be directly constructed into the vector
  for(auto i : vp){
      cout << i.name << " ";
  }
  cout << endl;

  vp.emplace(vp.end(),p3);
  for(auto i : vp){
      cout << i.name << " ";
  }
  cout << endl;

   // vp.insert(vp.begin(),"namo",78); // this won't work
   Person p4("namo",78);

   vp.insert(vp.begin(),p4);
   for(auto i : vp){
      cout << i.name << " ";
    }
   cout << endl;

   cout << "\n";


}
