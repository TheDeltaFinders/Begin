#include "Add.h"
#include "Multiply.h"

#include <iostream>
using namespace std;

int main()
{
    int a = 7;
    int b = 9;
    int Sum  = Add(a,b);
    int Product = Multiply(a,b);

    cout<<" Sum is : "<<Sum<<" and product is "<<Product<<endl;
    return 0;
}
