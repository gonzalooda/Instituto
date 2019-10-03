#include <iostream>
#include <stdlib.h>

using namespace std;

void ordenar (int vector[]);
void intercambiar (int &,int &);


int MAIN(int argc, char *argv[]) {
	
	int vector[10];
	
	for (int i=0; i<10; i++){
		vector [i]= rand()%101;
		cout<<vector[i]<<" ";
	}
	ordenar(vector);
	cout<<endl;
	
	return 0;
}
void intercambiar (int &x, int &y) {
	int aux;
	aux=x;
	x=y;
	y=aux;
}
void ordenar (int vector[]){
	int a=1;
	while (a!=0){
		a=0;
		for (int i=0; i<9; i++){
			if (vector[i]>vector[i+1]) {
				intercambiar(vector[i],vector[i+1]);
				a++;
			}
		}
		for (int i=0; i<10; i++){
			cout<<vector[i]<<" ";
		}
		cout<<endl;
	}
}
