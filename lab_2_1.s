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


        .file	1 "lab_2_1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24                      ; allocate frame of 24 bytes
	sw	$fp,20($sp)                      ; Memory[$sp + 20] = $fp
	move	$fp,$sp                          ; $fp <- [$sp]   ; establish our fp;
	li	$2,17	       		# 0x11   ; $2 = 17 ;load immediate
	sw	$2,4($fp)                        ; $2=memory[$fp+4];store word;Copy from register to memory
	li	$2,5			# 0x5    ; $2=5;load immediate
	sw	$2,8($fp)                        ; $2=memory[$fp+8];store word;Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $3=Memory[$fp+8];load store;Copy from memory to register
	addu	$2,$3,$2                         ; $2=$2+$3;add unsigned
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $2=Memory[$fp+8];load store;Copy from memory to register
	subu	$2,$3,$2                         ; $2=$3-$2 ; substraction unsigned
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $3=Memory[$fp+8];load store;Copy from memory to register
	mul	$2,$3,$2                         ; $2=$3*$2;
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $2=Memory[$fp+8];load store;Copy from memory to register
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	mflo	$2
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	and	$2,$3,$2                         ; $2=$3&$2;
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	or	$2,$3,$2                         ; $2=$3 | $2;
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	lw	$3,4($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	lw	$2,8($fp)                        ; $3=Memory[$fp+4];load store;Copy from memory to register
	xor	$2,$3,$2                         ; $2=$3 xor $2;
	sw	$2,12($fp)                       ; $2=memory[$fp+12] ; store word ; Copy from register to memory
	move	$2,$0                            ; $2=$0 ; move
	move	$sp,$fp                          ; $sp=$fp ; move
	lw	$fp,20($sp)                      ; $3=Memory[$fp+20];load store;Copy from memory to register                    
	addiu	$sp,$sp,24                       ; $sp=$sp+24;
	j	$31                              ; jump ;go to address $31;
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
