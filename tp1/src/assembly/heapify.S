#ifndef USE_MIPS_ASSEMBLY
#define USE_MIPS_ASSEMBLY
#include <mips/regdef.h>
#include <sys/syscall.h>

.text
.align 2
.globl heapify

# t1 = **array
# t2 = size
# t2 = dsd

heapify: subu sp,sp,64
		sw ra,56(sp)
		sw $fp,52(sp)
		sw gp,48(sp)
		move $fp,sp

		# Guardo registros
		sw s7,44(sp)
		sw s6,40(sp)
		sw s5,36(sp)
		sw s4,32(sp)
		sw s3,28(sp)
		sw s2,24(sp)
		sw s1,20(sp)
		sw s0,16(sp)

		#Guardo los parametros recibidos en fp
		sw a0,64($fp) # array
		sw a1,68($fp) # size
		sw a2,72($fp) # dsd

		#Guardo los parametros cargados en fp a variables temporales
		lw s5, 64($fp) # array
		lw s6, 68($fp) # size
		lw s7, 72($fp) # dsd

		add s0, zero, s7 # i = dsd

		# for( ; i < size ; )
loop: blt s0, s6, inloop # si i < size salta
		j fin

inloop:
		li s1, 1 # parent = 1
		subu s1, s7, s1 # parent = dsd - parent
		subu s1, s0, s1 # parent = i - parent
		sra s1, s1, 1 # parent = parent /2
		add s1, s1, s7 # parent = parent + dsd

		add s2, zero, s0 # j = i

		# while ( parent >= dsd  && ... )
loop2: bge s1, s7, cloop2 # si parent >= dsd
		j endloop2

cloop2: # Comparar strings saltar solo si array+parent < array+j
		li t1, 4 # El desplazamiento siempre tiene que estar multiplicado por 4
		mult t1, t1, s1 # parent
		add t1, s5, t1 # array+parent
		lw a0, 0(t1)

		li t1, 4
		mult t1, t1, s2 # j
		add t1, s5, t1 # array+j
		lw a1, 0(t1)

		la t1, strcmp # Cargo referencia de strcmp en t1
		jal ra, t1 # llamo a strcmp

		blt v0, zero, inloop2 
		j endloop2

inloop2:
		#HAGO SWAP
		li t1, 4 # El desplazamiento siempre tiene que estar multiplicado por 4
		mult t1, t1, s1 # parent
		add t1, s5, t1 # array+parent
		lw t2, 0(t1) # aux = array[parent]

		li t3, 4 # El desplazamiento siempre tiene que estar multiplicado por 4
		mult t3, t3, s2 # j
		add t3, s5, t3 # array+j
		lw t4, 0(t3)

		sw t1, t4 # array[parent] = array[j]
		sw t3, t2 # array[j] = aux
		## fin swap

		add s2, zero, s1 # j = parent
		sub s1, s1, s7 # parent = parent - dsd
		li t0, 1
		sub s1, s1, t0 # parent = parent - 1
		sra s1, s1, 1 # parent = parent /2
		add s1, s1, s7 # parent = parent + dsd
		j loop2

endloop2:
		addi s0, s0, 1 # i++
		j loop

fin:		move sp, $fp
		# Restablesco registros
		lw ra,56(sp)
		lw $fp,52(sp)
		lw gp,48(sp)
		lw s7,44(sp)
		lw s6,40(sp)
		lw s5,36(sp)
		lw s4,32(sp)
		lw s3,28(sp)
		lw s2,24(sp)
		lw s1,20(sp)
		lw s0,16(sp)

		addiu sp, sp, 64
		jr ra
#endif
