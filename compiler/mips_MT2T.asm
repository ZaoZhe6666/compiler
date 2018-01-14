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
	lw $s0 0($fp)
	move $t2 $s0
	li $t3 1
	sub $t0 $t2 $t3
	blez $t0 label1
	move $t3 $s0
	li $t4 1
	sub $t3 $t3 $t4
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -4($fp)
	sw $s0 0($fp)
	jal fib
	lw $t2 -4($fp)
	lw $s0 0($fp)
	move $t2 $s1
	move $t4 $s0
	li $t5 2
	sub $t4 $t4 $t5
	sw $t4 0($sp)
	subi $sp $sp 4
	sw $t2 -4($fp)
	sw $t3 -8($fp)
	sw $s0 0($fp)
	jal fib
	lw $t2 -4($fp)
	lw $t3 -8($fp)
	lw $s0 0($fp)
	move $t3 $s1
	add $t2 $t2 $t3
	li $t3 1
	li $t1 0
	mul $t3 $t3 $t1
	sub $t2 $t2 $t3
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label1:
	move $t2 $s0
	li $t3 0
	sub $t0 $t2 $t3
	bnez $t0 label2
	li $t2 1
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label2:
	move $t2 $s0
	li $t3 1
	sub $t0 $t2 $t3
	bnez $t0 label3
	li $t2 1
	move $s1 $t2
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
	li $t2 1
	beq $t2 $0 label4

label4:
	li $t2 0
	beq $t2 $0 label5

label5:
	li $t2 1
	beq $t2 $0 label6

label6:
	li $t3 2
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 0($fp)
	jal fib
	lw $t2 0($fp)
	move $t2 $s1
	beq $t2 $0 label7
	li $t3 3
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 0($fp)
	jal fib
	lw $t2 0($fp)
	move $t2 $s1
	li $t3 1
	add $t2 $t2 $t3
	beq $t2 $0 label8
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
	lw $s0 0($fp)
	lw $s2 -4($fp)
	lw $s3 -8($fp)
	move $t2 $s0
	move $s4 $t2
	move $t2 $s3
	move $s6 $t2
	move $t2 $s4
	move $s5 $t2

label9:
	move $t2 $s4
	move $t3 $s2
	add $t2 $t2 $t3
	move $s4 $t2
	move $t2 $s3
	li $t3 1
	sub $t2 $t2 $t3
	move $s3 $t2
	move $t2 $s3
	li $t3 0
	sub $t0 $t2 $t3
	bgtz $t0 label9

label10:
	move $t2 $s5
	li $t3 1
	sub $t2 $t2 $t3
	move $s5 $t2
	move $t2 $s5
	li $t3 0
	sub $t0 $t2 $t3
	bgtz $t0 label10
	move $t2 $s5
	li $t3 0
	sub $t0 $t2 $t3
	bnez $t0 label11
	move $t2 $s4
	move $t3 $s0
	move $t4 $s2
	move $t1 $s6
	mul $t4 $t4 $t1
	add $t3 $t3 $t4
	sub $t0 $t2 $t3
	bnez $t0 label12
	la $a0 STRING1
	li $v0 4
	syscall

label12:

