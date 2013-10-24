#include "bubblesort.h"

void bubblesort(char** word, int size){
	int i,j;
	char* tmp;
	printf("BUBUEEE");
	for (i = 0 ; i < size; i++){
		for (j = i+1 ; j < size; j++){
			if (strcasecmp(*(word+i), *(word+j)) > 0){
				tmp = *(word+i);
				*(word+i) = *(word+j);
				*(word+j) = tmp;
			}
		}
	}
}

