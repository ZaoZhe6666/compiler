.data
	cona: .word 10
	conb: .word 97
	conc: .word 54
	_cha: .word 0
	chb: .space 24
	chc: .word 0
	chd: .word 0
	ErrorInfor: .asciiz "Something Wrong!"
	STRING0: .asciiz "test line:"
	STRING1: .asciiz "test fib:"
	STRING2: .asciiz "fib="
	STRING3: .asciiz "test function:"
	STRING4: .asciiz "test switch:"
	STRING5: .asciiz "key is 0"
	STRING6: .asciiz "key is "
	STRING7: .asciiz "key is 2"


.text
	jal main
	li $v0 10
	syscall


f:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 28
	li $t0 1
	sw $t0 -8($fp)
	lw $t2 0($fp)
	li $t3 1
	sub $t0 $t2 $t3
	blez $t0 label1
	lw $t2 0($fp)
	lw $t3 -8($fp)
	add $t2 $t2 $t3
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label1:
	lw $t2 0($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 0($fp)
	lw $t2 0($fp)
	sw $t2 0($sp)
	subi $sp $sp 4
	lw $t2 -4($fp)
	sw $t2 0($sp)
	subi $sp $sp 4
	jal f
	lw $t2 0($fp)
	lw $t3 -4($fp)
	add $t2 $t2 $t3
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


compare:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	lw $t2 0($fp)
	lw $t3 -4($fp)
	sub $t0 $t2 $t3
	blez $t0 label2
	li $t2 1
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label2:
	lw $t2 0($fp)
	lw $t3 -4($fp)
	sub $t0 $t2 $t3
	bgtz $t0 label3
	li $t2 -1
	li $t1 1
	mul $t2 $t2 $t1
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label3:
	j ErrorDeal


line:
	subi $sp $sp 856
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 864
	li $t2 1
	sw $t2 -8($fp)
	li $t2 1
	sw $t2 -12($fp)

label4:
	lw $t2 -8($fp)
	lw $t3 -8($fp)
	mul $t1 $t2 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -8($fp)
	lw $t3 -8($fp)
	mul $t1 $t2 4
	li $t0 -416
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -8($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 -8($fp)
	lw $t2 -8($fp)
	lw $t3 0($fp)
	sub $t0 $t2 $t3
	blez $t0 label4
	li $t2 1
	sw $t2 -8($fp)

label5:
	lw $t2 -8($fp)
	li $t3 1
	sub $t0 $t2 $t3
	bnez $t0 label6
	li $t2 3
	sw $t2 -816($fp)
	li $t2 2
	sw $t2 -820($fp)

label6:
	lw $t2 -8($fp)
	li $t3 2
	sub $t0 $t2 $t3
	bnez $t0 label7
	li $t2 8
	sw $t2 -816($fp)
	li $t2 -1
	li $t1 3
	mul $t2 $t2 $t1
	sw $t2 -820($fp)

label7:
	lw $t2 -8($fp)
	li $t3 3
	sub $t0 $t2 $t3
	bnez $t0 label8
	li $t2 3
	sw $t2 -816($fp)
	li $t2 -1
	li $t1 2
	mul $t2 $t2 $t1
	sw $t2 -820($fp)

label8:
	lw $t2 -820($fp)
	li $t3 0
	sub $t0 $t2 $t3
	beqz $t0 label9
	lw $t3 -820($fp)
	sw $t3 0($sp)
	subi $sp $sp 4
	li $t3 0
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -844($fp)
	jal compare
	lw $t2 -844($fp)
	move $t2 $s1
	sw $t2 -824($fp)
	lw $t2 -824($fp)
	lw $t1 -820($fp)
	mul $t2 $t2 $t1
	sw $t2 -828($fp)
	lw $t3 -816($fp)
	li $t2 1
	mul $t0 $t3 4
	li $t1 -16
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	sw $t2 -832($fp)

label10:
	lw $t3 -832($fp)
	lw $t4 -824($fp)
	add $t3 $t3 $t4
	li $t2 1
	mul $t0 $t3 4
	li $t1 -416
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	sw $t2 -840($fp)
	lw $t3 -840($fp)
	li $t2 1
	mul $t0 $t3 4
	li $t1 -16
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	sw $t2 -836($fp)
	lw $t2 -832($fp)
	lw $t3 -840($fp)
	mul $t1 $t2 4
	li $t0 -416
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -840($fp)
	lw $t3 -832($fp)
	mul $t1 $t2 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -836($fp)
	sw $t2 -832($fp)
	lw $t2 -12($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 -12($fp)
	lw $t2 -12($fp)
	lw $t3 -828($fp)
	sub $t0 $t2 $t3
	blez $t0 label10
	lw $t2 -836($fp)
	lw $t3 -816($fp)
	mul $t1 $t2 4
	li $t0 -416
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -816($fp)
	lw $t4 -816($fp)
	li $t3 1
	mul $t0 $t4 4
	li $t1 -16
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	lw $t4 -820($fp)
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)

label9:
	lw $t2 -8($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 -8($fp)
	lw $t2 -8($fp)
	lw $t3 -4($fp)
	sub $t0 $t2 $t3
	blez $t0 label5
	li $t3 1
	li $t2 1
	mul $t0 $t3 4
	li $t1 -416
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall
	li $t2 2
	sw $t2 -8($fp)

label11:
	lw $t3 -8($fp)
	li $t2 1
	mul $t0 $t3 4
	li $t1 -416
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall
	lw $t2 -8($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 -8($fp)
	lw $t2 -8($fp)
	lw $t3 0($fp)
	sub $t0 $t2 $t3
	blez $t0 label11
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


f2:
	subi $sp $sp 20
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 24
	li $t2 1
	sw $t2 -4($fp)
	lw $t2 0($fp)
	lw $t3 -4($fp)
	add $t2 $t2 $t3
	sw $t2 0($fp)
	lw $t2 0($fp)
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


fib:
	subi $sp $sp 28
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 32
	lw $t2 0($fp)
	li $t3 0
	sub $t0 $t2 $t3
	bnez $t0 label12
	li $t2 0
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label12:
	lw $t2 0($fp)
	li $t3 1
	sub $t0 $t2 $t3
	bnez $t0 label13
	li $t2 1
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	lw $t3 0($fp)
	li $t4 1
	sub $t3 $t3 $t4
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	jal fib
	lw $t2 -8($fp)
	move $t2 $s1
	lw $t4 0($fp)
	li $t5 2
	sub $t4 $t4 $t5
	sw $t4 0($sp)
	subi $sp $sp 4
	sw $t2 -8($fp)
	sw $t3 -12($fp)
	jal fib
	lw $t2 -8($fp)
	lw $t3 -12($fp)
	move $t3 $s1
	add $t2 $t2 $t3
	sw $t2 -4($fp)
	lw $t2 -4($fp)
	move $s1 $t2
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0
	j ErrorDeal


nest:
	subi $sp $sp 152
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 152
	li $t2 0
	li $t3 1
	mul $t1 $t2 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 1
	li $t3 3
	mul $t1 $t2 4
	li $t0 -60
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 3
	li $t3 4
	mul $t1 $t2 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 4
	li $t3 6
	mul $t1 $t2 4
	li $t0 -60
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 6
	li $t3 8
	mul $t1 $t2 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t7 0
	li $t6 1
	mul $t0 $t7 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t6 $t6 $t1
	li $t5 1
	mul $t0 $t6 4
	li $t1 -60
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t5 $t5 $t1
	li $t4 1
	mul $t0 $t5 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t4 $t4 $t1
	li $t3 1
	mul $t0 $t4 4
	li $t1 -60
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t2 1
	mul $t0 $t3 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	li $t3 2333
	mul $t1 $t2 4
	li $t0 -60
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t3 0
	li $t2 1
	mul $t0 $t3 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	li $t4 8
	li $t3 1
	mul $t0 $t4 4
	li $t1 -60
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	add $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall
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


t:
	subi $sp $sp 16
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 20
	lw $t2 0($fp)
	li $t3 99
	sub $t0 $t2 $t3
	blez $t0 label14
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
	lw $t2 0($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 0($fp)
	lw $t2 0($fp)
	move $a0 $t2
	li $v0 11
	syscall
	lw $t2 0($fp)
	sw $t2 0($sp)
	subi $sp $sp 4
	jal t
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


main:
	subi $sp $sp 104
	sw $fp 8($sp)
	sw $ra 4($sp)
	addi $fp $sp 104
	li $t0 3
	sw $t0 0($fp)
	li $t2 43
	sw $t2 chc($0)
	li $t2 45
	sw $t2 chd($0)
	li $t2 3
	sw $t2 -8($fp)
	li $t2 0
	sw $t2 -24($fp)
	li $t2 -1
	li $t1 2
	mul $t2 $t2 $t1
	sw $t2 -12($fp)
	li $t2 1
	sw $t2 -20($fp)
	li $v0 5
	syscall
	sw $v0 -48($fp)
	lw $t2 -48($fp)
	li $t1 0
	bne $t2 $t1 label15
	la $a0 STRING0
	li $v0 4
	syscall
	li $t2 8
	sw $t2 0($sp)
	subi $sp $sp 4
	li $t2 3
	sw $t2 0($sp)
	subi $sp $sp 4
	jal line

label15:
	li $t1 1
	bne $t2 $t1 label16
	la $a0 STRING1
	li $v0 4
	syscall
	lw $t3 0($fp)
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -76($fp)
	jal fib
	lw $t2 -76($fp)
	move $t2 $s1
	sw $t2 -16($fp)
	lw $t2 -16($fp)
	la $a0 STRING2
	li $v0 4
	syscall
	move $a0 $t2
	li $v0 1
	syscall

label16:
	li $t1 2
	bne $t2 $t1 label17

label18:
	lw $t2 -24($fp)
	li $t3 97
	mul $t1 $t2 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -24($fp)
	lw $t3 -24($fp)
	mul $t1 $t2 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -24($fp)
	li $t3 1
	add $t2 $t2 $t3
	sw $t2 -24($fp)
	lw $t2 -24($fp)
	li $t3 5
	sub $t0 $t2 $t3
	bltz $t0 label18
	li $v0 5
	syscall
	sw $v0 -20($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	lw $t2 -20($fp)
	li $t3 3
	sub $t0 $t2 $t3
	bgez $t0 label19
	lw $t2 -4($fp)
	lw $t3 -8($fp)
	add $t2 $t2 $t3
	sw $t2 -4($fp)
	lw $t2 -4($fp)
	move $a0 $t2
	li $v0 1
	syscall

label19:
	lw $t2 -20($fp)
	li $t3 3
	sub $t0 $t2 $t3
	bgtz $t0 label20
	lw $t2 -8($fp)
	lw $t3 -4($fp)
	sub $t2 $t2 $t3
	sw $t2 -8($fp)
	li $t2 0
	li $t4 0
	li $t3 1
	mul $t0 $t4 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	lw $t4 -8($fp)
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 0
	li $t4 0
	li $t3 1
	mul $t0 $t4 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -8($fp)
	move $a0 $t2
	li $v0 1
	syscall
	li $t3 0
	li $t2 1
	mul $t0 $t3 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 11
	syscall
	li $t3 0
	li $t2 1
	mul $t0 $t3 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall

label20:
	lw $t2 -20($fp)
	li $t3 6
	sub $t0 $t2 $t3
	blez $t0 label21
	lw $t2 -4($fp)
	lw $t1 -8($fp)
	mul $t2 $t2 $t1
	sw $t2 -12($fp)
	li $t2 1
	li $t4 1
	li $t3 1
	mul $t0 $t4 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	lw $t4 -12($fp)
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 1
	li $t4 1
	li $t3 1
	mul $t0 $t4 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -12($fp)
	move $a0 $t2
	li $v0 1
	syscall
	li $t3 1
	li $t2 1
	mul $t0 $t3 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 11
	syscall
	li $t3 1
	li $t2 1
	mul $t0 $t3 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall

label21:
	lw $t2 -20($fp)
	li $t3 6
	sub $t0 $t2 $t3
	bltz $t0 label22
	lw $t2 -4($fp)
	lw $t1 -8($fp)
	div $t2 $t2 $t1
	sw $t2 -16($fp)
	li $t2 2
	li $t4 2
	li $t3 1
	mul $t0 $t4 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	lw $t4 -16($fp)
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 2
	li $t4 2
	li $t3 1
	mul $t0 $t4 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -16($fp)
	move $a0 $t2
	li $v0 1
	syscall
	li $t3 2
	li $t2 1
	mul $t0 $t3 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 11
	syscall
	li $t3 2
	li $t2 1
	mul $t0 $t3 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall

label22:
	lw $t2 -20($fp)
	li $t3 4
	sub $t0 $t2 $t3
	beqz $t0 label23
	lw $t2 -4($fp)
	li $t3 1
	lw $t1 0($fp)
	div $t3 $t3 $t1
	sub $t2 $t2 $t3
	sw $t2 -4($fp)
	li $t2 3
	li $t4 3
	li $t3 1
	mul $t0 $t4 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	lw $t4 -4($fp)
	add $t3 $t3 $t4
	li $t4 99
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	li $t2 3
	li $t4 3
	li $t3 1
	mul $t0 $t4 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -4($fp)
	move $a0 $t2
	li $v0 1
	syscall
	li $t3 3
	li $t2 1
	mul $t0 $t3 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 11
	syscall
	li $t3 3
	li $t2 1
	mul $t0 $t3 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall

label23:
	lw $t2 -20($fp)
	li $t3 4
	sub $t0 $t2 $t3
	bnez $t0 label24
	li $t2 -1
	lw $t1 -4($fp)
	mul $t2 $t2 $t1
	li $t3 2
	lw $t1 0($fp)
	mul $t3 $t3 $t1
	add $t2 $t2 $t3
	sw $t2 -4($fp)
	li $t2 4
	li $t4 4
	li $t3 1
	mul $t0 $t4 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t3 $t3 $t1
	li $t4 1
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)
	lw $t2 -4($fp)
	move $a0 $t2
	li $v0 1
	syscall
	li $t3 4
	li $t2 1
	mul $t0 $t3 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 11
	syscall
	li $t3 4
	li $t2 1
	mul $t0 $t3 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall

label24:
	lw $t2 -20($fp)
	beq $t2 $0 label25
	lw $t2 -4($fp)
	move $a0 $t2
	li $v0 1
	syscall

label25:

label17:
	li $t1 3
	bne $t2 $t1 label26
	la $a0 STRING3
	li $v0 4
	syscall
	lw $t2 -20($fp)
	beq $t2 $0 label27
	li $t2 4
	li $t4 -1
	li $t1 2
	mul $t4 $t4 $t1
	sw $t4 0($sp)
	subi $sp $sp 4
	li $t4 3
	sw $t4 0($sp)
	subi $sp $sp 4
	sw $t2 -76($fp)
	sw $t3 -80($fp)
	jal f
	lw $t2 -76($fp)
	lw $t3 -80($fp)
	move $t3 $s1
	li $t5 5
	li $t6 1
	add $t5 $t5 $t6
	move $t4 $t5
	lw $t1 0($fp)
	mul $t4 $t4 $t1
	add $t3 $t3 $t4
	mul $t1 $t2 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	sw $t3 0($t0)

label27:
	lw $t2 conb($0)
	sw $t2 0($sp)
	subi $sp $sp 4
	jal t
	li $t3 97
	sw $t3 0($sp)
	subi $sp $sp 4
	sw $t2 -76($fp)
	jal f2
	lw $t2 -76($fp)
	move $t2 $s1
	move $a0 $t2
	li $v0 11
	syscall
	li $t3 4
	li $t2 1
	mul $t0 $t3 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	mul $t2 $t2 $t1
	move $a0 $t2
	li $v0 1
	syscall

label26:
	li $t1 4
	bne $t2 $t1 label28
	la $a0 STRING4
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -20($fp)
	lw $t2 -20($fp)
	li $t1 1
	mul $t2 $t2 $t1
	li $t1 0
	bne $t2 $t1 label29
	la $a0 STRING5
	li $v0 4
	syscall

label29:
	li $t1 1
	bne $t2 $t1 label30
	lw $t2 -20($fp)
	la $a0 STRING6
	li $v0 4
	syscall
	move $a0 $t2
	li $v0 1
	syscall

label30:
	li $t1 2
	bne $t2 $t1 label31
	la $a0 STRING7
	li $v0 4
	syscall

label31:
	li $v0 12
	syscall
	sw $v0 -72($fp)
	lw $t2 -72($fp)
	li $t1 97
	bne $t2 $t1 label32
	li $t2 2
	move $a0 $t2
	li $v0 1
	syscall

label32:
	li $t1 98
	bne $t2 $t1 label33
	li $t2 2
	li $t3 2
	sub $t2 $t2 $t3
	move $a0 $t2
	li $v0 1
	syscall

label33:

label28:
	sw $t2 -76($fp)
	sw $t3 -80($fp)
	jal nest
	lw $t2 -76($fp)
	lw $t3 -80($fp)
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
