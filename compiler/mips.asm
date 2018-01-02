.data
	_o: .word 111
	_r: .word 114
	_z: .word 122
	_l: .word 108
	_i: .word 105
	_b: .word 98
	xixi: .word 19
	haha: .word 26
	hugao: .word 8
	maogao: .word 17
	history_process: .word 1
	minus1: .word -1
	maxval: .space 932
	minval: .space 932
	sum: .space 932
	data: .space 932
	n: .word 0
	qsort_data: .space 932
	m: .word 0
	ErrorInfor: .asciiz "Something Wrong!"
	STRING0: .asciiz "."
	STRING1: .asciiz "history_process"
	STRING2: .asciiz "Please input n, and the program will work out the n-th element of the fibonacci sequence:"
	STRING3: .asciiz "Input 0 to quit this test."
	STRING4: .asciiz "The result is: "
	STRING5: .asciiz "The program first orzs libo to gain some rp and increase the probability of passing the test."
	STRING6: .asciiz "orzlibo "
	STRING7: .asciiz "please input 2 integers, and the program will work out their gcd."
	STRING8: .asciiz "input 2 zeros to quit the loop."
	STRING9: .asciiz "the gcd is: "
	STRING10: .asciiz "Now, let's do some math problems for fun."
	STRING11: .asciiz "Well, let's run another segment tree test to verify its correctness."
	STRING12: .asciiz "Please input the length of the sequence:"
	STRING13: .asciiz "Please input the "
	STRING14: .asciiz "-th number: "
	STRING15: .asciiz "The numbers you just inputed are:"
	STRING16: .asciiz "The "
	STRING17: .asciiz "-th: "
	STRING18: .asciiz "Building segment tree..."
	STRING19: .asciiz "The tree is succesfully built! Now it can respond to your query requests."
	STRING20: .asciiz "Please input 3 numbers, l, r, and type, type=-1 means exit:"
	STRING21: .asciiz "Your query result is "
	STRING22: .asciiz "Echo testing..."
	STRING23: .asciiz "Quick sort test:"
	STRING24: .asciiz "Please input the number of integers:"
	STRING25: .asciiz "Please input the "
	STRING26: .asciiz "-th number:"
	STRING27: .asciiz "The result after sorting is:"


.text
	jal main
	li $v0 10
	syscall


partition:
	subi $sp $sp 36
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 44
	lw $t1 0($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -16($fp)

label1:
	li $t0 1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bltz $t0 label2
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)

label2:
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgez $t0 label3
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)

label3:
	lw $t1 -12($fp)
	sw $t1 -20($fp)
	lw $t0 -20($fp)
	beq $t0 $0 label4
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -16($fp)

label5:
	lw $t1 -4($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -4($fp)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bltz $t0 label6
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)

label6:
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgez $t0 label7
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)

