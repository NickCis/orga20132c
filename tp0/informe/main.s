	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"help\000"
	.align	2
$LC1:
	.ascii	"version\000"
	.align	2
$LC2:
	.ascii	"resolution\000"
	.align	2
$LC3:
	.ascii	"output\000"
	.align	2
$LC4:
	.ascii	"wb\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,72,$ra		# vars= 24, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 24
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	li	$a0,4			# 0x4
	la	$t9,ParseArg_new
	jal	$ra,$t9
	sw	$v0,32($fp)
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	move	$a1,$zero
	li	$a2,104			# 0x68
	la	$a3,$LC0
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	move	$a1,$zero
	li	$a2,86			# 0x56
	la	$a3,$LC1
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	la	$a1,parse_resolution
	li	$a2,114			# 0x72
	la	$a3,$LC2
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	la	$a1,ParseArg_parseStr
	li	$a2,111			# 0x6f
	la	$a3,$LC3
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	lw	$a0,32($fp)
	lw	$a1,72($fp)
	lw	$a2,76($fp)
	la	$t9,ParseArg_parse
	jal	$ra,$t9
	lw	$a0,32($fp)
	li	$a1,104			# 0x68
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	beq	$v0,$zero,$L18
	lw	$v0,76($fp)
	lw	$a0,0($v0)
	la	$t9,usage
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L17
$L18:
	lw	$a0,32($fp)
	li	$a1,86			# 0x56
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	beq	$v0,$zero,$L19
	lw	$v0,76($fp)
	lw	$a0,0($v0)
	la	$t9,version
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L17
$L19:
	lw	$a0,32($fp)
	li	$a1,111			# 0x6f
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v0,36($fp)
	bne	$v0,$zero,$L20
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	b	$L17
$L20:
	lw	$v0,36($fp)
	lb	$v1,0($v0)
	li	$v0,45			# 0x2d
	bne	$v1,$v0,$L21
	la	$v0,__sF+88
	sw	$v0,44($fp)
	b	$L22
