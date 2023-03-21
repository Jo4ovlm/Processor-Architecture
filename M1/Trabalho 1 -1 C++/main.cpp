#include <iostream>

using namespace std;

int soma(int x, int y){
    return x + y;
}

int main()
{
    int x, y, result;
    cout<<"Entre com o valor de X: ";
    cin>>x;
    cout<<"Entre com o valor de Y: ";
    cin>>y;
    result = soma(x,y);
    cout<<"O resultado eh: "<<result;
    return 0;
}
