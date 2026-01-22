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
	li x1, 5;
    li x2, 0;
    li x3, 0;
	
.loop:
	addi x2, x2, 1;
    beq x2, x1, write;
    beq x1, x1, loop;
.write:
	addi x3, x3, 1;
    sw x3, 0(x0);
    li x2, 0;
    beq x1, x1, loop;


	.size	main, .-main
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
