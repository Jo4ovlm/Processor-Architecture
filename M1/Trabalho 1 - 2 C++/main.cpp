#include <iostream>
#include <stack>

using namespace std;

int soma(int x, int y, int s0, int s1, int s2){
    int result;
    stack<int> stack;
    stack.push(s0);
    stack.push(s1);
    stack.push(s2);
    result = x + y;
    s0 = x;
    s1 = y;
    s2 = result;
    stack.pop();
    stack.pop();
    stack.pop();
    return result;
}

int main()
{
    int x, y, result, s0=7, s1=8, s2=9;
    cout<<"Entre com o valor de X: ";
    cin>>x;
    cout<<"Entre com o valor de Y: ";
    cin>>y;
    result = soma(x,y,s0,s1,s2);
    cout<<"O resultado eh: "<<result<<endl;
    cout<<s0<<" "<<s1<<" "<<s2;
    return 0;
}
