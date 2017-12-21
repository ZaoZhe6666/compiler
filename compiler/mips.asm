.data
	return_dota: .word 0
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
	ErrorInfor: .asciiz "Something Wrong1"
	string0: .asciiz " const_define "
	string1: .asciiz "           a:"
	string2: .asciiz "       cst_div:"
	string3: .asciiz "       "
	string4: .asciiz " const_define_test "
	string5: .asciiz " var_define "
	string6: .asciiz " var_define_test "
	string7: .asciiz " define "
	string8: .asciiz " define_test "
	string9: .asciiz "define test passed"
	string10: .asciiz " operator "
	string11: .asciiz " operator_test "
	string12: .asciiz "operator test passed"
	string13: .asciiz " string "
	string14: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"
	string15: .asciiz "!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
	string16: .asciiz " string_test "
	string17: .asciiz " dowhile "
	string18: .asciiz "dowhile test passed"
	string19: .asciiz " dowhile_test "
	string20: .asciiz " ifcondition "
	string21: .asciiz "ifcondition clause error!"
	string22: .asciiz "ifcondition clause error"
	string23: .asciiz " switch(int x) "
	string24: .asciiz " switch "
	string25: .asciiz "switchcodintion clause  error!"
	string26: .asciiz "switchcodintion clause  error!"
	string27: .asciiz " condition "
	string28: .asciiz "error 0"
	string29: .asciiz "error 1"
	string30: .asciiz "error 2"
	string31: .asciiz " condition_test "
	string32: .asciiz "condition test passed"
	string33: .asciiz " miscella "
	string34: .asciiz "miscellaneous test passed"
	string35: .asciiz " miscella_test "
	string36: .asciiz " fibonaci "
	string37: .asciiz " fibonaci_test "
	string38: .asciiz "Fibonaci: Please input a unsigned positive integer ?"
	string39: .asciiz "Input error, try again:"
	string40: .asciiz "The fibonaci's answer is "
	string41: .asciiz " mod "
	string42: .asciiz " gcd "
	string43: .asciiz " wronggcd "
	string44: .asciiz " gcd_test "
	string45: .asciiz "GCD: Please input two unsigned positive integer ?"
	string46: .asciiz "Input error, try Again: "
	string47: .asciiz "The gcd's answer is "
	string48: .asciiz "1"
	string49: .asciiz "*"
	string50: .asciiz "*"
	string51: .asciiz "prime_factorization: Please input a unsigned positive integer(<2^31-1) ?"
	string52: .asciiz "Input error, try again:"
	string53: .asciiz "The factor of n is "
	string54: .asciiz "!!!"
	string55: .asciiz "Please input Test Type:E(Easy), (M)Middle, H(Hard): "
	string56: .asciiz "Try Again: "
	string57: .asciiz "  11111111   "
	string58: .asciiz " in  E! "
	string59: .asciiz " after d_t "
	string60: .asciiz " after f_t "
	string61: .asciiz " after fib_t "


.text
	jal main
	li $v0 10
	syscall


