	.file	1 "lab_2_4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	Isodd
	.set	nomips16
	.set	nomicromips
	.ent	Isodd
	.type	Isodd, @function
Isodd:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	andi	$2,$2,0x1
	bne	$2,$0,$L2
	nop

	li	$2,1			# 0x1
	b	$L3
	nop

$L2:
	li	$2,2			# 0x2
$L3:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	Isodd
	.size	Isodd, .-Isodd
	.align	2
	.globl	Isprime
	.set	nomips16
	.set	nomicromips
	.ent	Isprime
	.type	Isprime, @function
Isprime:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	lw	$3,16($fp)
	li	$2,2			# 0x2
	beq	$3,$2,$L5
	nop

	lw	$3,16($fp)
	li	$2,3			# 0x3
	bne	$3,$2,$L6
	nop

$L5:
	li	$2,3			# 0x3
	b	$L7
	nop

$L6:
	li	$2,2			# 0x2
	sw	$2,4($fp)
	b	$L8
	nop

$L12:
	lw	$3,16($fp)
	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	beq	$2,$0,$L13
	nop

	lw	$2,16($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	bne	$3,$2,$L11
	nop

	li	$2,3			# 0x3
	b	$L7
	nop

$L11:
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L8:
	lw	$2,16($fp)
	slt	$2,$2,4
	beq	$2,$0,$L12
	nop

	b	$L10
	nop

$L13:
	nop
$L10:
	b	$L4
	nop

$L7:
$L4:
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	Isprime
	.size	Isprime, .-Isprime
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	sw	$0,28($fp)
	lw	$4,36($fp)
	.option	pic0
	jal	Isodd
	nop

	.option	pic2
	sw	$2,24($fp)
	lw	$4,36($fp)
	.option	pic0
	jal	Isprime
	nop

	.option	pic2
	move	$3,$2
	li	$2,3			# 0x3
	bne	$3,$2,$L15
	nop

	li	$2,3			# 0x3
	sw	$2,24($fp)
$L15:
	lw	$2,24($fp)
	li	$3,2			# 0x2
	beq	$2,$3,$L17
	nop

	li	$3,3			# 0x3
	beq	$2,$3,$L18
	nop

	li	$3,1			# 0x1
	bne	$2,$3,$L16
	nop

	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
	b	$L16
	nop

$L17:
	lw	$2,36($fp)
	sw	$2,44($fp)
	lw	$2,36($fp)
	sw	$2,32($fp)
	lw	$2,44($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
	lw	$4,44($fp)
	.option	pic0
	jal	Isprime
	nop

	.option	pic2
	lw	$2,44($fp)
	sw	$2,40($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)
	nop
$L23:
	lw	$2,32($fp)
	addiu	$2,$2,-1
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	Isprime
	nop

	.option	pic2
	move	$3,$2
	li	$2,3			# 0x3
	bne	$3,$2,$L20
	nop

	lw	$2,32($fp)
	sw	$2,40($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)
	b	$L21
	nop

$L20:
	lw	$3,28($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L26
	nop

	b	$L23
	nop

$L26:
	nop
$L21:
	lw	$3,28($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L27
	nop

	b	$L17
	nop

$L27:
	nop
$L18:
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
	nop
$L16:
	move	$2,$0
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
