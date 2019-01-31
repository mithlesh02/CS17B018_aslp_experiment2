// add=add	
// sub=substract
// addi=add immediate
// addu=add unsigned
// subu=substract unsigned
// addiu=add immediate unsigned
// mul=multiply(without overflow)
// mult=multiply
// div=divide
// lw=load word
// sw=store word
// lui=load upper immediate
// la=load address
// li=load immediate
// mfhi=move from hi
// mflo=move from lo
// move=move
// beq=branch on equal
// bne=branch on not equal
// bgt=branch on greater than




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
	sw	$fp,4($sp)                                ; $0=memory[$fp+8];store word;Copy from register to memory
	move	$fp,$sp
	sw	$4,8($fp)                                 ; $0=memory[$fp+8];store word;Copy from register to memory
	lw	$2,8($fp)                                 ; $2=Memory[$fp+24];load store;Copy from memory to register
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
	lw	$fp,4($sp)                                 ; $2=Memory[$fp+24];load store;Copy from memory to register
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
	sw	$fp,12($sp)                               ; $0=memory[$fp+8];store word;Copy from register to memory
	move	$fp,$sp
	sw	$4,16($fp)                                 ; $0=memory[$fp+8];store word;Copy from register to memory
	lw	$3,16($fp)                                ; $2=Memory[$fp+24];load store;Copy from memory to register
	li	$2,2			# 0x2
	beq	$3,$2,$L5
	nop

	lw	$3,16($fp)                                 ; $2=Memory[$fp+24];load store;Copy from memory to register
	li	$2,3			# 0x3
	bne	$3,$2,$L6
	nop

$L5:
	li	$2,3			# 0x3
	b	$L7
	nop

$L6:
	li	$2,2			# 0x2
	sw	$2,4($fp)                                   ; $0=memory[$fp+8];store word;Copy from register to memory
	b	$L8
	nop

$L12:
	lw	$3,16($fp)                                 ; $2=Memory[$fp+24];load store;Copy from memory to register
	lw	$2,4($fp)                                  ; $2=Memory[$fp+24];load store;Copy from memory to register
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	beq	$2,$0,$L13
	nop

	lw	$2,16($fp)                                 ; $2=Memory[$fp+24];load store;Copy from memory to register
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)                                  ; $2=Memory[$fp+24];load store;Copy from memory to register
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
	lw	$2,16($fp)                                ; $2=Memory[$fp+24];load store;Copy from memory to register
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
	lw	$fp,12($sp)                          ; $0=memory[$fp+8];store word;Copy from register to memory
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
	sw	$31,52($sp)                            ; $31=memory[$sp+52];store word;Copy from register to memory
	sw	$fp,48($sp)                            ; $fp=memory[$sp+48];store word;Copy from register to memory
	move	$fp,$sp
	sw	$0,28($fp)                             ; $0=memory[$fp+28];store word;Copy from register to memory
	lw	$4,36($fp)                            ; $4=Memory[$fp+36];load store;Copy from memory to register
	.option	pic0
	jal	Isodd
	nop

	.option	pic2
	sw	$2,24($fp)                             ; $2=memory[$fp+24];store word;Copy from register to memory
	lw	$4,36($fp)                            ; $4=Memory[$fp+36];load store;Copy from memory to register
	.option	pic0
	jal	Isprime
	nop

	.option	pic2
	move	$3,$2                                  ; $3=$2
	li	$2,3			# 0x3          ; $2=$3
	bne	$3,$2,$L15
	nop

	li	$2,3			# 0x3
	sw	$2,24($fp)
$L15:
	lw	$2,24($fp)                           ; $2=Memory[$fp+24];load store;Copy from memory to register
	li	$3,2			# 0x2        ; $3=2
	beq	$2,$3,$L17
	nop

	li	$3,3			# 0x3        ; $3=3
	beq	$2,$3,$L18
	nop

	li	$3,1			# 0x1        ; $3=1
	bne	$2,$3,$L16
	nop

	lw	$2,36($fp)                          ; $2=Memory[$fp+24];load store;Copy from memory to register
	addiu	$2,$2,1
	sw	$2,40($fp)                          ; $0=memory[$fp+8];store word;Copy from register to memory
	b	$L16
	nop

$L17:
	lw	$2,36($fp)                            ; $2=Memory[$fp+36];load store;Copy from memory to register
	sw	$2,44($fp)
	lw	$2,36($fp)                            ; $2=Memory[$fp+44];load store;Copy from memory to register
	sw	$2,32($fp)
	lw	$2,44($fp)                            ; $2=Memory[$fp+44];load store;Copy from memory to register
	addiu	$2,$2,1
	sw	$2,44($fp)
	lw	$4,44($fp)                            ; $4=Memory[$fp+44];load store;Copy from memory to register
	.option	pic0
	jal	Isprime
	nop

	.option	pic2
	lw	$2,44($fp)                            ; $2=Memory[$fp+40];load store;Copy from memory to register
	sw	$2,40($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)
	nop
$L23:
	lw	$2,32($fp)                            ; $2=Memory[$fp+24];load store;Copy from memory to register
	addiu	$2,$2,-1                              ; $2=$2-1
	sw	$2,32($fp)
	lw	$4,32($fp)                            ; $2=Memory[$fp+24];load store;Copy from memory to register
	.option	pic0
	jal	Isprime
	nop

	.option	pic2
	move	$3,$2                                  ; $3=$2
	li	$2,3			# 0x3
	bne	$3,$2,$L20
	nop

	lw	$2,32($fp)                            ; $2=Memory[$fp+40];load store;Copy from memory to register
	sw	$2,40($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)               
	b	$L21
	nop

$L20:
	lw	$3,28($fp)                            ; $3=Memory[$fp+28];load store;Copy from memory to register
	li	$2,1			# 0x1         ; $2=1
	beq	$3,$2,$L26
	nop

	b	$L23
	nop

$L26:
	nop
$L21:
	lw	$3,28($fp)                            ; $3=Memory[$fp+28];load store;Copy from memory to register
	li	$2,1			# 0x1          ; $2=1
	beq	$3,$2,$L27
	nop

	b	$L17
	nop

$L27:
	nop
$L18:
	lw	$2,36($fp)                            ; $2=Memory[$fp+24];load store;Copy from memory to register
	addiu	$2,$2,1                               ; $2=$2+1
	sw	$2,40($fp)                            ; $0=memory[$fp+8];store word;Copy from register to memory
	nop
$L16:
	move	$2,$0                                  ;$2=$0 
	move	$sp,$fp                                $sp=$fp
	lw	$31,52($sp)                           ; $31=Memory[$sp+52];load store;Copy from memory to register
	lw	$fp,48($sp)                           ; $fp=Memory[$sp+48];load store;Copy from memory to register
	addiu	$sp,$sp,56
	j	$31                                   ;jump ; go to address $31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
