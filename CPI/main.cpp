#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>

using namespace std;

bool ehtres(string tres[], string palavra)
{
    for(int i=0; i<4; i++)
    {
        if(palavra == tres[i])
            return true;
    }
    return false;
}
// Essa subrotina eh para comparar a instrução (palavra) com
//as instruçoes no vetor que são as instruçoes com 3 ciclos

bool syscall(string palavra, string linha)
{
    if(palavra == "000000")
    {
        palavra = linha.substr(26,6);
        if(palavra == "001100")
            return true;
    }
    return false;
}
// Essa subrotina eh pra ver se a palavra lida eh um syscall
// O professor tinha pedido pra ignorar os syscall

void CPI(string nome, int &tresC, int &quatroC, int &cincoC, int &totalI, float &totalC, float &media)//nome do arquivo por parametro, resto por referencia
{
    string tres[4] = {"000010", "000011", "000100", "000101"}; // Salvos as instruções de 3 ciclos aqui pra comparar dps
    string palavra, linha;
    ifstream arq(nome+".txt"); // abre o arquivo
    if(!arq)
    {
        cout<<"Erro ao abrir arquivo"<<endl;
        system("pause");
        return;
    }
    while(getline(arq,linha)) // le o arquivo linha por linha
    {
        palavra = linha.substr(0, 6); // pega so a palavra que a gente quer da linha lida
        if(!syscall(palavra, linha))  // aqui é pra so entrar nesse if caso nao pegar um syscall, ja q o prof pediu pra ignorar syscall
        {
            if(ehtres(tres, palavra))  // ve se eh de 3 ciclos
            {
                tresC++;
            }
            else if(palavra == "100011")   // ve se eh o lw (unica com 5 ciclos)
            {
                cincoC++;
            }
            else    // se nao for de 3 nem de 5, eh de 4 ciclos
            {
                quatroC++;
            }
        }
    }
    arq.close(); // fecha arquivo
    totalI = tresC + quatroC + cincoC; // soma o total de instruções
    totalC = (tresC*3) + (quatroC*4) + (cincoC*5); // soma o total de ciclos
    media = totalC/totalI; // faz a media
}

int main()
{
    string nome;
    int tresC=0, quatroC=0, cincoC=0, totalI=0;
    float media=0, totalC=0;
    cout<<"Informe o nome do arquivo que quer analisar: "; // Nao precisa do .txt no cin pro arquivo ser aberto, somente o nome do arquivo
    cin>>nome;
    CPI(nome,tresC,quatroC,cincoC,totalI,totalC,media); //passa os valores por referencia pra fazer o calculo em uma subrotina


    cout<<tresC<<" Instrucoes de 3 ciclos"<<endl;
    cout<<quatroC<<" Instrucoes de 4 ciclos"<<endl;
    cout<<cincoC<<" Instrucoes de 5 ciclos"<<endl;
    cout<<totalI<<" Instrucoes totais"<<endl;
    cout<<totalC<<" Ciclos totais"<<endl;
    cout<<setprecision(3)<<media<<" CPI"<<endl;
    return 0;
}
