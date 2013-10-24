#include "bubblesort.h"

void bubblesort(void** array, size_t size, TCompareFunction cmp){
	int i,j;
	void* tmp;
	for (i = 0 ; i < size; i++){
		for (j = i+1 ; j < size; j++){
			if (cmp(*(array+i), *(array+j)) < 0){
				tmp = *(array+i);
				*(array+i) = *(array+j);
				*(array+j) = tmp;
			}
		}
	}
}

