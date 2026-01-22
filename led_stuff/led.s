	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-24(s0)
	sw	zero,-28(s0)
	sw	zero,-20(s0)
.L3:
	lw	a4,-24(s0)
	li	a5,99999744
	addi	a5,a5,256
	bne	a4,a5,.L2
	sw	zero,-24(s0)
	lw	a5,-28(s0)
	seqz	a5,a5
	andi	a5,a5,0xff
	sw	a5,-28(s0)
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	sw	a4,0(a5)
.L2:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	j	.L3
	.size	main, .-main
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