$L21:
	lw	$a0,36($fp)
	la	$a1,$LC4
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bne	$v0,$zero,$L22
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	b	$L17
$L22:
	lw	$a0,32($fp)
	li	$a1,114			# 0x72
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v0,40($fp)
	bne	$v0,$zero,$L24
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	b	$L17
$L24:
	lw	$v1,40($fp)
	lw	$v0,40($fp)
	addu	$v0,$v0,4
	lw	$a0,44($fp)
	lw	$a1,0($v1)
	lw	$a2,0($v0)
	la	$t9,print_board
	jal	$ra,$t9
	lw	$v1,44($fp)
	la	$v0,__sF+88
	beq	$v1,$v0,$L25
	lw	$a0,44($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L25:
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,48($fp)
$L17:
	lw	$v0,48($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC5:
	.ascii	"%s 1.0.0\n\000"
	.text
	.align	2
	.globl	version
	.ent	version
version:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	la	$a0,$LC5
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	version
	.size	version, .-version
	.rdata
	.align	2
$LC6:
	.ascii	"Usage:\n\000"
	.align	2
$LC7:
	.ascii	"\t%s -h\n\000"
	.align	2
$LC8:
	.ascii	"\t%s -V\n\000"
	.align	2
$LC9:
	.ascii	"\t%s [options]\n\000"
	.align	2
$LC10:
	.ascii	"Options:\n\000"
	.align	2
$LC11:
	.ascii	"\t-V, --version\t\tPrint version and quit.\n\000"
	.align	2
$LC12:
	.ascii	"\t-h, --help\t\tPrint this information.\n\000"
	.align	2
$LC13:
	.ascii	"\t-r, --resolution\tSet bitmap resolution to WxH pixels."
	.ascii	"\n\000"
	.align	2
$LC14:
	.ascii	"\t-o, --output\t\tPath to output file.\n\000"
	.align	2
$LC15:
	.ascii	"Examples:\n\000"
	.align	2
$LC16:
	.ascii	"\t%s -o output.pgm\n\000"
	.align	2
$LC17:
	.ascii	"\t%s -r 800x600 -o file.pgm\n\000"
	.text
	.align	2
	.globl	usage
	.ent	usage
usage:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC7
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC8
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC9
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC10
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC11
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC12
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC13
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC14
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC15
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC17
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	usage
	.size	usage, .-usage
	.align	2
	.globl	parse_resolution
	.ent	parse_resolution
parse_resolution:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	li	$a0,2			# 0x2
	li	$a1,4			# 0x4
	la	$t9,calloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	sw	$zero,28($fp)
	sb	$zero,32($fp)
$L29:
	lw	$v0,56($fp)
	move	$v1,$v0
	lbu	$v1,0($v1)
	sb	$v1,32($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	sll	$v0,$v1,24
	sra	$v0,$v0,24
	bne	$v0,$zero,$L31
	b	$L30
$L31:
	lb	$v0,32($fp)
	sw	$v0,36($fp)
	lw	$v1,36($fp)
	slt	$v0,$v1,48
	bne	$v0,$zero,$L32
	lw	$v1,36($fp)
	slt	$v0,$v1,58
	bne	$v0,$zero,$L42
	li	$v0,88			# 0x58
	lw	$v1,36($fp)
	beq	$v1,$v0,$L44
	li	$v0,120			# 0x78
	lw	$v1,36($fp)
	beq	$v1,$v0,$L44
	b	$L32
$L42:
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$a0,$v1,$v0
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	lw	$v1,0($v0)
	move	$v0,$v1
	sll	$v0,$v0,2
	addu	$v0,$v0,$v1
	sll	$v1,$v0,1
	lb	$v0,32($fp)
	addu	$v0,$v1,$v0
	addu	$v0,$v0,-48
	sw	$v0,0($a0)
	b	$L32
$L44:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
$L32:
	lw	$v0,28($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L29
$L30:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	parse_resolution
	.size	parse_resolution, .-parse_resolution
	.rdata
	.align	2
$LC18:
	.ascii	"P2\n"
	.ascii	"%d\n"
	.ascii	"%d\n"
	.ascii	"1\n\000"
	.text
	.align	2
	.globl	print_board
	.ent	print_board
print_board:
	.frame	$fp,80,$ra		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	sw	$a2,88($fp)
	lw	$v0,84($fp)
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	bgez	$v0,$L49
	lw	$v1,52($fp)
	addu	$v1,$v1,7
	sw	$v1,52($fp)
$L49:
	lw	$v1,52($fp)
	sra	$v0,$v1,3
	sw	$v0,24($fp)
	lw	$v0,88($fp)
	sw	$v0,56($fp)
	lw	$v0,56($fp)
	bgez	$v0,$L50
	lw	$v1,56($fp)
	addu	$v1,$v1,7
	sw	$v1,56($fp)
$L50:
	lw	$v1,56($fp)
	sra	$v0,$v1,3
	sw	$v0,32($fp)
	li	$v0,8			# 0x8
	sw	$v0,40($fp)
	li	$v0,8			# 0x8
	sw	$v0,44($fp)
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	lw	$a0,80($fp)
	la	$a1,$LC18
	lw	$a2,84($fp)
	lw	$a3,88($fp)
	la	$t9,fprintf
	jal	$ra,$t9
$L51:
	addu	$v0,$fp,40
	lw	$v1,0($v0)
	move	$a0,$v1
	addu	$v1,$v1,-1
	sw	$v1,0($v0)
	bgtz	$a0,$L53
	b	$L48
$L53:
	lw	$v0,32($fp)
	sw	$v0,36($fp)
$L54:
	addu	$v0,$fp,36
	lw	$v1,0($v0)
	move	$a0,$v1
	addu	$v1,$v1,-1
	sw	$v1,0($v0)
	bgtz	$a0,$L56
	b	$L55
$L56:
	li	$v0,8			# 0x8
	sw	$v0,44($fp)
$L57:
	addu	$v0,$fp,44
	lw	$v1,0($v0)
	move	$a0,$v1
	addu	$v1,$v1,-1
	sw	$v1,0($v0)
	bgtz	$a0,$L59
	b	$L58
$L59:
	lw	$v0,24($fp)
	sw	$v0,28($fp)
$L60:
	addu	$v0,$fp,28
	lw	$v1,0($v0)
	move	$a0,$v1
	addu	$v1,$v1,-1
	sw	$v1,0($v0)
	bgtz	$a0,$L62
	b	$L57
$L62:
	lw	$v0,48($fp)
	blez	$v0,$L63
	lw	$v1,44($fp)
	sra	$v0,$v1,31
	srl	$v0,$v0,31
	addu	$v0,$v1,$v0
	sra	$v0,$v0,1
	sll	$v0,$v0,1
	subu	$v0,$v1,$v0
	addu	$v0,$v0,48
	move	$a0,$v0
	lw	$a1,80($fp)
	la	$t9,fputc
	jal	$ra,$t9
	b	$L64
$L63:
	lw	$v1,44($fp)
	sra	$v0,$v1,31
	srl	$v0,$v0,31
	addu	$v0,$v1,$v0
	sra	$v0,$v0,1
	sll	$v0,$v0,1
	subu	$v1,$v1,$v0
	li	$v0,49			# 0x31
	subu	$v0,$v0,$v1
	move	$a0,$v0
	lw	$a1,80($fp)
	la	$t9,fputc
	jal	$ra,$t9
$L64:
	li	$a0,32			# 0x20
	lw	$a1,80($fp)
	la	$t9,fputc
	jal	$ra,$t9
	b	$L60
$L58:
	li	$a0,10			# 0xa
	lw	$a1,80($fp)
	la	$t9,fputc
	jal	$ra,$t9
	b	$L54
$L55:
	lw	$v0,48($fp)
	move	$v1,$zero
	subu	$v0,$v1,$v0
	sw	$v0,48($fp)
	b	$L51
$L48:
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	print_board
	.size	print_board, .-print_board
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
