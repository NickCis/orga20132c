#include <stdio.h>
#include <stdlib.h>

#include "arg_parse.h"

#define BUBBLE 1
#define HEAP 2

void usage(char* nombre);
void version(char* nombre);
void ordenarArchivo(char* nombreArchivo,int modo);
void usarBubble(char* nombreArchivo){}
void usarHeap(char* nombreArchivo){}
int main(int argc, char* argv[]){
	TParseArg* args;
	char *output = NULL;
	int* res = NULL;
	int modo;
	// Creo el parseador de argumentos
	args = ParseArg_new(4);
	// Agrego los argumentos a parsear, si uso valores por defecto como NULL con tama~no 0,
	// estoy haciendo qe sean obligatorios los argumentos
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_addArg(args, NULL, 'V', "version", NULL, 0);
	ParseArg_addArg(args, NULL, 'b', "bubble", NULL, 0);
	ParseArg_addArg(args, NULL, 'h', "heap", NULL, 0);
	ParseArg_parse(args, argc, argv);
	
	//Si tengo mas de 3 parametros es porque paso una lista de archivos
	if (ParseArg_getArg(args, 'b')){
		modo=BUBBLE;
		ParseArg_delete(args);
		return 1;
	}
	if (ParseArg_getArg(args, 'h')){
		modo=HEAP;
		ParseArg_delete(args);
		return 1;
	}
	if (argc > 3){
		//TODO:
		int i;
		for ( i=2 ; i<argc ; i++){}
			//TODO:ESTO
			ordenarArchivo(argv[i],modo);
	}
	if(ParseArg_getArg(args, 'h')){
		usage(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'V')){
		version(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	//if(!(output = (char*) ParseArg_getArg(args, 'o'))){
	//	ParseArg_delete(args);
	//	return 1;
	//}

	free(res);
	free(output);
	ParseArg_delete(args);

	return 0;
}

void version(char* nombre){
	printf("%s 1.0.0\n", nombre);
}

void usage(char* nombre){
	printf("Usage:\n");
	printf("\t%s -h\n", nombre);
	printf("\t%s -V\n", nombre);
	printf("\t%s [options][file...]\n", nombre);
	printf("Options:\n");
	printf("\t-V, --version\t\tPrint version and quit.\n");
	printf("\t-h, --help\t\tPrint this information.\n");
	printf("\t-b, --bubble\tSort using a bubblesort.\n");
	printf("\t-h, --heap\t\tSort using a heapsort.\n");
	printf("Examples:\n");
	printf("\t%s -h 25demayo.txt\n", nombre);
	printf("\t%s -b 2pac.txt\n", nombre);
}

void ordenarArchivo(char* nombreArchivo, int modo){
	switch (modo){
		case BUBBLE:
			usarBubble(nombreArchivo);
			break;
		case HEAP:
			usarHeap(nombreArchivo);
			break;
	}
}
