#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "arg_parse.h"
#include "bubblesort.h"
#include "heapsort.h"

#define FIXED_SIZE 30
#define BUBBLE 1
#define HEAP 2

void usage(char* nombre);
void version(char* nombre);
void ordenarArchivo(char* nombreArchivo,int modo);
char* getData(char* nombreArchivo);
void fillWords(char* contenido,char*** palabras,int* size);
void imprimir(char** word, int size);

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
		if (argc > 2){
			int i;
			for ( i=2 ; i<argc ; i++)
				ordenarArchivo(argv[i],modo);
		}else if (argc == 2){
			ordenarArchivo("",modo);
		}else{
			fprintf(stderr,"Vea la ayuda para ver como ejecutar el programa\n");
		}
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
	int size;
	char* contenido = getData(nombreArchivo);
	char** palabras;
	fillWords(contenido,&palabras,&size);
	switch (modo){
		case BUBBLE:
			bubblesort(palabras,size);
			break;
		case HEAP:
			heapsort_n(palabras,size);
			break;
	}
	imprimir(palabras,size);
}

char* getData(char* nombreArchivo){
	char* buffer;
	int size;
	FILE *fp = stdin;
	if (strcmp(nombreArchivo,"")!=0){
		if ( !(fp = fopen(nombreArchivo,"r")) )
			fprintf(stderr,"No se puede abrir el archivo %s\n",nombreArchivo);
		exit (1);
	}
	fseek(fp,0L,SEEK_END);
	size = ftell(fp);
	fseek(fp,0L,0);
	buffer = (char*)malloc((size)*sizeof(char)+1);
	fread(buffer,size,1,fp);
	fclose(fp);
	return buffer;
}

void fillWords(char* contenido,char*** palabras,int* size){
	int i=0; /* Para moverme en el archivo que esta en la variable contenido*/
	int j=0; /* Para agregar a la lista de palabras */
	int k=0; /* para moverme dentro de una palabra */
	int times=1;
	char c;
	char* palabra = (char*) calloc(1,sizeof(char)*FIXED_SIZE);
	*palabras = (char**)malloc(sizeof(char**));
	while (contenido[i]){
		c = contenido[i];
		i++;
		if (!isspace(c)){
			if (k==(times*FIXED_SIZE)){
				times++;
				palabra=(char*)realloc(palabra,sizeof(char)*(times*FIXED_SIZE));
			}
			palabra[k]=c;
			k++;
		}else{
			(*palabras)[j]=palabra;
			j++;
			*size=j;
			*palabras = (char**)realloc(*palabras,sizeof(char**)*(j+1));
			palabra = (char*) calloc(1,sizeof(char)*FIXED_SIZE);
			k=0;
		}
	}
}

void imprimir(char** word, int size){
	int i;
	for (i = 0 ; i < size; i++)
		printf("%s\n",word[i]);

}
