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
	addiu	$sp,$sp,-80                               ; allocate frame of 80 bytes
	sw	$31,76($sp)                               ; $31=memory[$fp+76];store word;Copy from register to memory
	sw	$fp,72($sp)                               ; $fp=memory[$fp+72];store word;Copy from register to memory
	move	$fp,$sp                                   ; $fp=$sp;
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,68($fp)                                  ; $2=memory[$fp+68];store word;Copy from register to memory
	lui	$2,%hi($LC0)                
	addiu	$3,$fp,28                                   ;$3=$fp+28
	addiu	$2,$2,%lo($LC0)
	li	$4,40			# 0x28              ;$4=40
	move	$6,$4                                       ;move $6=$4
	move	$5,$2                                       ;move $5=$4
	move	$4,$3                                       ;move $4=$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2                                      ;move $25=$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)                                 ; $28=Memory[$fp+16];load store;Copy from memory to register
	sw	$0,24($fp)                                  ; $0=memory[$fp+24];store word;Copy from register to memory
	b	$L2
	nop

$L3:
	lw	$2,24($fp)                                  ; $2=Memory[$fp+24];load store;Copy from memory to register
	sll	$2,$2,2
	addiu	$3,$fp,72                                   ; $3=$fp+72 ; add immediate unsigned
	addu	$2,$3,$2                                    ; $2=$3+$2  ; add unsigned
	lw	$2,-44($2)                                  ; $2=Memory[$2-44];load store;Copy from memory to register
	addiu	$3,$2,3                                     ; $3=$2+3
	lw	$2,24($fp)                                  ; $2=Memory[$fp+24];load store;Copy from memory to register
	sll	$2,$2,2                                     ; shift left logical;
	addiu	$4,$fp,72                                   ; $4=$fp+72
	addu	$2,$4,$2                                    ; $2=$4+$2
	sw	$3,-44($2)                                  ; $3=memory[$2-44];store word;Copy from register to memory
	lw	$2,24($fp)                                  ; $2=Memory[$fp+24];load store;Copy from memory to register
	addiu	$2,$2,1
	sw	$2,24($fp)                                  ; $2=memory[$fp+24];store word;Copy from register to memory
$L2:
	lw	$2,24($fp)                                  ; $2=Memory[$fp+24];load store;Copy from memory to register
	slt	$2,$2,10
	bne	$2,$0,$L3
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,68($fp)                                  ; $4=Memory[$fp+68];load store;Copy from memory to register
	lw	$3,0($3)                                    ; $3=Memory[$3+0];load store;Copy from memory to register
	beq	$4,$3,$L5                                   ; branch on equal
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2                                      ; $25=$2;
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L5:
	move	$sp,$fp
	lw	$31,76($sp)                                 ; $31=Memory[$sp+76];load store;Copy from memory to register
	lw	$fp,72($sp)                                 ; $fp=Memory[$sp+72];load store;Copy from memory to register
	addiu	$sp,$sp,80                                  ; $sp=$sp+80;add immediate unsigned
	j	$31                                         ; jump ; go to address $31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
