target = tp1
extension = c
CFLAGS = -Wall -pedantic -pedantic-errors
CFLAGS += -O0
CSTD = c99
# # Si no especifica archivos, tomo todos.
#fuentes ?= $(wildcard *.$(extension))
FLAGS += -std=$(CSTD)
LD = $(CC)
#
# occ := $(CC)
# ocxx := $(CXX)
# orm := $(RM)
# old := $(LD)
# ifdef verbose
# RM := $(RM) -v
# else
# CC =  @echo "  CC  $@"; $(occ)
# CXX = @echo "  CXX $@"; $(ocxx)
# RM =  @echo "  CLEAN"; $(orm)
# LD =  @echo "  LD  $@"; $(old)
# endif

# # REGLAS
# #########
#
.PHONY: all clean assembly
#
all: $(target)
#o_files = $(patsubst %.$(extension),%.o,$(fuentes))
#$(target): $(o_files)
$(target): arg_parse.o bubblesort.o heapsort.o main.o
	#@if [ -z "$(o_files)" ]; \
	#	then \
	#	echo "No hay archivos de entrada, recuerde que la extensión debe ser '.$(extension)'."; \
	#	false; \
	#	fi >&2
	$(LD) arg_parse.o bubblesort.o heapsort.o main.o $(LOADLIBS) $(LDLIBS) -o $(target)

clean:
	#$(RM) *.o $(target)
	rm -rf *.o $(target)

assembly: arg_parse.o bubblesort.o main.o
	gcc -c assembly/heapify.S -o heapify.o
	gcc -c assembly/heapsort.S -o heapsort.o
	gcc -c assembly/strcasecmp_n.c -o strcasecmp_n.o
	gcc main.o arg_parse.o bubblesort.o strcasecmp_n.o heapsort.o heapify.o -o $(target)

