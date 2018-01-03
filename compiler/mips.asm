.data
	a: .space 40
	c: .space 80
	ErrorInfor: .asciiz "Something Wrong!"
	STRING0: .asciiz "shit"


.text
	jal main
	li $v0 10
	syscall


main:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	li $t0 0
	sw $t0 -4($fp)
	li $t0 1
	sw $t0 0($fp)
	lw $t2 -4($fp)
	mul $t2 $t2 4
	la $t1 a
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 0($fp)
	mul $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	li $t1 0
	bne $t0 $t1 label1

label1:
	lw $t0 0($fp)
	li $t1 1
	bne $t0 $t1 label2
	li $t0 1
	sw $t0 -8($fp)
	li $t0 1
	sw $t0 -4($fp)
	lw $t2 -8($fp)
	mul $t2 $t2 4
	la $t1 a
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	li $t1 2
	bne $t0 $t1 label3

label3:
	lw $t0 -4($fp)
	li $t1 666
	bne $t0 $t1 label4
	la $a0 STRING0
	li $v0 4
	syscall

label4:

label2:
	lw $t0 0($fp)
	li $t1 3
	bne $t0 $t1 label5

label5:
	li $v0 10
	syscall
ErrorDeal:
	la $a0 ErrorInfor
	li $v0 4
	syscall
