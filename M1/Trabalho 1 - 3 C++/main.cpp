#include <iostream>

using namespace std;

int verzero(int vet[]){
    int cont=0;
    for(int i=0;i<8;i++)
        if(vet[i] == 0)
            cont++;
    return cont;
}

int main()
{
    int vet[8], i, zeros;
    for(i=0;i<8;i++){
        cout<<"Entre com Vet["<<i<<"]: ";
        cin>>vet[i];
    }
    zeros = verzero(vet);
    cout<<zeros;
    return 0;
}
