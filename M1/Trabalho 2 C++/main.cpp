#include <iostream>

using namespace std;

int main()
{
    int VetA[8], VetB[8], VetC[8];
    for(int i=0; i<8;i++){
        cout<<"Vetor A["<<i<<"]: ";
        cin>>VetA[i];
    }
    cout<<endl;
    for(int i=0; i<8;i++){
        cout<<"Vetor B["<<i<<"]: ";
        cin>>VetB[i];
    }
    cout<<endl;
    for(int i=0; i<8; i++){
        if(VetA[i] > VetB[i]){
            VetC[i] = VetA[i];
        }else{
            VetC[i] = VetB[i];
        }
        cout<<"Vetor C["<<i<<"]: "<<VetC[i]<<endl;
    }

    return 0;
}
