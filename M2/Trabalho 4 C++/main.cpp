#include <iostream>

using namespace std;

int pedeN(){
    int n;
    do{
        cout<<"Informe o tamanho do vetA (Max 8): ";
        cin>>n;
        if(n<1 or n>8)
            cout<<"Valor invalido, informe um numero de 1 a 8"<<endl;
    }while(n<1 or n>8);
    return n;
}

void pedeVet(int vetA[], int n){
    for(int i=0;i<n;i++){
        cout<<"VetA["<<i<<"]: ";
        cin>>vetA[i];
    }
}

void bubblesort(int vetA[], int n){
    int aux;
    bool swapado = true;
    do{
        swapado = false;
        for(int i=0;i<n-1;i++){
            if(vetA[i]>vetA[i+1]){
                aux = vetA[i];
                vetA[i] = vetA[i+1];
                vetA[i+1] = aux;
                swapado = true;
            }
        }
    }while(swapado == true);
}

void mostraV(int vetA[], int n){
    for(int i=0;i<n;i++){
            cout<<"\nVetA["<<i<<"]: "<<vetA[i];
    }
}

int main()
{
    int vetA[8], n=0;
    n = pedeN();
    pedeVet(vetA, n);
    bubblesort(vetA, n);
    mostraV(vetA, n);
}
