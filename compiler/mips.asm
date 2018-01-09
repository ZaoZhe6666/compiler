.data
	a: .space 40
	c: .space 80
	ErrorInfor: .asciiz "Something Wrong!"


.text
	jal main
	li $v0 10
	syscall


main:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	li $t0 3
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 -1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	li $t0 4
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 -1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 7
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	li $t0 3
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 -1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	li $t0 4
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 -1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 7
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	li $v0 10
	syscall
ErrorDeal:
	la $a0 ErrorInfor
	li $v0 4
	syscall
