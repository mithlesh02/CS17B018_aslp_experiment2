	.file	1 "lab_2_2.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.word	12
	.word	13
	.word	34
	.word	56
	.word	67
	.word	78
	.word	35
	.word	98
	.word	67
	.word	78
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 48, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,68($fp)
	lui	$2,%hi($LC0)
	addiu	$3,$fp,28
	addiu	$2,$2,%lo($LC0)
	li	$4,40			# 0x28
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,24($fp)
	b	$L2
	nop

$L3:
	lw	$2,24($fp)
	sll	$2,$2,2
	addiu	$3,$fp,72
	addu	$2,$3,$2
	lw	$2,-44($2)
	addiu	$3,$2,3
	lw	$2,24($fp)
	sll	$2,$2,2
	addiu	$4,$fp,72
	addu	$2,$4,$2
	sw	$3,-44($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$2,24($fp)
	slt	$2,$2,10
	bne	$2,$0,$L3
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,68($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L5:
	move	$sp,$fp
	lw	$31,76($sp)
	lw	$fp,72($sp)
	addiu	$sp,$sp,80
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
