#include "heapsort.h"

void heapify(char** array, int size, int dsd);

void heapsort(char** array, int size){
	int i=0;

	for(i=0; i<size; i++){
		heapify(array, size, i);
	}
	printf("IMPRIMIENDO CON HEAP\n");
	for(i=0; i<size; i++)
		printf("%s\n",array[i]);
}

void heapify(char** array, int size, int dsd){
	int i=0;

	for(i=dsd; i < size; i++){
		int parent = ( ( i- dsd -1)/2) + dsd;
		int j = i;

		while(parent >= dsd && strcasecmp(*(array+parent), *(array+j)) > 0){
			char* aux = *(array+parent);
			*(array+parent) = *(array+j);
			*(array+j) = aux;

			j = parent;
			parent = (( parent - dsd -1)/2) + dsd;
		}
	}

}
