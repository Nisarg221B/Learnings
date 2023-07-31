#include<iostream>
#include<array>

using namespace std;

#define print(x) cout << x << endl

/*



*/
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

}