const_define:
	subi $sp $sp 48
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 48
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
	la $a0 string0
	li $v0 4
	syscall
	la $a0 string1
	li $v0 4
	syscall
	lw $t0 -32($fp)
	li $t0 0
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -32($fp)
	move $a0 $t0
	li $v0 1
	syscall
	la $a0 string2
	li $v0 4
	syscall
	lw $t0 -32($fp)
	li $t0 0
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	lw $t1 -28($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -32($fp)
	move $a0 $t0
	li $v0 11
	syscall
	la $a0 string3
	li $v0 4
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
	la $a0 string4
	li $v0 4
	syscall
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
	la $a0 string5
	li $v0 4
	syscall
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
	la $a0 string6
	li $v0 4
	syscall
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
	la $a0 string7
	li $v0 4
	syscall
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
	la $a0 string8
	li $v0 4
	syscall
	jal var_define_test
	jal const_define_test
	jal define
	la $a0 string9
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
	la $a0 string10
	li $v0 4
	syscall
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 0($fp)
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -4($fp)
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -8($fp)
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 4
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -12($fp)
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 5
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -16($fp)
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 6
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -20($fp)
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -32($fp)
	li $t0 0
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 4
	div $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
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
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -32($fp)
	li $t0 0
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 4
	div $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
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
	lw $t0 -24($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -32($fp)
	li $t0 0
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	sub $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -24($fp)
	lw $t1 -28($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t0 -32($fp)
	li $t0 0
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -36($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -32($fp)
	lw $t1 -36($fp)
	sub $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	mul $t0 $t0 $t1
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
	la $a0 string11
	li $v0 4
	syscall
	jal operator
	la $a0 string12
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
	la $a0 string13
	li $v0 4
	syscall
	la $a0 string14
	li $v0 4
	syscall
	la $a0 string15
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
	la $a0 string16
	li $v0 4
	syscall
	jal string
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


dowhile:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	la $a0 string17
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 100
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label0:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 50
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	li $t1 -1
	slt $t0 $t1 $t0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label1
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label1:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 50
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label2
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 10
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 10
	div $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)

label2:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 10
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	li $t1 -1
	slt $t0 $t1 $t0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label0

label3:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t1 -4($fp)
	sw $t1 0($fp)
	la $a0 string18
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	bne $t0 $0 label3
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
	la $a0 string19
	li $v0 4
	syscall
	jal dowhile
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


ifcondition:
	subi $sp $sp 36
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 36
	la $a0 string20
	li $v0 4
	syscall
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label4
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label4:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t0 $0 $t0
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label5
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label5:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label6
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label6:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label7
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label7:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	li $t1 -1
	slt $t0 $t1 $t0
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label8
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label8:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label9
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label9:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label10
	la $a0 string21
	li $v0 4
	syscall

label10:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label11
	la $a0 string22
	li $v0 4
	syscall

label11:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


switchcodintionans:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	la $a0 string23
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	li $t1 1
	bne $t0 $t1 label12
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label12:
	lw $t0 -4($fp)
	li $t1 2
	bne $t0 $t1 label13
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	lw $t0 -4($fp)
	li $t1 3
	bne $t0 $t1 label14
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 4
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 5
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


switchcodintion:
	subi $sp $sp 36
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 36
	la $a0 string24
	li $v0 4
	syscall
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label15:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal switchcodintionans
	lw $t1 return_dota($0)
	lw $t0 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label16
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label16:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 5
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	bne $t0 $0 label15
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 4
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label17
	la $a0 string25
	li $v0 4
	syscall

label17:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label18
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label18:
	la $a0 string25
	li $v0 4
	syscall
	j ErrorDeal


condition:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	li $t0 5
	sw $t0 0($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	la $a0 string27
	li $v0 4
	syscall

label19:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	bne $t0 $t1 label20
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label21
	la $a0 string28
	li $v0 4
	syscall

label21:

label20:
	lw $t0 -8($fp)
	li $t1 1
	bne $t0 $t1 label22
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label23
	la $a0 string29
	li $v0 4
	syscall

label23:

label22:
	lw $t0 -8($fp)
	li $t1 2
	bne $t0 $t1 label24
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label25
	la $a0 string30
	li $v0 4
	syscall

label25:

label24:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	bne $t0 $0 label19
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
	la $a0 string31
	li $v0 4
	syscall
	jal ifcondition
	jal switchcodintion
	jal condition
	la $a0 string32
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


miscellaneous:
	subi $sp $sp 1160
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 1160
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 0($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -4($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -100($fp)
	la $a0 string33
	li $v0 4
	syscall

label26:
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 -100($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 0
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 -1136($fp)
	add $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 0
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	lw $t1 -100($fp)
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	add $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t1 -1140($fp)
	li $s0 4
	mul $t1 $t1 $s0
	li $t0 -8
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1144($fp)
	sw $t2 0($t0)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 -100($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -100($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 -100($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 0
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 1
	sw $t0 -1144($fp)
	lw $t0 -1144($fp)
	li $t1 23
	mul $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	add $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1136($fp)
	bne $t0 $0 label26
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 97
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -108($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 127
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -100($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 -100($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 -104($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 0($fp)

label27:
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 0
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	add $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	sub $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	sub $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 1
	div $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	add $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	sub $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 0
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 -1136($fp)
	add $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 0
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 97
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	add $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t1 -1140($fp)
	li $s0 4
	mul $t1 $t1 $s0
	li $t0 -112
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1144($fp)
	sw $t2 0($t0)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t1 -1136($fp)
	sw $t1 0($fp)
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1140($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 0
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 1
	sw $t0 -1144($fp)
	lw $t0 -1144($fp)
	lw $t1 -104($fp)
	mul $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	add $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1136($fp)
	bne $t0 $0 label27
	lw $t0 -1136($fp)
	li $t0 0
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 1
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 0
	sw $t0 -1144($fp)
	lw $t0 -1148($fp)
	li $t0 1
	sw $t0 -1148($fp)
	lw $t0 -1148($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -1148($fp)
	lw $t0 -1144($fp)
	lw $t1 -1148($fp)
	add $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t2 -1144($fp)
	li $s0 4
	mul $t2 $t2 $s0
	li $t1 -112
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1140($fp)
	mul $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	add $t0 $t0 $t1
	sw $t0 -1136($fp)
	lw $t0 -1140($fp)
	li $t0 0
	sw $t0 -1140($fp)
	lw $t0 -1144($fp)
	li $t0 1
	sw $t0 -1144($fp)
	lw $t0 -1144($fp)
	li $t1 97
	mul $t0 $t0 $t1
	sw $t0 -1144($fp)
	lw $t0 -1140($fp)
	lw $t1 -1144($fp)
	add $t0 $t0 $t1
	sw $t0 -1140($fp)
	lw $t0 -1136($fp)
	lw $t1 -1140($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -1136($fp)
	lw $t0 -1136($fp)
	beq $t0 $0 label28
	la $a0 string34
	li $v0 4
	syscall

label28:
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
	la $a0 string35
	li $v0 4
	syscall
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
	la $a0 string36
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	li $t1 0
	bne $t0 $t1 label29
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label29:
	lw $t0 -4($fp)
	li $t1 1
	bne $t0 $t1 label30
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label30:
	lw $t0 -4($fp)
	li $t1 2
	bne $t0 $t1 label31
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label31:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fibonaci
	lw $t1 return_dota($0)
	lw $t0 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fibonaci
	lw $t1 return_dota($0)
	lw $t0 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


fibonaci_test:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	la $a0 string37
	li $v0 4
	syscall
	la $a0 string38
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label32:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label33
	la $a0 string39
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label33:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	li $t1 -1
	slt $t0 $t1 $t0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label34
	la $a0 string40
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fibonaci
	lw $t1 return_dota($0)
	lw $t0 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	move $a0 $t0
	li $v0 1
	syscall

label34:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	bne $t0 $0 label32
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
	la $a0 string41
	li $v0 4
	syscall
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
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
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


gcd:
	subi $sp $sp 36
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 44
	la $a0 string42
	li $v0 4
	syscall
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label35
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label35:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label36
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label36:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -28($fp)
	li $t0 0
	sw $t0 -28($fp)
	lw $t0 -32($fp)
	li $t0 1
	sw $t0 -32($fp)
	lw $t0 -32($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	add $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -28($fp)
	li $t0 0
	sw $t0 -28($fp)
	lw $t0 -32($fp)
	li $t0 1
	sw $t0 -32($fp)
	lw $t0 -32($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	add $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t0 -28($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mod
	lw $t1 return_dota($0)
	lw $t0 -24($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal gcd
	lw $t1 return_dota($0)
	lw $t0 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


iswronggcd:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	la $a0 string43
	li $v0 4
	syscall
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label37
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label37:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label38
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label38:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


gcd_test:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	la $a0 string44
	li $v0 4
	syscall
	la $a0 string45
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswronggcd
	lw $t1 return_dota($0)
	lw $t0 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label39

label40:
	la $a0 string46
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswronggcd
	lw $t1 return_dota($0)
	lw $t0 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	bne $t0 $0 label40

label39:
	la $a0 string47
	li $v0 4
	syscall
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal gcd
	lw $t1 return_dota($0)
	lw $t0 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
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
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label41
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label41:

label42:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mod
	lw $t1 return_dota($0)
	lw $t0 -12($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	beq $t0 $0 label43
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label43:
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	bne $t0 $0 label42
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


prime_factorization:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 36
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -4($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label44
	la $a0 string48
	li $v0 4
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label44:

label45:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal is_prime
	lw $t1 return_dota($0)
	lw $t0 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label46
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mod
	lw $t1 return_dota($0)
	lw $t0 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label47

label48:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	div $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 0($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label49
	la $a0 string49
	li $v0 4
	syscall

label49:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t0 -20($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t0 -24($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal mod
	lw $t1 return_dota($0)
	lw $t0 -16($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	bne $t0 $0 label48

label47:

label46:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -4($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	bne $t0 $0 label45
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slt $t1 $0 $t0
	slti $t2 $t0 0
	or $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label50
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -20($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t0 -20($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	beq $t0 $0 label51
	la $a0 string49
	li $v0 4
	syscall

label51:
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	move $a0 $t0
	li $v0 1
	syscall

label50:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


prime_factorization_test:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	la $a0 string51
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label52:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label53
	la $a0 string39
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 0($fp)

label53:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t0 $t0 0
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	bne $t0 $0 label52
	la $a0 string53
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
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
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 69
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label54
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label54:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 77
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label55
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label55:
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 72
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 0
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	slti $t1 $t0 1
	li $t2 -1
	slt $t2 $t2 $t0
	and $t0 $t1 $t2
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label56
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 0
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label56:
	la $a0 string54
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	sw $t0 return_dota($0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


main:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	la $a0 string55
	li $v0 4
	syscall
	li $v0 12
	syscall
	sw $v0 0($fp)
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswrong
	lw $t1 return_dota($0)
	lw $t0 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	beq $t0 $0 label57

label58:
	la $a0 string56
	li $v0 4
	syscall
	li $v0 12
	syscall
	sw $v0 0($fp)
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -12($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -16($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal iswrong
	lw $t1 return_dota($0)
	lw $t0 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	bne $t0 $0 label58

label57:
	la $a0 string57
	li $v0 4
	syscall
	lw $t0 -4($fp)
	li $t0 0
	sw $t0 -4($fp)
	lw $t0 -8($fp)
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	add $t0 $t0 $t1
	sw $t0 -4($fp)
	lw $t0 -4($fp)
	li $t1 69
	bne $t0 $t1 label59
	la $a0 string58
	li $v0 4
	syscall
	jal define_test
	la $a0 string59
	li $v0 4
	syscall
	jal operator_test
	la $a0 string60
	li $v0 4
	syscall
	jal fibonaci_test
	la $a0 string61
	li $v0 4
	syscall

label59:
	lw $t0 -4($fp)
	li $t1 77
	bne $t0 $t1 label60
	jal dowhile_test
	jal condition_test
	jal string_test
	jal gcd_test

label60:
	lw $t0 -4($fp)
	li $t1 72
	bne $t0 $t1 label61
	jal define_test
	jal operator_test
	jal dowhile_test
	jal condition_test
	jal string_test
	jal miscellaneous_test
	jal prime_factorization_test

label61:
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
