#include <mips/regdef.h>

.text
.align 2
.globl heapsort_n
.extern heapify

# t1 = **array
# t2 = size

heapsort_n:
		subu sp,sp, 64 # ra,sp,fp,s0,..,s7, arg building 
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

		#Guardo los parametros cargados en fp a variables temporales
		lw s6, 64($fp) #array
		lw s7, 68($fp) #size

		li s0, 0 # i

		# for( ; i < size )
loop: blt s0, s7, inloop # i < size
		j fin

inloop: lw a0, 0(s6)
		add a0, zero, s6
		add a1, zero, s7
		add a2, zero, s0
		jal heapify
		addi s0, s0, 1 # i++
		j loop


fin: move sp, $fp
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
