#include <stdio.h>
#include <stdlib.h>

#include "arg_parse.h"
#include "bubblesort.h"
#include "heapsort.h"
#define BUBBLE 1
#define HEAP 2

void usage(char* nombre);
void version(char* nombre);
void ordenarArchivo(char* nombreArchivo,int modo);
void usarBubble(char* nombreArchivo);
void usarHeap(char* nombreArchivo){}
char* getData(char* nombreArchivo,int* size);

int main(int argc, char* argv[]){
	TParseArg* args;
	char *output = NULL;
	int* res = NULL;
	int modo = 0;
	/* Creo el parseador de argumentos */
	args = ParseArg_new(4);
	/* Agrego los argumentos a parsear, si uso valores por defecto como NULL con tama~no 0, */
	/* estoy haciendo qe sean obligatorios los argumentos */
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_addArg(args, NULL, 'V', "version", NULL, 0);
	ParseArg_addArg(args, NULL, 'B', "bubble", NULL, 0);
	ParseArg_addArg(args, NULL, 'H', "heap", NULL, 0);
	ParseArg_parse(args, argc, argv);
	
	/*Si tengo mas de 3 parametros es porque paso una lista de archivos */
	if (ParseArg_getArg(args, 'B')){
		modo=BUBBLE;
	}
	if (ParseArg_getArg(args, 'H')){
		modo=HEAP;
	}

	if (modo > 0){
			ordenarArchivo("",modo);
		if (argc > 3){
			int i;
			for ( i=2 ; i<argc ; i++){}
			ordenarArchivo(argv[i],modo);
		}
	}

	if(ParseArg_getArg(args, 'h')){
		printf("ESTAS ACA\n");
		usage(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'V')){
		version(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

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
	printf("\t-B, --bubble\tSort using a bubblesort.\n");
	printf("\t-H, --heap\t\tSort using a heapsort.\n");
	printf("Examples:\n");
	printf("\t%s -H 25demayo.txt\n", nombre);
	printf("\t%s -B 2pac.txt\n", nombre);
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

char* getData(char* nombreArchivo,int* size){
	FILE *fp;
	char* buffer;
	fp = fopen(nombreArchivo,"r");
	fseek(fp,0L,SEEK_END);
	*size = ftell(fp);
	fseek(fp,0L,0);
	buffer = (char*)malloc((*size)*sizeof(char)+1);
	fread(buffer,(*size),1,fp);
	fclose(fp);
	return buffer;
}

void usarBubble(char* nombreArchivo){
	int size;
	char* contenido = getData("heapsort.h",&size);
	printf("%s\n",contenido);
	printf("size: %d\n",size);
	bubblesort(&contenido,size);
}