label7:
	lw $t1 -16($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -16($fp)
	lw $t1 -12($fp)
	sw $t1 -20($fp)
	lw $t0 -20($fp)
	bne $t0 $0 label5

label4:
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgez $t0 label8
	lw $t1 0($fp)
	sw $t1 -20($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -4($fp)
	sw $t1 -32($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t2 -32($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -28($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t1 -24($fp)
	mul $t1 $t1 4
	la $t0 qsort_data
	add $t0 $t0 $t1
	lw $t2 -28($fp)
	sw $t2 0($t0)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 0($fp)

label8:
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgez $t0 label9
	lw $t1 0($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label10
	li $t0 1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)

label10:

label9:
	lw $t1 -12($fp)
	sw $t1 -20($fp)
	lw $t0 -20($fp)
	beq $t0 $0 label11
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -16($fp)

label12:
	lw $t1 0($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 0($fp)
	li $t0 0
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgez $t0 label13
	lw $t1 0($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label14
	li $t0 1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -12($fp)

label14:

label13:
	lw $t1 -16($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -16($fp)
	lw $t1 -12($fp)
	sw $t1 -20($fp)
	lw $t0 -20($fp)
	bne $t0 $0 label12

label11:
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bgez $t0 label15
	lw $t1 -4($fp)
	sw $t1 -20($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 0($fp)
	sw $t1 -32($fp)
	li $t0 1
	sw $t0 -28($fp)
	lw $t2 -32($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -28($fp)
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	lw $t1 -24($fp)
	mul $t1 $t1 4
	la $t0 qsort_data
	add $t0 $t0 $t1
	lw $t2 -28($fp)
	sw $t2 0($t0)
	lw $t1 -4($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -4($fp)

label15:
	lw $t1 -16($fp)
	sw $t1 -20($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -16($fp)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $t1 -4($fp)
	sw $t1 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	sub $t0 $t0 $t1
	bltz $t0 label1
	lw $t1 0($fp)
	sw $t1 -20($fp)
	li $t0 0
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t1 -24($fp)
	mul $t1 $t1 4
	la $t0 qsort_data
	add $t0 $t0 $t1
	lw $t2 -28($fp)
	sw $t2 0($t0)
	lw $t1 0($fp)
	sw $t1 -20($fp)
	lw $s1 -20($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


gcd:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label16
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label16:
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t1 0($fp)
	sw $t1 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	div $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal gcd
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


qsort:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t1 -4($fp)
	sw $t1 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bgez $t0 label17
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
	jal partition
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -8($fp)
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal qsort
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal qsort

label17:
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


calculate_e:
	subi $sp $sp 1916
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 1916
	li $t0 233
	sw $t0 0($fp)
	li $t0 233
	sw $t0 -4($fp)
	li $t0 0
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1872($fp)

label18:
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	li $t0 0
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -8
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	li $t0 0
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -940
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	add $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1872($fp)
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	lw $t1 0($fp)
	sw $t1 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	bltz $t0 label18
	li $t0 0
	sw $t0 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	li $t0 2
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -940
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	li $t0 0
	sw $t0 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	li $t0 1
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -8
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	li $t0 1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1872($fp)

label19:
	li $t0 0
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1884($fp)
	li $t0 0
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1876($fp)

label20:
	lw $t1 -1884($fp)
	sw $t1 -1888($fp)
	lw $t0 -1888($fp)
	li $t1 10
	mul $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1876($fp)
	sw $t1 -1896($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t2 -1896($fp)
	mul $t2 $t2 4
	li $t1 -8
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1892($fp)
	mul $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	add $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1884($fp)
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t1 -1884($fp)
	sw $t1 -1896($fp)
	lw $t0 -1896($fp)
	lw $t1 -1872($fp)
	div $t0 $t0 $t1
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -8
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	lw $t1 -1884($fp)
	sw $t1 -1888($fp)
	lw $t1 -1884($fp)
	sw $t1 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1872($fp)
	div $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1872($fp)
	mul $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1884($fp)
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	add $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1876($fp)
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	lw $t1 0($fp)
	sw $t1 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	bltz $t0 label20
	lw $t1 0($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1876($fp)

label21:
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t1 -1876($fp)
	sw $t1 -1900($fp)
	li $t0 1
	sw $t0 -1896($fp)
	lw $t2 -1900($fp)
	mul $t2 $t2 4
	li $t1 -940
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1896($fp)
	mul $t0 $t0 $t1
	sw $t0 -1896($fp)
	lw $t1 -1876($fp)
	sw $t1 -1904($fp)
	li $t0 1
	sw $t0 -1900($fp)
	lw $t2 -1904($fp)
	mul $t2 $t2 4
	li $t1 -8
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1900($fp)
	mul $t0 $t0 $t1
	sw $t0 -1900($fp)
	lw $t0 -1896($fp)
	lw $t1 -1900($fp)
	add $t0 $t0 $t1
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -940
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	lw $t1 -1876($fp)
	sw $t1 -1892($fp)
	li $t0 1
	sw $t0 -1888($fp)
	lw $t2 -1892($fp)
	mul $t2 $t2 4
	li $t1 -940
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1888($fp)
	mul $t0 $t0 $t1
	sw $t0 -1888($fp)
	li $t0 10
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	blez $t0 label22
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t1 -1876($fp)
	sw $t1 -1900($fp)
	li $t0 1
	sw $t0 -1896($fp)
	lw $t2 -1900($fp)
	mul $t2 $t2 4
	li $t1 -940
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1896($fp)
	mul $t0 $t0 $t1
	sw $t0 -1896($fp)
	li $t0 10
	sw $t0 -1900($fp)
	lw $t0 -1896($fp)
	lw $t1 -1900($fp)
	sub $t0 $t0 $t1
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -940
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	sw $t0 -1888($fp)
	li $t0 0
	sw $t0 -1892($fp)
	lw $t0 -1892($fp)
	lw $t1 -1888($fp)
	add $t0 $t0 $t1
	sw $t0 -1892($fp)
	lw $t1 -1876($fp)
	sw $t1 -1900($fp)
	li $t0 1
	sw $t0 -1904($fp)
	lw $t0 -1900($fp)
	lw $t1 -1904($fp)
	sub $t0 $t0 $t1
	sw $t0 -1900($fp)
	li $t0 1
	sw $t0 -1896($fp)
	lw $t2 -1900($fp)
	mul $t2 $t2 4
	li $t1 -940
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1896($fp)
	mul $t0 $t0 $t1
	sw $t0 -1896($fp)
	li $t0 1
	sw $t0 -1900($fp)
	lw $t0 -1896($fp)
	lw $t1 -1900($fp)
	add $t0 $t0 $t1
	sw $t0 -1896($fp)
	lw $t1 -1892($fp)
	mul $t1 $t1 4
	li $t0 -940
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -1896($fp)
	sw $t2 0($t0)

label22:
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1876($fp)
	lw $t1 -1876($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	bgez $t0 label21
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	add $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1872($fp)
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	lw $t1 -4($fp)
	sw $t1 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	blez $t0 label19
	li $t0 0
	sw $t0 -1892($fp)
	li $t0 1
	sw $t0 -1888($fp)
	lw $t2 -1892($fp)
	mul $t2 $t2 4
	li $t1 -940
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1888($fp)
	mul $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t0 -1888($fp)
	move $a0 $t0
	li $v0 1
	syscall
	la $a0 STRING0
	li $v0 4
	syscall
	li $t0 1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1872($fp)

label23:
	lw $t1 -1872($fp)
	sw $t1 -1892($fp)
	li $t0 1
	sw $t0 -1888($fp)
	lw $t2 -1892($fp)
	mul $t2 $t2 4
	li $t1 -940
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -1888($fp)
	mul $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t0 -1888($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	li $t0 1
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	add $t0 $t0 $t1
	sw $t0 -1888($fp)
	lw $t1 -1888($fp)
	sw $t1 -1872($fp)
	lw $t1 -1872($fp)
	sw $t1 -1888($fp)
	li $t0 10
	sw $t0 -1892($fp)
	lw $t0 -1888($fp)
	lw $t1 -1892($fp)
	sub $t0 $t0 $t1
	bltz $t0 label23
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


weird_expressions_test:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 16
	li $t0 2
	sw $t0 0($fp)
	li $t0 3
	sw $t0 -4($fp)
	lw $t0 0($fp)
	lw $t1 -4($fp)
	add $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 -1
	sw $t0 0($fp)
	lw $t0 0($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 0($fp)
	li $t0 5
	sw $t0 -4($fp)
	lw $t0 0($fp)
	lw $t1 -4($fp)
	sub $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 0
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 -1
	sw $t0 0($fp)
	lw $t0 0($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 -1
	sw $t0 0($fp)
	lw $t0 0($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 -1
	sw $t0 0($fp)
	lw $t0 0($fp)
	li $t1 10
	mul $t0 $t0 $t1
	sw $t0 0($fp)
	li $t0 10
	sw $t0 -4($fp)
	lw $t0 0($fp)
	lw $t1 -4($fp)
	sub $t0 $t0 $t1
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 xixi($0)
	sw $t1 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 haha($0)
	sw $t1 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 0
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 hugao($0)
	sw $t1 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 maogao($0)
	sw $t1 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 history_process($0)
	sw $t1 0($fp)
	la $a0 STRING1
	li $v0 4
	syscall
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 115
	sw $t0 0($fp)
	lw $t0 0($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


min:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bgez $t0 label24
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label24:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


max:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	blez $t0 label25
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label25:
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


query:
	subi $sp $sp 40
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 64
	lw $t1 -16($fp)
	sw $t1 -36($fp)
	lw $t1 0($fp)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bltz $t0 label26
	lw $t1 -20($fp)
	sw $t1 -36($fp)
	lw $t1 -4($fp)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label27
	lw $t1 -8($fp)
	sw $t1 -36($fp)
	li $t0 0
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bnez $t0 label28
	lw $t1 -12($fp)
	sw $t1 -40($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t2 -40($fp)
	mul $t2 $t2 4
	la $t1 maxval
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -36($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label28:
	lw $t1 -8($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bnez $t0 label29
	lw $t1 -12($fp)
	sw $t1 -40($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t2 -40($fp)
	mul $t2 $t2 4
	la $t1 minval
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -36($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label29:
	lw $t1 -8($fp)
	sw $t1 -36($fp)
	li $t0 2
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bnez $t0 label30
	lw $t1 -12($fp)
	sw $t1 -40($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t2 -40($fp)
	mul $t2 $t2 4
	la $t1 sum
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -36($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label30:
	li $t0 0
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label27:

label26:
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -24($fp)
	lw $t1 -16($fp)
	sw $t1 -36($fp)
	lw $t1 -4($fp)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	blez $t0 label31
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -24($fp)

label31:
	lw $t1 -20($fp)
	sw $t1 -36($fp)
	lw $t1 0($fp)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bgez $t0 label32
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -24($fp)

label32:
	lw $t1 -24($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	beq $t0 $0 label33
	lw $t1 -8($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	li $t1 0
	bne $t0 $t1 label34
	li $t0 -1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	li $t1 2147483647
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label34:
	lw $t0 -36($fp)
	li $t1 1
	bne $t0 $t1 label35
	li $t0 2147483647
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label35:
	lw $t0 -36($fp)
	li $t1 2
	bne $t0 $t1 label36
	li $t0 0
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label36:
	li $t0 0
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label33:
	lw $t1 -8($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	li $t1 0
	bne $t0 $t1 label37
	lw $t1 0($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -48($fp)
	lw $t1 -20($fp)
	sw $t1 -52($fp)
	lw $t0 -48($fp)
	lw $t1 -52($fp)
	add $t0 $t0 $t1
	sw $t0 -48($fp)
	lw $t0 -48($fp)
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 0($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -44($fp)
	li $t0 1
	sw $t0 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -48($fp)
	lw $t1 -20($fp)
	sw $t1 -52($fp)
	lw $t0 -48($fp)
	lw $t1 -52($fp)
	add $t0 $t0 $t1
	sw $t0 -48($fp)
	lw $t0 -48($fp)
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -44($fp)
	li $t0 1
	sw $t0 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -20($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal max
	move $t1 $s1
	move $t0 $s1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label37:
	lw $t0 -36($fp)
	li $t1 1
	bne $t0 $t1 label38
	lw $t1 0($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -48($fp)
	lw $t1 -20($fp)
	sw $t1 -52($fp)
	lw $t0 -48($fp)
	lw $t1 -52($fp)
	add $t0 $t0 $t1
	sw $t0 -48($fp)
	lw $t0 -48($fp)
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 0($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -44($fp)
	li $t0 1
	sw $t0 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -48($fp)
	lw $t1 -20($fp)
	sw $t1 -52($fp)
	lw $t0 -48($fp)
	lw $t1 -52($fp)
	add $t0 $t0 $t1
	sw $t0 -48($fp)
	lw $t0 -48($fp)
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -44($fp)
	li $t0 1
	sw $t0 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -20($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal min
	move $t1 $s1
	move $t0 $s1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label38:
	lw $t0 -36($fp)
	li $t1 2
	bne $t0 $t1 label39
	lw $t1 0($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -44($fp)
	lw $t1 -20($fp)
	sw $t1 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -36($fp)
	lw $t1 0($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -44($fp)
	li $t0 1
	sw $t0 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -16($fp)
	sw $t1 -48($fp)
	lw $t1 -20($fp)
	sw $t1 -52($fp)
	lw $t0 -48($fp)
	lw $t1 -52($fp)
	add $t0 $t0 $t1
	sw $t0 -48($fp)
	lw $t0 -48($fp)
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -44($fp)
	li $t0 1
	sw $t0 -48($fp)
	lw $t0 -44($fp)
	lw $t1 -48($fp)
	add $t0 $t0 $t1
	sw $t0 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -20($fp)
	sw $t1 -44($fp)
	lw $t0 -44($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label39:
	li $t0 0
	sw $t0 -36($fp)
	lw $s1 -36($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


build:
	subi $sp $sp 32
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 44
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t1 -4($fp)
	sw $t1 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	bnez $t0 label40
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t1 0($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -16($fp)
	mul $t1 $t1 4
	la $t0 maxval
	add $t0 $t0 $t1
	lw $t2 -20($fp)
	sw $t2 0($t0)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t1 0($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -16($fp)
	mul $t1 $t1 4
	la $t0 minval
	add $t0 $t0 $t1
	lw $t2 -20($fp)
	sw $t2 0($t0)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t1 0($fp)
	sw $t1 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -16($fp)
	mul $t1 $t1 4
	la $t0 sum
	add $t0 $t0 $t1
	lw $t2 -20($fp)
	sw $t2 0($t0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label40:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 0($fp)
	sw $t1 -16($fp)
	lw $t1 -4($fp)
	sw $t1 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal build
	lw $t1 0($fp)
	sw $t1 -16($fp)
	lw $t1 -4($fp)
	sw $t1 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	lw $t0 -12($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t0 -12($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal build
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t2 -28($fp)
	mul $t2 $t2 4
	la $t1 maxval
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -24($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	add $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t2 -28($fp)
	mul $t2 $t2 4
	la $t1 maxval
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -24($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal max
	move $t1 $s1
	move $t0 $s1
	sw $t0 -20($fp)
	lw $t1 -16($fp)
	mul $t1 $t1 4
	la $t0 maxval
	add $t0 $t0 $t1
	lw $t2 -20($fp)
	sw $t2 0($t0)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t2 -28($fp)
	mul $t2 $t2 4
	la $t1 minval
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -24($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	add $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t2 -28($fp)
	mul $t2 $t2 4
	la $t1 minval
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -24($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -24($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal min
	move $t1 $s1
	move $t0 $s1
	sw $t0 -20($fp)
	lw $t1 -16($fp)
	mul $t1 $t1 4
	la $t0 minval
	add $t0 $t0 $t1
	lw $t2 -20($fp)
	sw $t2 0($t0)
	lw $t1 -8($fp)
	sw $t1 -12($fp)
	li $t0 0
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t1 -8($fp)
	sw $t1 -24($fp)
	lw $t0 -24($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	li $t0 1
	sw $t0 -20($fp)
	lw $t2 -24($fp)
	mul $t2 $t2 4
	la $t1 sum
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -20($fp)
	mul $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -8($fp)
	sw $t1 -28($fp)
	lw $t0 -28($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -32($fp)
	lw $t0 -28($fp)
	lw $t1 -32($fp)
	add $t0 $t0 $t1
	sw $t0 -28($fp)
	li $t0 1
	sw $t0 -24($fp)
	lw $t2 -28($fp)
	mul $t2 $t2 4
	la $t1 sum
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -24($fp)
	mul $t0 $t0 $t1
	sw $t0 -24($fp)
	lw $t0 -20($fp)
	lw $t1 -24($fp)
	add $t0 $t0 $t1
	sw $t0 -20($fp)
	lw $t1 -16($fp)
	mul $t1 $t1 4
	la $t0 sum
	add $t0 $t0 $t1
	lw $t2 -20($fp)
	sw $t2 0($t0)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


echo:
	subi $sp $sp 24
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	li $t0 0
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)

label41:
	li $v0 12
	syscall
	sw $v0 0($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 48
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label42
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label42:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 2
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	move $a0 $t0
	li $v0 1
	syscall
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
	li $t0 1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	bne $t0 $0 label41
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


fibo:
	subi $sp $sp 100
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 100
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -64($fp)

label43:
	li $t0 0
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 0
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 2
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 3
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 2
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 0
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 0
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 0
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 2
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 3
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 0
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	la $a0 STRING2
	li $v0 4
	syscall
	la $a0 STRING3
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -32($fp)
	lw $t1 -32($fp)
	sw $t1 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bnez $t0 label44
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label44:
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -64($fp)

label45:
	lw $t1 -32($fp)
	sw $t1 -68($fp)
	lw $t1 -32($fp)
	sw $t1 -72($fp)
	lw $t0 -72($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t0 -68($fp)
	beq $t0 $0 label46
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)

label47:
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -56($fp)

label48:
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -56($fp)
	sw $t1 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 0
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -36
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -60($fp)

label49:
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -56($fp)
	sw $t1 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t1 -52($fp)
	sw $t1 -80($fp)
	lw $t0 -80($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -56($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -52($fp)
	sw $t1 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t1 -60($fp)
	sw $t1 -88($fp)
	lw $t0 -84($fp)
	lw $t1 -88($fp)
	add $t0 $t0 $t1
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t2 -84($fp)
	mul $t2 $t2 4
	li $t1 -16
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -60($fp)
	sw $t1 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t1 -56($fp)
	sw $t1 -88($fp)
	lw $t0 -84($fp)
	lw $t1 -88($fp)
	add $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t2 -84($fp)
	mul $t2 $t2 4
	li $t1 0
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	add $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -36
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -56($fp)
	sw $t1 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t1 -52($fp)
	sw $t1 -80($fp)
	lw $t0 -80($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -56($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -52($fp)
	sw $t1 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t1 -56($fp)
	sw $t1 -88($fp)
	lw $t0 -84($fp)
	lw $t1 -88($fp)
	add $t0 $t0 $t1
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t2 -84($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	li $t1 10000
	div $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	li $t1 10000
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -36
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	lw $t1 -60($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -60($fp)
	lw $t1 -60($fp)
	sw $t1 -68($fp)
	li $t0 2
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label49
	lw $t1 -56($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -56($fp)
	lw $t1 -56($fp)
	sw $t1 -68($fp)
	li $t0 2
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label48
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 2
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label47
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)

label50:
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t1 -52($fp)
	sw $t1 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 4
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label50

label46:
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)

label51:
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -56($fp)

label52:
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -56($fp)
	sw $t1 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	li $t0 0
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -36
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -60($fp)

label53:
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -56($fp)
	sw $t1 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t1 -52($fp)
	sw $t1 -80($fp)
	lw $t0 -80($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -56($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -52($fp)
	sw $t1 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t1 -60($fp)
	sw $t1 -88($fp)
	lw $t0 -84($fp)
	lw $t1 -88($fp)
	add $t0 $t0 $t1
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t2 -84($fp)
	mul $t2 $t2 4
	li $t1 0
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -60($fp)
	sw $t1 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t1 -56($fp)
	sw $t1 -88($fp)
	lw $t0 -84($fp)
	lw $t1 -88($fp)
	add $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t2 -84($fp)
	mul $t2 $t2 4
	li $t1 0
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	add $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -36
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -56($fp)
	sw $t1 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t1 -52($fp)
	sw $t1 -80($fp)
	lw $t0 -80($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -56($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -52($fp)
	sw $t1 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t1 -56($fp)
	sw $t1 -88($fp)
	lw $t0 -84($fp)
	lw $t1 -88($fp)
	add $t0 $t0 $t1
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t2 -84($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	li $t1 10000
	div $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	li $t1 10000
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 -36
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	lw $t1 -60($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -60($fp)
	lw $t1 -60($fp)
	sw $t1 -68($fp)
	li $t0 2
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label53
	lw $t1 -56($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -56($fp)
	lw $t1 -56($fp)
	sw $t1 -68($fp)
	li $t0 2
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label52
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 2
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label51
	li $t0 0
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)

label54:
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 0
	sw $t0 -72($fp)
	lw $t0 -72($fp)
	lw $t1 -68($fp)
	add $t0 $t0 $t1
	sw $t0 -72($fp)
	lw $t1 -52($fp)
	sw $t1 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t2 -80($fp)
	mul $t2 $t2 4
	li $t1 -36
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -72($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t2 -76($fp)
	sw $t2 0($t0)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -52($fp)
	lw $t1 -52($fp)
	sw $t1 -68($fp)
	li $t0 4
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	sub $t0 $t0 $t1
	bltz $t0 label54
	lw $t1 -32($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	li $t1 2
	div $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -32($fp)
	lw $t1 -64($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -64($fp)
	lw $t1 -32($fp)
	sw $t1 -68($fp)
	lw $t0 -68($fp)
	bne $t0 $0 label45
	li $t0 1
	sw $t0 -72($fp)
	li $t0 1
	sw $t0 -68($fp)
	lw $t2 -72($fp)
	mul $t2 $t2 4
	li $t1 -16
	sub $t1 $t1 $t2
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -68($fp)
	mul $t0 $t0 $t1
	sw $t0 -68($fp)
	la $a0 STRING4
	li $v0 4
	syscall
	lw $t0 -68($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 -64($fp)
	sw $t1 -68($fp)
	li $t0 1
	sw $t0 -72($fp)
	lw $t0 -68($fp)
	lw $t1 -72($fp)
	add $t0 $t0 $t1
	sw $t0 -68($fp)
	lw $t1 -68($fp)
	sw $t1 -64($fp)
	li $t0 1
	sw $t0 -68($fp)
	lw $t0 -68($fp)
	bne $t0 $0 label43
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0


main:
	subi $sp $sp 56
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 56
	la $a0 STRING5
	li $v0 4
	syscall
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label55:
	lw $t1 0($fp)
	sw $t1 -36($fp)
	la $a0 STRING6
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 10
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bltz $t0 label55
	lw $t1 _o($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 _r($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 _z($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 _l($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 _i($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 _b($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 _o($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -16($fp)
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label56:
	la $a0 STRING7
	li $v0 4
	syscall
	la $a0 STRING8
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -8($fp)
	li $v0 5
	syscall
	sw $v0 -12($fp)
	lw $t1 -8($fp)
	sw $t1 -36($fp)
	li $t0 0
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bnez $t0 label57
	lw $t1 -12($fp)
	sw $t1 -36($fp)
	li $t0 0
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bnez $t0 label58
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -16($fp)

label58:

label57:
	lw $t1 -16($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	beq $t0 $0 label59
	lw $t1 -8($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -12($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal gcd
	move $t1 $s1
	move $t0 $s1
	sw $t0 -36($fp)
	la $a0 STRING9
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall

label59:
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 -16($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	bne $t0 $0 label56
	la $a0 STRING10
	li $v0 4
	syscall
	jal fibo
	la $a0 STRING11
	li $v0 4
	syscall
	la $a0 STRING12
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 n($0)
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label60:
	lw $t1 0($fp)
	sw $t1 -36($fp)
	la $a0 STRING13
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall
	la $a0 STRING14
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -20($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 0
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -40($fp)
	lw $t1 -20($fp)
	sw $t1 -44($fp)
	lw $t1 -40($fp)
	mul $t1 $t1 4
	la $t0 data
	add $t0 $t0 $t1
	lw $t2 -44($fp)
	sw $t2 0($t0)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	lw $t1 n($0)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	blez $t0 label60
	la $a0 STRING15
	li $v0 4
	syscall
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label61:
	lw $t1 0($fp)
	sw $t1 -36($fp)
	la $a0 STRING16
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 0($fp)
	sw $t1 -40($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t2 -40($fp)
	mul $t2 $t2 4
	la $t1 data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -36($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	la $a0 STRING17
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	lw $t1 n($0)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	blez $t0 label61
	la $a0 STRING18
	li $v0 4
	syscall
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 n($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal build
	la $a0 STRING19
	li $v0 4
	syscall
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -16($fp)
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label62:
	la $a0 STRING20
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -24($fp)
	li $v0 5
	syscall
	sw $v0 -28($fp)
	li $v0 5
	syscall
	sw $v0 -32($fp)
	lw $t1 -32($fp)
	sw $t1 -36($fp)
	li $t0 0
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bgez $t0 label63
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -16($fp)

label63:
	lw $t1 -32($fp)
	sw $t1 -36($fp)
	li $t0 3
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	bltz $t0 label64
	li $t0 0
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 -16($fp)

label64:
	lw $t1 -16($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	beq $t0 $0 label65
	lw $t1 -24($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -28($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 -32($fp)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 n($0)
	sw $t1 -40($fp)
	lw $t0 -40($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal query
	move $t1 $s1
	move $t0 $s1
	sw $t0 -36($fp)
	la $a0 STRING21
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall

label65:
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 -16($fp)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	bne $t0 $0 label62
	la $a0 STRING22
	li $v0 4
	syscall
	jal echo
	jal weird_expressions_test
	jal calculate_e
	la $a0 STRING23
	li $v0 4
	syscall
	la $a0 STRING24
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 m($0)
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label66:
	lw $t1 0($fp)
	sw $t1 -36($fp)
	la $a0 STRING13
	li $v0 4
	syscall
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall
	la $a0 STRING26
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -20($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 0
	sw $t0 -40($fp)
	lw $t0 -40($fp)
	lw $t1 -36($fp)
	add $t0 $t0 $t1
	sw $t0 -40($fp)
	lw $t1 -20($fp)
	sw $t1 -44($fp)
	lw $t1 -40($fp)
	mul $t1 $t1 4
	la $t0 qsort_data
	add $t0 $t0 $t1
	lw $t2 -44($fp)
	sw $t2 0($t0)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	lw $t1 m($0)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	blez $t0 label66
	li $t0 1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	lw $t1 m($0)
	sw $t1 -36($fp)
	lw $t0 -36($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal qsort
	la $a0 STRING27
	li $v0 4
	syscall
	li $t0 1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)

label67:
	lw $t1 0($fp)
	sw $t1 -40($fp)
	li $t0 1
	sw $t0 -36($fp)
	lw $t2 -40($fp)
	mul $t2 $t2 4
	la $t1 qsort_data
	add $t1 $t1 $t2
	lw $t1 0($t1)
	lw $t0 -36($fp)
	mul $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t0 -36($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 0($fp)
	sw $t1 -36($fp)
	li $t0 1
	sw $t0 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	add $t0 $t0 $t1
	sw $t0 -36($fp)
	lw $t1 -36($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -36($fp)
	lw $t1 m($0)
	sw $t1 -40($fp)
	lw $t0 -36($fp)
	lw $t1 -40($fp)
	sub $t0 $t0 $t1
	blez $t0 label67
	li $v0 10
	syscall
ErrorDeal:
	la $a0 ErrorInfor
	li $v0 4
	syscall
