.data
	_global_constint: .word 7
	_message_to_the_world: .word 42
	_global_int_arr: .space 40
	_global_int: .word 0
	_global_char_arr: .space 40
	_global_char: .word 0
	ErrorInfor: .asciiz "Something Wrong!"
	STRING0: .asciiz "if test  ok"
	STRING1: .asciiz "loop test ok"
	STRING2: .asciiz "please input int(0-9) & char values(a-e):"
	STRING3: .asciiz "please input 3 int(the 3rd int must >0):"
	STRING4: .asciiz "passed"


.text
	jal main
	li $v0 10
	syscall


fib:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	blez $t0 label1
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 -4($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	li $t0 2
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label1:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label2
	li $t0 1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label2:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label3
	li $t0 1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label3:
	j ErrorDeal


if_test:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 16
	li $t0 1
	sw $t0 0($fp)
	lw $t0 0($fp)
	beq $t0 $0 label4

label4:
	li $t0 0
	sw $t0 0($fp)
	lw $t0 0($fp)
	beq $t0 $0 label5

label5:
	li $t0 1
	sw $t0 0($fp)
	lw $t0 0($fp)
	beq $t0 $0 label6

label6:
	li $t0 2
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 0($fp)
	lw $t0 0($fp)
	beq $t0 $0 label7
	li $t0 3
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 0($fp)
	li $t0 1
	sw $t0 -4($fp)
	lw $t0 0($fp)
	lw $t1 -4($fp)
	add $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	beq $t0 $0 label8
	la $a0 STRING0
	li $v0 4
	syscall

label8:

label7:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


loop_test:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 44
	lw $t1 0($fp)
	sw $t1 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -12($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -20($fp)
	lw $t1 -12($fp)
	sw $t1 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -16($fp)

label9:
	lw $t1 -12($fp)
	sw $t1 -24($fp)
	lw $t1 -4($fp)
	sw $t1 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -12($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	li $t0 0
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label9

label10:
	lw $t1 -16($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -16($fp)
	lw $t1 -16($fp)
	sw $t1 -24($fp)
	li $t0 0
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label10
	lw $t1 -16($fp)
	sw $t1 -24($fp)
	li $t0 0
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	bnez $t0 label11
	lw $t1 -12($fp)
	sw $t1 -24($fp)
	lw $t1 0($fp)
	sw $t1 -28($fp)
	lw $t1 -4($fp)
	sw $t1 -32($fp)
	lw $t0 -32($fp)
	lw $t1 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	add $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	bnez $t0 label12
	la $a0 STRING1
	li $v0 4
	syscall

label12:

label11:
	lw $t1 -12($fp)
	sw $t1 -24($fp)
	lw $s1 -24($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


mytoupper:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 97
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label13
	li $t0 65
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 98
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label14
	li $t0 66
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 99
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label15
	li $t0 67
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label15:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 100
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label16
	li $t0 68
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label16:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 101
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label17
	li $t0 69
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label17:
	j ErrorDeal


case_test:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	la $a0 STRING2
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)
	li $v0 12
	syscall
	sw $v0 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	bne $t0 $t1 label18
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label18:
	lw $t0 -8($fp)
	li $t1 1
	bne $t0 $t1 label19
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label19:
	lw $t0 -8($fp)
	li $t1 2
	bne $t0 $t1 label20
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label20:
	lw $t0 -8($fp)
	li $t1 3
	bne $t0 $t1 label21
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label21:
	lw $t0 -8($fp)
	li $t1 4
	bne $t0 $t1 label22
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label22:
	lw $t0 -8($fp)
	li $t1 5
	bne $t0 $t1 label23
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label23:
	lw $t0 -8($fp)
	li $t1 6
	bne $t0 $t1 label24
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label24:
	lw $t0 -8($fp)
	li $t1 7
	bne $t0 $t1 label25
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label25:
	lw $t0 -8($fp)
	li $t1 8
	bne $t0 $t1 label26
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label26:
	lw $t0 -8($fp)
	li $t1 9
	bne $t0 $t1 label27
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall

label27:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	li $t1 97
	bne $t0 $t1 label28
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mytoupper
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 11
	syscall

label28:
	lw $t0 -8($fp)
	li $t1 98
	bne $t0 $t1 label29
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mytoupper
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 11
	syscall

label29:
	lw $t0 -8($fp)
	li $t1 99
	bne $t0 $t1 label30
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mytoupper
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 11
	syscall

label30:
	lw $t0 -8($fp)
	li $t1 100
	bne $t0 $t1 label31
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mytoupper
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 11
	syscall

label31:
	lw $t0 -8($fp)
	li $t1 101
	bne $t0 $t1 label32
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mytoupper
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 11
	syscall

label32:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


setaverage:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	li $t0 0
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 0($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)

label33:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t1 -8($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	mul $t0 $t0 4
	la $t1 _global_char_arr
	add $t1 $t1 $t0
	lw $t1 0($t1)
	lw $t0 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 0($fp)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 10
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bltz $t0 label33
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	li $t1 10
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 _global_int($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


array_test:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	li $t0 0
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label34:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 97
	sw $t0 -8($fp)
	lw $t1 -4($fp)
	mul $t1 $t1 4
	la $t0 _global_char_arr
	add $t0 $t0 $t1
	lw $t1 -8($fp)
	sw $t1 0($t0)
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 10
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bltz $t0 label34
	jal setaverage
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


main:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	jal if_test
	la $a0 STRING3
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	li $v0 5
	syscall
	sw $v0 -8($fp)
	lw $t1 0($fp)
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal loop_test
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 0($fp)
	jal case_test
	jal array_test
	lw $t1 _global_int($0)
	sw $t1 -12($fp)
	li $t0 97
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label35
	la $a0 STRING4
	li $v0 4
	syscall

label35:
	li $v0 10
	syscall
ErrorDeal:
	la $a0 ErrorInfor
	li $v0 4
	syscall
