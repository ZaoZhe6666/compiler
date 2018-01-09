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
	li $t3 3
	li $t1 -1
	mul $t3 $t3 $t1
	li $t1 2
	mul $t3 $t3 $t1
	li $t4 4
	li $t1 -1
	mul $t4 $t4 $t1
	li $t1 7
	div $t4 $t4 $t1
	sub $t3 $t3 $t4
	move $t0 $t3
	sw $t0 0($fp)
	li $t3 3
	li $t1 -1
	mul $t3 $t3 $t1
	li $t1 2
	mul $t3 $t3 $t1
	li $t4 4
	li $t1 -1
	mul $t4 $t4 $t1
	li $t1 7
	div $t4 $t4 $t1
	sub $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)
	li $v0 10
	syscall
ErrorDeal:
	la $a0 ErrorInfor
	li $v0 4
	syscall