label11:
	move $t2 $s4
	move $s1 $t2
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
	lw $s0 0($fp)
	move $t2 $s0
	li $t3 97
	sub $t0 $t2 $t3
	bnez $t0 label13
	li $t2 65
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	move $t2 $s0
	li $t3 98
	sub $t0 $t2 $t3
	bnez $t0 label14
	li $t2 66
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
	move $t2 $s0
	li $t3 99
	sub $t0 $t2 $t3
	bnez $t0 label15
	li $t2 67
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label15:
	move $t2 $s0
	li $t3 100
	sub $t0 $t2 $t3
	bnez $t0 label16
	li $t2 68
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label16:
	move $t2 $s0
	li $t3 101
	sub $t0 $t2 $t3
	bnez $t0 label17
	li $t2 69
	move $s1 $t2
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
	move $s0 $v0
	li $v0 12
	syscall
	move $s2 $v0
	move $t2 $s0
	li $t1 0
	bne $t2 $t1 label18
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label18:
	li $t1 1
	bne $t2 $t1 label19
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label19:
	li $t1 2
	bne $t2 $t1 label20
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label20:
	li $t1 3
	bne $t2 $t1 label21
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label21:
	li $t1 4
	bne $t2 $t1 label22
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label22:
	li $t1 5
	bne $t2 $t1 label23
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label23:
	li $t1 6
	bne $t2 $t1 label24
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label24:
	li $t1 7
	bne $t2 $t1 label25
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label25:
	li $t1 8
	bne $t2 $t1 label26
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label26:
	li $t1 9
	bne $t2 $t1 label27
	move $t2 $s0
	move $t3 $s2
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label27:
	move $t2 $s2
	li $t1 97
	bne $t2 $t1 label28
	move $t3 $s2
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	jal mytoupper
	lw $t2 -8($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	move $t2 $s1
	move $a0 $t2
	li $v0 11
	syscall

label28:
	li $t1 98
	bne $t2 $t1 label29
	move $t3 $s2
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	jal mytoupper
	lw $t2 -8($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	move $t2 $s1
	move $a0 $t2
	li $v0 11
	syscall

label29:
	li $t1 99
	bne $t2 $t1 label30
	move $t3 $s2
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	jal mytoupper
	lw $t2 -8($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	move $t2 $s1
	move $a0 $t2
	li $v0 11
	syscall

label30:
	li $t1 100
	bne $t2 $t1 label31
	move $t3 $s2
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	jal mytoupper
	lw $t2 -8($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	move $t2 $s1
	move $a0 $t2
	li $v0 11
	syscall

label31:
	li $t1 101
	bne $t2 $t1 label32
	move $t3 $s2
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	jal mytoupper
	lw $t2 -8($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	move $t2 $s1
	move $a0 $t2
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
	li $t2 0
	move $s0 $t2
	li $t2 0
	move $s3 $t2

label33:
	move $t2 $s0
	move $t4 $s3
	li $t3 1
	mul $t0 $t4 4
	la $t1 _global_char_arr
	add $t1 $t1 $t0
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	add $t2 $t2 $t3
	move $s0 $t2
	move $t2 $s3
	li $t3 1
	add $t2 $t2 $t3
	move $s3 $t2
	move $t2 $s3
	li $t3 10
	sub $t0 $t2 $t3
	bltz $t0 label33
	move $t2 $s0
	li $t1 10
	div $t2 $t2 $t1
	move $s2 $t2
	li $t2 0
	move $s3 $t2
	move $t2 $s2
	sw $t2 _global_int($0)
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
	li $t2 0
	move $s0 $t2

label34:
	move $t2 $s0
	li $t3 97
	mul $t1 $t2 4
	la $t0 _global_char_arr
	add $t0 $t0 $t1
	sw $t3 0($t0)
	move $t2 $s0
	li $t3 1
	add $t2 $t2 $t3
	move $s0 $t2
	move $t2 $s0
	li $t3 10
	sub $t0 $t2 $t3
	bltz $t0 label34
	sw $t2 -4($fp)
	sw $t3 -8($fp)
	sw $s0 0($fp)
	jal setaverage
	lw $t2 -4($fp)
	lw $t3 -8($fp)
	lw $s0 0($fp)
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
	sw $s0 0($fp)
	sw $s2 -4($fp)
	sw $s3 -8($fp)
	jal if_test
	lw $s0 0($fp)
	lw $s2 -4($fp)
	lw $s3 -8($fp)
	la $a0 STRING3
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $s0 $v0
	li $v0 5
	syscall
	move $s2 $v0
	li $v0 5
	syscall
	move $s3 $v0
	move $t3 $s0
	sw $t3 0($sp)
	subi $sp $sp 4
	move $t3 $s2
	sw $t3 0($sp)
	subi $sp $sp 4
	move $t3 $s3
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -12($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	sw $s3 -8($fp)
	jal loop_test
	lw $t2 -12($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	lw $s3 -8($fp)
	move $t2 $s1
	move $s0 $t2
	sw $t2 -12($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	sw $s3 -8($fp)
	jal case_test
	lw $t2 -12($fp)
	lw $s0 0($fp)
	lw $s2 -4($fp)
	lw $s3 -8($fp)
	sw $s0 0($fp)
	sw $s2 -4($fp)
	sw $s3 -8($fp)
	jal array_test
	lw $s0 0($fp)
	lw $s2 -4($fp)
	lw $s3 -8($fp)
	lw $t2 _global_int($0)
	li $t3 97
	sub $t0 $t2 $t3
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
