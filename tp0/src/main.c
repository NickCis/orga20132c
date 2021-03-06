#include <stdio.h>
#include <stdlib.h>

#include "arg_parse.h"

void usage(char* nombre);
void version(char* nombre);
void* parse_resolution(char* str);
void print_board(FILE* file, int width, int height);

int main(int argc, char* argv[]){
	TParseArg* args;
	char *output = NULL;
	int* res = NULL;
	FILE* file;

	// Creo el parseador de argumentos
	args = ParseArg_new(4);
	// Agrego los argumentos a parsear, si uso valores por defecto como NULL con tama~no 0,
	// estoy haciendo qe sean obligatorios los argumentos
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_addArg(args, NULL, 'V', "version", NULL, 0);
	ParseArg_addArg(args, &parse_resolution, 'r', "resolution", NULL, 0);
	ParseArg_addArg(args, &ParseArg_parseStr, 'o', "output", NULL, 0);
	ParseArg_parse(args, argc, argv);

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

	if(!(output = (char*) ParseArg_getArg(args, 'o'))){
		ParseArg_delete(args);
		return 1;
	}

	if(output[0] == '-'){
		file = stdout;
	}else{
		file = fopen(output, "wb");
		if(!file){
			free(output);
			ParseArg_delete(args);
			return 1;
		}
	}

	if(!(res = (int*) ParseArg_getArg(args, 'r'))){
		free(output);
		ParseArg_delete(args);
		return 1;
	}

	print_board(file, res[0], res[1]);

	if(file != stdout)
		fclose(file);

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
	printf("\t%s [options]\n", nombre);
	printf("Options:\n");
	printf("\t-V, --version\t\tPrint version and quit.\n");
	printf("\t-h, --help\t\tPrint this information.\n");
	printf("\t-r, --resolution\tSet bitmap resolution to WxH pixels.\n");
	printf("\t-o, --output\t\tPath to output file.\n");
	printf("Examples:\n");
	printf("\t%s -o output.pgm\n", nombre);
	printf("\t%s -r 800x600 -o file.pgm\n", nombre);
}

void* parse_resolution(char* str){
	int* res = (int*) calloc(2, sizeof(int));
	int n = 0;
	char c = 0;
	while((c = *(str++))){
		switch(c){
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				res[n] = res[n] * 10 + c-'0';
				break;

			case 'x':
			case 'X':
				n++;
				break;

			default:
				break;
		}

		if(n>1)
			break;
	}

	return res;
}

void print_board(FILE* file, int width, int height){
	int c_w = width/8,
		c_w_j,
		c_h = height/8,
		c_h_i,
		i=8,
		j=8,
		uno = 1;

	fprintf(file, "P2\n%d\n%d\n1\n", width, height);
	while(i-- > 0){
		c_h_i = c_h;
		while(c_h_i-- > 0){
			j=8;
			while(j-- > 0){
				c_w_j = c_w;
				while(c_w_j-- > 0){
					if(uno>0)
						fputc('0'+(j%2), file);
					else
						fputc('1'-(j%2), file);
					fputc(' ', file);
				}
			}
			fputc('\n', file);
		}
		uno *= -1;
	}
}
