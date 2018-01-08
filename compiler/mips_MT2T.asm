.data
	cst1: .word 1
	cst2: .word 2
	cst3: .word 3
	csta: .word 97
	cstb: .word 98
	cstc: .word 99
	g_a: .word 0
	g_b: .word 0
	g_arr: .space 8192
	g_stra: .space 4096
	g_strb: .space 8192
	ErrorInfor: .asciiz "Something Wrong!"
	STRING0: .asciiz "define test passed"
	STRING1: .asciiz "operator test passed"
	STRING2: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"
	STRING3: .asciiz "!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
	STRING4: .asciiz "dowhile test passed"
	STRING5: .asciiz "ifcondition clause error!"
	STRING6: .asciiz "ifcondition clause error"
	STRING7: .asciiz "switchcodintion clause  error!"
	STRING8: .asciiz "switchcodintion clause  error!"
	STRING9: .asciiz "error 0"
	STRING10: .asciiz "error 1"
	STRING11: .asciiz "error 2"
	STRING12: .asciiz "condition test passed"
	STRING13: .asciiz "miscellaneous test passed"
	STRING14: .asciiz "Fibonaci: Please input a unsigned positive integer ?"
	STRING15: .asciiz "Input error, try again:"
	STRING16: .asciiz "The fibonaci's answer is "
	STRING17: .asciiz "GCD: Please input two unsigned positive integer ?"
	STRING18: .asciiz "Input error, try Again: "
	STRING19: .asciiz "The gcd's answer is "
	STRING20: .asciiz "1"
	STRING21: .asciiz "*"
	STRING22: .asciiz "*"
	STRING23: .asciiz "prime_factorization: Please input a unsigned positive integer(<2^31-1) ?"
	STRING24: .asciiz "Input error, try again:"
	STRING25: .asciiz "The factor of n is "
	STRING26: .asciiz "Please input Test Type:E(Easy), (M)Middle, H(Hard): "
	STRING27: .asciiz "Try Again: "


.text
	jal main
	li $v0 10
	syscall


const_define:
	subi $sp $sp 44
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 44
	li $t0 1
	sw $t0 0($fp)
	li $t0 0
	sw $t0 -4($fp)
	li $t0 -1
	sw $t0 -8($fp)
	li $t0 120
	sw $t0 -12($fp)
	li $t0 122
	sw $t0 -16($fp)
	li $t0 65
	sw $t0 -20($fp)
	li $t0 49
	sw $t0 -24($fp)
	li $t0 47
	sw $t0 -28($fp)
	lw $t1 0($fp)
	move $t3 $t1
	move $a0 $t3
	li $v0 1
	syscall
	lw $t1 -28($fp)
	move $t3 $t1
	move $a0 $t3
	li $v0 11
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


const_define_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal const_define
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


var_define:
	subi $sp $sp 88
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 88
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


var_define_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal var_define
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


define:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	li $t0 1
	sw $t0 0($fp)
	li $t0 122
	sw $t0 -4($fp)
	li $t0 65
	sw $t0 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


define_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal var_define_test
	jal const_define_test
	jal define
	la $a0 STRING0
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


