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
	sw $t1 -32($fp)
	lw $t0 -32($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 -28($fp)
	sw $t1 -32($fp)
	lw $t0 -32($fp)
	move $a0 $t0
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
	li $t0 1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 0($fp)
	li $t0 1
	sw $t0 -24($fp)
	li $t0 2
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -4($fp)
	li $t0 3
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -8($fp)
	li $t0 -1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 4
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -12($fp)
	li $t0 5
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -16($fp)
	li $t0 6
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	sw $t0 -24($fp)
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -12($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 4
	div $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 0($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	lw $t1 0($fp)
	div $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 0($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t1 0($fp)
	sw $t1 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 0($fp)
	sw $t1 -32($fp)
	lw $t0 -32($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -32($fp)
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -12($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 4
	div $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -16($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -4($fp)
	li $t0 -1
	sw $t0 -24($fp)
	lw $t1 0($fp)
	sw $t1 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -4($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	li $t0 1
	sw $t0 -32($fp)
	li $t0 0
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	sub $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -32($fp)
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -16($fp)
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
	li $t0 100
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label1:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 50
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bltz $t0 label2
	lw $t1 0($fp)
	sw $t1 -4($fp)
	lw $t0 -4($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label2:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 50
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bgez $t0 label3
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 10
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	li $t1 10
	div $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label3:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 10
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bgez $t0 label1

label4:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)
	la $a0 STRING4
	li $v0 4
	syscall
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
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
	li $t0 1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label5
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label5:
	li $t0 2
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	blez $t0 label6
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label6:
	li $t0 0
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bgez $t0 label7
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label7:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	beqz $t0 label8
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label8:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bltz $t0 label9
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label9:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label10
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label10:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -16($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	beqz $t0 label11
	la $a0 STRING5
	li $v0 4
	syscall

label11:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
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
	sw $t1 -4($fp)
	lw $t0 -4($fp)
	li $t1 1
	bne $t0 $t1 label13
	li $t0 2
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	lw $t0 -4($fp)
	li $t1 2
	bne $t0 $t1 label14
	li $t0 3
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
	lw $t0 -4($fp)
	li $t1 3
	bne $t0 $t1 label15
	li $t0 4
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label15:
	li $t0 5
	sw $t0 -4($fp)
	lw $s1 -4($fp)
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
	li $t0 1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label16:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 0($fp)
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal switchcodintionans
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label17
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label17:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 5
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bltz $t0 label16
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 4
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	beqz $t0 label18
	la $a0 STRING7
	li $v0 4
	syscall

label18:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label19
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
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
	li $t0 0
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label20:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	bne $t0 $t1 label21
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	beqz $t0 label22
	la $a0 STRING9
	li $v0 4
	syscall

label22:

label21:
	lw $t0 -8($fp)
	li $t1 1
	bne $t0 $t1 label23
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	beqz $t0 label24
	la $a0 STRING10
	li $v0 4
	syscall

label24:

label23:
	lw $t0 -8($fp)
	li $t1 2
	bne $t0 $t1 label25
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 2
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	beqz $t0 label26
	la $a0 STRING11
	li $v0 4
	syscall

label26:

label25:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
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
	li $t0 1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 0($fp)
	li $t0 2
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -100($fp)

label27:
	lw $t1 -100($fp)
	sw $t1 -1136($fp)
	lw $t1 -100($fp)
	sw $t1 -1144($fp)
	lw $t1 -1136($fp)
	mul $t1 $t1 4
	li $t0 -8
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1144($fp)
	sw $t2 0($t0)
	lw $t1 -100($fp)
	sw $t1 -1136($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -100($fp)
	lw $t1 -100($fp)
	sw $t1 -1136($fp)
	li $t0 23
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	sub $t0 $t0 $t1
	bltz $t0 label27
	li $t0 97
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -108($fp)
	li $t0 127
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -100($fp)
	lw $t1 -100($fp)
	sw $t1 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -104($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 0($fp)

label28:
	lw $t1 0($fp)
	sw $t1 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t1 0($fp)
	sw $t1 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	sub $t0 $t0 $t1
	sw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	sub $t0 $t0 $t1
	sw $t0 -1140($fp)
	li $t0 2
	sw $t0 -1144($fp)
	lw $t0 -1144($fp)
	li $t1 1
	div $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	add $t0 $t0 $t1
	sw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	sub $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	sw $t0 -1136($fp)
	lw $t0 -1136($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -1136($fp)
	li $t0 97
	sw $t0 -1144($fp)
	lw $t1 -1136($fp)
	mul $t1 $t1 4
	li $t0 -112
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1144($fp)
	sw $t2 0($t0)
	lw $t1 0($fp)
	sw $t1 -1136($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -1136($fp)
	lw $t1 -104($fp)
	sw $t1 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	sub $t0 $t0 $t1
	bltz $t0 label28
	li $t0 0
	sw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1136($fp)
	lw $t2 -1140($fp)
	mul $t2 $t2 4
	li $t1 -112
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1136($fp)
	mul $t0 $t0 $t1
	sw $t0 -1136($fp)
	li $t0 97
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	sub $t0 $t0 $t1
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
	sw $t1 -4($fp)
	lw $t0 -4($fp)
	li $t1 0
	bne $t0 $t1 label30
	li $t0 0
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label30:
	lw $t0 -4($fp)
	li $t1 1
	bne $t0 $t1 label31
	li $t0 1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label31:
	lw $t0 -4($fp)
	li $t1 2
	bne $t0 $t1 label32
	li $t0 1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label32:
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
	jal fibonaci
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
	jal fibonaci
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
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
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bgez $t0 label34
	la $a0 STRING15
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label34:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bltz $t0 label35
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fibonaci
	move $t1 $s1
	move $t0 $s1
	sw $t0 -4($fp)
	la $a0 STRING16
	li $v0 4
	syscall
	lw $t0 -4($fp)
	move $a0 $t0
	li $v0 1
	syscall

label35:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
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
	sw $t1 -8($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
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
	li $t0 0
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label36
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $s1 -12($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label36:
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label37
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $s1 -12($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label37:
	lw $t1 -4($fp)
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mod
	move $t1 $s1
	move $t0 $s1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal gcd
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	lw $s1 -12($fp)
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
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label38
	li $t0 1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label38:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label39
	li $t0 1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label39:
	li $t0 0
	sw $t0 -8($fp)
	lw $s1 -8($fp)
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
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswronggcd
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
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
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswronggcd
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	bne $t0 $0 label41

label40:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal gcd
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	la $a0 STRING19
	li $v0 4
	syscall
	lw $t0 -8($fp)
	move $a0 $t0
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
	li $t0 2
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 2
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label42
	li $t0 1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label42:

label43:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mod
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label44
	li $t0 0
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label44:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bltz $t0 label43
	li $t0 1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
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
	li $t0 2
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
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
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal is_prime
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label47
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
	jal mod
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label48

label49:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 0($fp)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label50
	la $a0 STRING21
	li $v0 4
	syscall

label50:
	li $t0 1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	move $a0 $t0
	li $v0 1
	syscall
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
	jal mod
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	beqz $t0 label49

label48:

label47:
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -4($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 0($fp)
	sw $t1 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bltz $t0 label46
	lw $t1 0($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	beqz $t0 label51
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label52
	la $a0 STRING21
	li $v0 4
	syscall

label52:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	move $a0 $t0
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
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bgez $t0 label54
	la $a0 STRING15
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label54:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bltz $t0 label53
	la $a0 STRING25
	li $v0 4
	syscall
	lw $t1 0($fp)
	sw $t1 -4($fp)
	lw $t0 -4($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
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
	li $t0 69
	sw $t0 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label55
	li $t0 0
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label55:
	li $t0 77
	sw $t0 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label56
	li $t0 0
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label56:
	li $t0 72
	sw $t0 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	bnez $t0 label57
	li $t0 0
	sw $t0 -4($fp)
	lw $s1 -4($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label57:
	li $t0 1
	sw $t0 -4($fp)
	lw $s1 -4($fp)
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
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswrong
	move $t1 $s1
	move $t0 $s1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label58

label59:
	la $a0 STRING27
	li $v0 4
	syscall
	li $v0 12
	syscall
	sw $v0 0($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswrong
	move $t1 $s1
	move $t0 $s1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	bne $t0 $0 label59

label58:
	lw $t1 0($fp)
	sw $t1 -4($fp)
	lw $t0 -4($fp)
	li $t1 69
	bne $t0 $t1 label60
	jal define_test
	jal operator_test
	jal fibonaci_test

label60:
	lw $t0 -4($fp)
	li $t1 77
	bne $t0 $t1 label61
	jal dowhile_test
	jal condition_test
	jal string_test
	jal gcd_test

label61:
	lw $t0 -4($fp)
	li $t1 72
	bne $t0 $t1 label62
	jal define_test
	jal operator_test
	jal dowhile_test
	jal condition_test
	jal string_test
	jal miscellaneous_test
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
