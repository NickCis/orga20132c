#include <stdio.h>
#include <stdlib.h>

#include "arg_parse.h"

void usage(char* nombre);

int main(int argc, char* argv[]){
	TParseArg* args;

	args = ParseArg_new(4);
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_parse(args, argc, argv);

	if(ParseArg_getArg(args, 'h')){
		usage(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	ParseArg_delete(args);

	return 0;
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
