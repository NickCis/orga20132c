#include <stdio.h>
#include "heapsort.h";

int main(){
int i;
	char* str[4] = {
		"ddd",
		"ccc",
		"a",
		"bb"
	};

	for(i=0; i < 4; i++){
		printf("%d) %s\n", i,  str[i]);
	}


	heapsort_n(str, 4);

	for(i=0; i < 4; i++){
		printf("%d) %s\n", i,  str[i]);
	}

	return 0;
}
