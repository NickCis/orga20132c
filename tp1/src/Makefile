target = tp1
extension = c
CFLAGS = -Wall -pedantic -pedantic-errors
CFLAGS += -O0
CSTD = c99
# # Si no especifica archivos, tomo todos.
fuentes ?= $(wildcard *.$(extension))
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
.PHONY: all clean
#
all: $(target)
o_files = $(patsubst %.$(extension),%.o,$(fuentes))
$(target): $(o_files)
	@if [ -z "$(o_files)" ]; \
		then \
		echo "No hay archivos de entrada, recuerde que la extensión debe ser '.$(extension)'."; \
		false; \
		fi >&2
	$(LD) $(o_files) $(LOADLIBS) $(LDLIBS) -o $(target)

clean:
	$(RM) $(o_files) $(o_files:.o=.deps) $(target)

assembly: main.o arg_parse.o bubblesort.o
	gcc -c assembly/heapify.S -o heapify.o
	gcc -c assembly/heapsort.S -o heapsort.o
	gcc main.o arg_parse.o bubblesort.o heapsort.o heapify.o -o tp1