operator:
	subi $sp $sp 48
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 48
	li $t3 1
	move $t0 $t3
	sw $t0 0($fp)
	li $t3 1
	li $t4 2
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)
	li $t3 3
	li $t1 1
	mul $t3 $t3 $t1
	move $t0 $t3
	sw $t0 -8($fp)
	li $t3 -1
	li $t1 4
	mul $t3 $t3 $t1
	move $t0 $t3
	sw $t0 -12($fp)
	li $t3 5
	move $t0 $t3
	sw $t0 -16($fp)
	li $t3 6
	move $t0 $t3
	sw $t0 -20($fp)
	lw $t1 -4($fp)
	move $t4 $t1
	li $t1 3
	mul $t4 $t4 $t1
	move $t3 $t4
	lw $t1 -8($fp)
	move $t4 $t1
	add $t3 $t3 $t4
	lw $t1 -12($fp)
	move $t4 $t1
	li $t1 4
	div $t4 $t4 $t1
	sub $t3 $t3 $t4
	lw $t1 0($fp)
	move $t4 $t1
	lw $t1 0($fp)
	div $t4 $t4 $t1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 0($fp)
	li $t3 0
	lw $t1 0($fp)
	move $t4 $t1
	add $t3 $t3 $t4
	lw $t1 0($fp)
	move $t5 $t1
	li $t1 3
	mul $t5 $t5 $t1
	move $t4 $t5
	add $t3 $t3 $t4
	lw $t1 -8($fp)
	move $t4 $t1
	add $t3 $t3 $t4
	lw $t1 -12($fp)
	move $t4 $t1
	li $t1 4
	div $t4 $t4 $t1
	sub $t3 $t3 $t4
	lw $t1 -16($fp)
	move $t4 $t1
	lw $t1 -20($fp)
	mul $t4 $t4 $t1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)
	li $t3 -1
	lw $t1 0($fp)
	move $t4 $t1
	mul $t3 $t3 $t4
	lw $t1 -4($fp)
	move $t4 $t1
	li $t1 0
	mul $t4 $t4 $t1
	add $t3 $t3 $t4
	li $t5 1
	li $t6 0
	sub $t5 $t5 $t6
	move $t4 $t5
	sub $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -16($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


operator_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal operator
	la $a0 STRING1
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


string:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	la $a0 STRING2
	li $v0 4
	syscall
	la $a0 STRING3
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


string_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal string
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


dowhile:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	li $t3 100
	move $t0 $t3
	sw $t0 0($fp)

label1:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 50
	sub $t0 $t3 $t4
	bltz $t0 label2
	lw $t1 0($fp)
	move $t3 $t1
	li $t1 2
	div $t3 $t3 $t1
	move $t0 $t3
	sw $t0 0($fp)

label2:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 50
	sub $t0 $t3 $t4
	bgez $t0 label3
	lw $t1 0($fp)
	move $t4 $t1
	li $t5 10
	add $t4 $t4 $t5
	move $t3 $t4
	li $t1 10
	div $t3 $t3 $t1
	move $t0 $t3
	sw $t0 0($fp)

label3:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 10
	sub $t0 $t3 $t4
	bgez $t0 label1

label4:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t3 $t3 $t4
	move $t0 $t3
	sw $t0 0($fp)
	la $a0 STRING4
	li $v0 4
	syscall
	li $t3 0
	move $t0 $t3
	bne $t0 $0 label4
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


dowhile_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal dowhile
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


ifcondition:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	li $t3 1
	move $t0 $t3
	sw $t0 0($fp)
	li $t3 0
	move $t0 $t3
	sw $t0 -4($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	bnez $t0 label5
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label5:
	li $t3 2
	move $t0 $t3
	sw $t0 0($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	blez $t0 label6
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label6:
	li $t3 0
	move $t0 $t3
	sw $t0 0($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	bgez $t0 label7
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label7:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	beqz $t0 label8
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label8:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bltz $t0 label9
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label9:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bgtz $t0 label10
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label10:
	lw $t1 -4($fp)
	move $t3 $t1
	li $t5 1
	li $t6 1
	add $t5 $t5 $t6
	li $t6 1
	add $t5 $t5 $t6
	li $t6 1
	li $t1 3
	mul $t6 $t6 $t1
	add $t5 $t5 $t6
	move $t4 $t5
	sub $t0 $t3 $t4
	beqz $t0 label11
	la $a0 STRING5
	li $v0 4
	syscall

label11:
	lw $t1 -4($fp)
	move $t3 $t1
	lw $t1 -4($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	beqz $t0 label12
	la $a0 STRING6
	li $v0 4
	syscall

label12:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


switchcodintionans:
	subi $sp $sp 12
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 16
	lw $t1 0($fp)
	move $t3 $t1
	move $t0 $t3
	li $t1 1
	bne $t0 $t1 label13
	li $t3 2
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	move $t0 $t3
	li $t1 2
	bne $t0 $t1 label14
	li $t3 3
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
	move $t0 $t3
	li $t1 3
	bne $t0 $t1 label15
	li $t3 4
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label15:
	li $t3 5
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


switchcodintion:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	li $t3 1
	move $t0 $t3
	sw $t0 0($fp)
	li $t3 0
	move $t0 $t3
	sw $t0 -4($fp)

label16:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	lw $t1 0($fp)
	move $t5 $t1
	move $t0 $t5
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -8($fp)
	sw $t4 -12($fp)
	sw $t5 -16($fp)
	jal switchcodintionans
	lw $t3 -8($fp)
	lw $t4 -12($fp)
	lw $t5 -16($fp)
	move $t4 $s1
	sub $t0 $t3 $t4
	bnez $t0 label17
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)

label17:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 0($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 5
	sub $t0 $t3 $t4
	bltz $t0 label16
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 4
	sub $t0 $t3 $t4
	beqz $t0 label18
	la $a0 STRING7
	li $v0 4
	syscall

label18:
	lw $t1 -4($fp)
	move $t3 $t1
	move $t0 $t3
	beq $t0 $0 label19
	lw $t1 0($fp)
	move $t3 $t1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label19:
	la $a0 STRING7
	li $v0 4
	syscall
	j ErrorDeal


condition:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	li $t0 5
	sw $t0 0($fp)
	li $t3 0
	move $t0 $t3
	sw $t0 -4($fp)

label20:
	lw $t1 -4($fp)
	move $t3 $t1
	move $t0 $t3
	li $t1 0
	bne $t0 $t1 label21
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	beqz $t0 label22
	la $a0 STRING9
	li $v0 4
	syscall

label22:

label21:
	move $t0 $t3
	li $t1 1
	bne $t0 $t1 label23
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	beqz $t0 label24
	la $a0 STRING10
	li $v0 4
	syscall

label24:

label23:
	move $t0 $t3
	li $t1 2
	bne $t0 $t1 label25
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 2
	sub $t0 $t3 $t4
	beqz $t0 label26
	la $a0 STRING11
	li $v0 4
	syscall

label26:

label25:
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	move $t3 $t1
	lw $t1 0($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bltz $t0 label20
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


condition_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal ifcondition
	jal switchcodintion
	jal condition
	la $a0 STRING12
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


miscellaneous:
	subi $sp $sp 1156
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 1156
	li $t3 1
	move $t0 $t3
	sw $t0 0($fp)
	li $t3 2
	move $t0 $t3
	sw $t0 -4($fp)
	li $t3 0
	move $t0 $t3
	sw $t0 -100($fp)

label27:
	lw $t1 -100($fp)
	move $t3 $t1
	lw $t1 -100($fp)
	move $t5 $t1
	move $t1 $t3
	mul $t1 $t1 4
	li $t0 -8
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	move $t2 $t5
	sw $t2 0($t0)
	lw $t1 -100($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -100($fp)
	lw $t1 -100($fp)
	move $t3 $t1
	li $t4 23
	sub $t0 $t3 $t4
	bltz $t0 label27
	li $t3 97
	move $t0 $t3
	sw $t0 -108($fp)
	li $t3 127
	move $t0 $t3
	sw $t0 -100($fp)
	lw $t1 -100($fp)
	move $t3 $t1
	move $t0 $t3
	sw $t0 -104($fp)
	li $t3 0
	move $t0 $t3
	sw $t0 0($fp)

label28:
	lw $t1 0($fp)
	move $t4 $t1
	li $t1 1
	mul $t4 $t4 $t1
	lw $t1 0($fp)
	move $t5 $t1
	sub $t4 $t4 $t5
	li $t5 1
	sub $t4 $t4 $t5
	li $t5 2
	li $t1 1
	div $t5 $t5 $t1
	add $t4 $t4 $t5
	li $t5 1
	sub $t4 $t4 $t5
	move $t3 $t4
	li $t1 2
	div $t3 $t3 $t1
	li $t5 97
	move $t1 $t3
	mul $t1 $t1 4
	li $t0 -112
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	move $t2 $t5
	sw $t2 0($t0)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 0($fp)
	lw $t1 0($fp)
	move $t3 $t1
	lw $t1 -104($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bltz $t0 label28
	li $t4 0
	li $t3 1
	move $t2 $t4
	mul $t2 $t2 4
	li $t1 -112
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t4 97
	sub $t0 $t3 $t4
	bnez $t0 label29
	la $a0 STRING13
	li $v0 4
	syscall

label29:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


miscellaneous_test:
	subi $sp $sp 8
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 8
	jal miscellaneous
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


fibonaci:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	lw $t1 0($fp)
	move $t3 $t1
	move $t0 $t3
	li $t1 0
	bne $t0 $t1 label30
	li $t3 0
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label30:
	move $t0 $t3
	li $t1 1
	bne $t0 $t1 label31
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label31:
	move $t0 $t3
	li $t1 2
	bne $t0 $t1 label32
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label32:
	lw $t1 0($fp)
	move $t4 $t1
	li $t5 1
	sub $t4 $t4 $t5
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -4($fp)
	sw $t4 -8($fp)
	sw $t5 -12($fp)
	jal fibonaci
	lw $t3 -4($fp)
	lw $t4 -8($fp)
	lw $t5 -12($fp)
	move $t3 $s1
	lw $t1 0($fp)
	move $t5 $t1
	li $t6 2
	sub $t5 $t5 $t6
	move $t0 $t5
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -4($fp)
	sw $t4 -8($fp)
	sw $t5 -12($fp)
	sw $t6 -16($fp)
	jal fibonaci
	lw $t3 -4($fp)
	lw $t4 -8($fp)
	lw $t5 -12($fp)
	lw $t6 -16($fp)
	move $t4 $s1
	add $t3 $t3 $t4
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


fibonaci_test:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	la $a0 STRING14
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label33:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bgez $t0 label34
	la $a0 STRING15
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label34:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bltz $t0 label35
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -4($fp)
	sw $t4 -8($fp)
	jal fibonaci
	lw $t3 -4($fp)
	lw $t4 -8($fp)
	move $t3 $s1
	la $a0 STRING16
	li $v0 4
	syscall
	move $a0 $t3
	li $v0 1
	syscall

label35:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bltz $t0 label33
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


mod:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	lw $t1 0($fp)
	move $t3 $t1
	lw $t1 0($fp)
	move $t4 $t1
	lw $t1 -4($fp)
	div $t4 $t4 $t1
	lw $t1 -4($fp)
	mul $t4 $t4 $t1
	sub $t3 $t3 $t4
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


gcd:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	li $t3 0
	move $t0 $t3
	sw $t0 -8($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bnez $t0 label36
	lw $t1 -4($fp)
	move $t3 $t1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label36:
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bnez $t0 label37
	lw $t1 0($fp)
	move $t3 $t1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label37:
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 0($fp)
	move $t5 $t1
	move $t0 $t5
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t5 $t1
	move $t0 $t5
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -12($fp)
	sw $t4 -16($fp)
	sw $t5 -20($fp)
	jal mod
	lw $t3 -12($fp)
	lw $t4 -16($fp)
	lw $t5 -20($fp)
	move $t4 $s1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -12($fp)
	sw $t4 -16($fp)
	jal gcd
	lw $t3 -12($fp)
	lw $t4 -16($fp)
	move $t3 $s1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


iswronggcd:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bgtz $t0 label38
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label38:
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bgtz $t0 label39
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label39:
	li $t3 0
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


gcd_test:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	la $a0 STRING17
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -8($fp)
	sw $t4 -12($fp)
	jal iswronggcd
	lw $t3 -8($fp)
	lw $t4 -12($fp)
	move $t3 $s1
	move $t0 $t3
	beq $t0 $0 label40

label41:
	la $a0 STRING18
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -8($fp)
	sw $t4 -12($fp)
	jal iswronggcd
	lw $t3 -8($fp)
	lw $t4 -12($fp)
	move $t3 $s1
	move $t0 $t3
	bne $t0 $0 label41

label40:
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -8($fp)
	sw $t4 -12($fp)
	jal gcd
	lw $t3 -8($fp)
	lw $t4 -12($fp)
	move $t3 $s1
	la $a0 STRING19
	li $v0 4
	syscall
	move $a0 $t3
	li $v0 1
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


is_prime:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	li $t3 2
	move $t0 $t3
	sw $t0 -4($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 2
	sub $t0 $t3 $t4
	bnez $t0 label42
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label42:

label43:
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -8($fp)
	sw $t4 -12($fp)
	jal mod
	lw $t3 -8($fp)
	lw $t4 -12($fp)
	move $t3 $s1
	li $t4 0
	sub $t0 $t3 $t4
	bnez $t0 label44
	li $t3 0
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label44:
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	move $t3 $t1
	lw $t1 -4($fp)
	mul $t3 $t3 $t1
	lw $t1 0($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bltz $t0 label43
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


prime_factorization:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	li $t3 2
	move $t0 $t3
	sw $t0 -4($fp)
	li $t3 0
	move $t0 $t3
	sw $t0 -8($fp)
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	bnez $t0 label45
	la $a0 STRING20
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label45:

label46:
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -12($fp)
	sw $t4 -16($fp)
	jal is_prime
	lw $t3 -12($fp)
	lw $t4 -16($fp)
	move $t3 $s1
	li $t4 1
	sub $t0 $t3 $t4
	bnez $t0 label47
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -12($fp)
	sw $t4 -16($fp)
	jal mod
	lw $t3 -12($fp)
	lw $t4 -16($fp)
	move $t3 $s1
	li $t4 0
	sub $t0 $t3 $t4
	bnez $t0 label48

label49:
	lw $t1 0($fp)
	move $t3 $t1
	lw $t1 -4($fp)
	div $t3 $t3 $t1
	move $t0 $t3
	sw $t0 0($fp)
	lw $t1 -8($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	bnez $t0 label50
	la $a0 STRING21
	li $v0 4
	syscall

label50:
	li $t3 1
	move $t0 $t3
	sw $t0 -8($fp)
	lw $t1 -4($fp)
	move $t3 $t1
	move $a0 $t3
	li $v0 1
	syscall
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -12($fp)
	sw $t4 -16($fp)
	jal mod
	lw $t3 -12($fp)
	lw $t4 -16($fp)
	move $t3 $s1
	li $t4 0
	sub $t0 $t3 $t4
	beqz $t0 label49

label48:

label47:
	lw $t1 -4($fp)
	move $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	move $t0 $t3
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	move $t3 $t1
	lw $t1 -4($fp)
	mul $t3 $t3 $t1
	lw $t1 0($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bltz $t0 label46
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	beqz $t0 label51
	lw $t1 -8($fp)
	move $t3 $t1
	li $t4 1
	sub $t0 $t3 $t4
	bnez $t0 label52
	la $a0 STRING21
	li $v0 4
	syscall

label52:
	lw $t1 0($fp)
	move $t3 $t1
	move $a0 $t3
	li $v0 1
	syscall

label51:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


prime_factorization_test:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	la $a0 STRING23
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label53:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bgez $t0 label54
	la $a0 STRING15
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label54:
	lw $t1 0($fp)
	move $t3 $t1
	li $t4 0
	sub $t0 $t3 $t4
	bltz $t0 label53
	la $a0 STRING25
	li $v0 4
	syscall
	lw $t1 0($fp)
	move $t3 $t1
	move $t0 $t3
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -4($fp)
	sw $t4 -8($fp)
	jal prime_factorization
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


iswrong:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	li $t3 69
	lw $t1 0($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bnez $t0 label55
	li $t3 0
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label55:
	li $t3 77
	lw $t1 0($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bnez $t0 label56
	li $t3 0
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label56:
	li $t3 72
	lw $t1 0($fp)
	move $t4 $t1
	sub $t0 $t3 $t4
	bnez $t0 label57
	li $t3 0
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label57:
	li $t3 1
	move $s1 $t3
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


main:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	la $a0 STRING26
	li $v0 4
	syscall
	li $v0 12
	syscall
	sw $v0 0($fp)
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -4($fp)
	sw $t4 -8($fp)
	jal iswrong
	lw $t3 -4($fp)
	lw $t4 -8($fp)
	move $t3 $s1
	move $t0 $t3
	beq $t0 $0 label58

label59:
	la $a0 STRING27
	li $v0 4
	syscall
	li $v0 12
	syscall
	sw $v0 0($fp)
	lw $t1 0($fp)
	move $t4 $t1
	move $t0 $t4
	sw $t0 0($sp)
	subi $sp $sp 4
	sw $t3 -4($fp)
	sw $t4 -8($fp)
	jal iswrong
	lw $t3 -4($fp)
	lw $t4 -8($fp)
	move $t3 $s1
	move $t0 $t3
	bne $t0 $0 label59

label58:
	lw $t1 0($fp)
	move $t3 $t1
	move $t0 $t3
	li $t1 69
	bne $t0 $t1 label60
	sw $t3 -4($fp)
	jal define_test
	sw $t3 -4($fp)
	jal operator_test
	sw $t3 -4($fp)
	jal fibonaci_test

label60:
	move $t0 $t3
	li $t1 77
	bne $t0 $t1 label61
	sw $t3 -4($fp)
	jal dowhile_test
	sw $t3 -4($fp)
	jal condition_test
	sw $t3 -4($fp)
	jal string_test
	sw $t3 -4($fp)
	jal gcd_test

label61:
	move $t0 $t3
	li $t1 72
	bne $t0 $t1 label62
	sw $t3 -4($fp)
	jal define_test
	sw $t3 -4($fp)
	jal operator_test
	sw $t3 -4($fp)
	jal dowhile_test
	sw $t3 -4($fp)
	jal condition_test
	sw $t3 -4($fp)
	jal string_test
	sw $t3 -4($fp)
	jal miscellaneous_test
	sw $t3 -4($fp)
	jal prime_factorization_test

label62:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	li $v0 10
	syscall
ErrorDeal:
	la $a0 ErrorInfor
	li $v0 4
	syscall
