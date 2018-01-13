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
	lw $t1 0($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	sub $t0 $t0 $t1
	blez $t0 label1
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t1 -8($fp)
	sw $t1 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $s1 -12($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label1:
	lw $t1 0($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $t1 -12($fp)
	sw $t1 0($fp)
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
	jal f
	lw $t1 0($fp)
	sw $t1 -12($fp)
	lw $t1 -4($fp)
	sw $t1 -16($fp)
	lw $t0 -12($fp)
	lw $t1 -16($fp)
	add $t0 $t0 $t1
	sw $t0 -12($fp)
	lw $s1 -12($fp)
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
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	blez $t0 label2
	li $t0 1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label2:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label3
	li $t0 -1
	sw $t0 -8($fp)
	lw $t0 -8($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
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
	li $t0 1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -12($fp)

label4:
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	lw $t1 -8($fp)
	sw $t1 -848($fp)
	lw $t1 -844($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -848($fp)
	sw $t1 0($t0)
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	lw $t1 -8($fp)
	sw $t1 -848($fp)
	lw $t1 -844($fp)
	mul $t1 $t1 4
	li $t0 -416
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -848($fp)
	sw $t1 0($t0)
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	li $t0 1
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	add $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	lw $t1 0($fp)
	sw $t1 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	blez $t0 label4
	li $t0 1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -8($fp)

label5:
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	li $t0 1
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	bnez $t0 label6
	li $t0 3
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -816($fp)
	li $t0 2
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -820($fp)

label6:
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	li $t0 2
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	bnez $t0 label7
	li $t0 8
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -816($fp)
	li $t0 -1
	sw $t0 -844($fp)
	lw $t0 -844($fp)
	li $t1 3
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -820($fp)

label7:
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	li $t0 3
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	bnez $t0 label8
	li $t0 3
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -816($fp)
	li $t0 -1
	sw $t0 -844($fp)
	lw $t0 -844($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -820($fp)

label8:
	lw $t1 -820($fp)
	sw $t1 -844($fp)
	li $t0 0
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	beqz $t0 label9
	lw $t1 -820($fp)
	sw $t1 -848($fp)
	lw $t0 -848($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	li $t0 0
	sw $t0 -848($fp)
	lw $t0 -848($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal compare
	move $t1 $s1
	move $t0 $s1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -824($fp)
	lw $t1 -824($fp)
	sw $t1 -844($fp)
	lw $t0 -844($fp)
	lw $t1 -820($fp)
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -828($fp)
	lw $t1 -816($fp)
	sw $t1 -848($fp)
	li $t0 1
	sw $t0 -844($fp)
	lw $t0 -848($fp)
	mul $t0 $t0 4
	li $t1 -16
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -844($fp)
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -832($fp)

label10:
	lw $t1 -832($fp)
	sw $t1 -848($fp)
	lw $t1 -824($fp)
	sw $t1 -852($fp)
	lw $t0 -848($fp)
	lw $t1 -852($fp)
	add $t0 $t0 $t1
	sw $t0 -848($fp)
	li $t0 1
	sw $t0 -844($fp)
	lw $t0 -848($fp)
	mul $t0 $t0 4
	li $t1 -416
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -844($fp)
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -840($fp)
	lw $t1 -840($fp)
	sw $t1 -848($fp)
	li $t0 1
	sw $t0 -844($fp)
	lw $t0 -848($fp)
	mul $t0 $t0 4
	li $t1 -16
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -844($fp)
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -836($fp)
	lw $t1 -832($fp)
	sw $t1 -844($fp)
	lw $t1 -840($fp)
	sw $t1 -848($fp)
	lw $t1 -844($fp)
	mul $t1 $t1 4
	li $t0 -416
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -848($fp)
	sw $t1 0($t0)
	lw $t1 -840($fp)
	sw $t1 -844($fp)
	lw $t1 -832($fp)
	sw $t1 -848($fp)
	lw $t1 -844($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -848($fp)
	sw $t1 0($t0)
	lw $t1 -836($fp)
	sw $t1 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -832($fp)
	lw $t1 -12($fp)
	sw $t1 -844($fp)
	li $t0 1
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	add $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -12($fp)
	lw $t1 -12($fp)
	sw $t1 -844($fp)
	lw $t1 -828($fp)
	sw $t1 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	blez $t0 label10
	lw $t1 -836($fp)
	sw $t1 -844($fp)
	lw $t1 -816($fp)
	sw $t1 -848($fp)
	lw $t1 -844($fp)
	mul $t1 $t1 4
	li $t0 -416
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -848($fp)
	sw $t1 0($t0)
	lw $t1 -816($fp)
	sw $t1 -844($fp)
	lw $t1 -816($fp)
	sw $t1 -852($fp)
	li $t0 1
	sw $t0 -848($fp)
	lw $t0 -852($fp)
	mul $t0 $t0 4
	li $t1 -16
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -848($fp)
	mul $t0 $t0 $t1
	sw $t0 -848($fp)
	lw $t1 -820($fp)
	sw $t1 -852($fp)
	lw $t0 -848($fp)
	lw $t1 -852($fp)
	add $t0 $t0 $t1
	sw $t0 -848($fp)
	lw $t1 -844($fp)
	mul $t1 $t1 4
	li $t0 -16
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -848($fp)
	sw $t1 0($t0)

label9:
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	li $t0 1
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	add $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	lw $t1 -4($fp)
	sw $t1 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
	blez $t0 label5
	li $t0 1
	sw $t0 -848($fp)
	li $t0 1
	sw $t0 -844($fp)
	lw $t0 -848($fp)
	mul $t0 $t0 4
	li $t1 -416
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -844($fp)
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t0 -844($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 2
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -8($fp)

label11:
	lw $t1 -8($fp)
	sw $t1 -848($fp)
	li $t0 1
	sw $t0 -844($fp)
	lw $t0 -848($fp)
	mul $t0 $t0 4
	li $t1 -416
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -844($fp)
	mul $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t0 -844($fp)
	move $a0 $t0
	li $v0 1
	syscall
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	li $t0 1
	sw $t0 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	add $t0 $t0 $t1
	sw $t0 -844($fp)
	lw $t1 -844($fp)
	sw $t1 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -844($fp)
	lw $t1 0($fp)
	sw $t1 -848($fp)
	lw $t0 -844($fp)
	lw $t1 -848($fp)
	sub $t0 $t0 $t1
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
	li $t0 1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $t1 -4($fp)
	sw $t1 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 0($fp)
	lw $t1 0($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
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
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label12
	li $t0 0
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label12:
	lw $t1 0($fp)
	sw $t1 -8($fp)
	li $t0 1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	sub $t0 $t0 $t1
	bnez $t0 label13
	li $t0 1
	sw $t0 -8($fp)
	lw $s1 -8($fp)
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label13:
	lw $t1 0($fp)
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
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 -8($fp)
	lw $t1 0($fp)
	sw $t1 -16($fp)
	li $t0 2
	sw $t0 -20($fp)
	lw $t0 -16($fp)
	lw $t1 -20($fp)
	sub $t0 $t0 $t1
	sw $t0 -16($fp)
	lw $t0 -16($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 -12($fp)
	lw $t0 -8($fp)
	lw $t1 -12($fp)
	add $t0 $t0 $t1
	sw $t0 -8($fp)
	lw $t1 -8($fp)
	sw $t1 -4($fp)
	lw $t1 -4($fp)
	sw $t1 -8($fp)
	lw $s1 -8($fp)
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
	li $t0 0
	sw $t0 -120($fp)
	li $t0 1
	sw $t0 -124($fp)
	lw $t1 -120($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -124($fp)
	sw $t1 0($t0)
	li $t0 1
	sw $t0 -120($fp)
	li $t0 3
	sw $t0 -124($fp)
	lw $t1 -120($fp)
	mul $t1 $t1 4
	li $t0 -60
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -124($fp)
	sw $t1 0($t0)
	li $t0 3
	sw $t0 -120($fp)
	li $t0 4
	sw $t0 -124($fp)
	lw $t1 -120($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -124($fp)
	sw $t1 0($t0)
	li $t0 4
	sw $t0 -120($fp)
	li $t0 6
	sw $t0 -124($fp)
	lw $t1 -120($fp)
	mul $t1 $t1 4
	li $t0 -60
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -124($fp)
	sw $t1 0($t0)
	li $t0 6
	sw $t0 -120($fp)
	li $t0 8
	sw $t0 -124($fp)
	lw $t1 -120($fp)
	mul $t1 $t1 4
	li $t0 0
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -124($fp)
	sw $t1 0($t0)
	li $t0 0
	sw $t0 -140($fp)
	li $t0 1
	sw $t0 -136($fp)
	lw $t0 -140($fp)
	mul $t0 $t0 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -136($fp)
	mul $t0 $t0 $t1
	sw $t0 -136($fp)
	li $t0 1
	sw $t0 -132($fp)
	lw $t0 -136($fp)
	mul $t0 $t0 4
	li $t1 -60
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -132($fp)
	mul $t0 $t0 $t1
	sw $t0 -132($fp)
	li $t0 1
	sw $t0 -128($fp)
	lw $t0 -132($fp)
	mul $t0 $t0 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -128($fp)
	mul $t0 $t0 $t1
	sw $t0 -128($fp)
	li $t0 1
	sw $t0 -124($fp)
	lw $t0 -128($fp)
	mul $t0 $t0 4
	li $t1 -60
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -124($fp)
	mul $t0 $t0 $t1
	sw $t0 -124($fp)
	li $t0 1
	sw $t0 -120($fp)
	lw $t0 -124($fp)
	mul $t0 $t0 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -120($fp)
	mul $t0 $t0 $t1
	sw $t0 -120($fp)
	li $t0 2333
	sw $t0 -124($fp)
	lw $t1 -120($fp)
	mul $t1 $t1 4
	li $t0 -60
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -124($fp)
	sw $t1 0($t0)
	li $t0 0
	sw $t0 -124($fp)
	li $t0 1
	sw $t0 -120($fp)
	lw $t0 -124($fp)
	mul $t0 $t0 4
	li $t1 0
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -120($fp)
	mul $t0 $t0 $t1
	sw $t0 -120($fp)
	li $t0 8
	sw $t0 -128($fp)
	li $t0 1
	sw $t0 -124($fp)
	lw $t0 -128($fp)
	mul $t0 $t0 4
	li $t1 -60
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -124($fp)
	mul $t0 $t0 $t1
	sw $t0 -124($fp)
	lw $t0 -120($fp)
	lw $t1 -124($fp)
	add $t0 $t0 $t1
	sw $t0 -120($fp)
	lw $t0 -120($fp)
	move $a0 $t0
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
	lw $t1 0($fp)
	sw $t1 -4($fp)
	li $t0 99
	sw $t0 -8($fp)
	lw $t0 -4($fp)
	lw $t1 -8($fp)
	sub $t0 $t0 $t1
	blez $t0 label14
	lw $t0 4($sp)
	move $t1 $sp
	move $sp $fp
	lw $fp 8($t1)
	jr $t0

label14:
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
	lw $t0 -4($fp)
	move $a0 $t0
	li $v0 11
	syscall
	lw $t1 0($fp)
	sw $t1 -4($fp)
	lw $t0 -4($fp)
	sw $t0 0($sp)
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
	li $t0 43
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	sw $t0 chc($0)
	li $t0 45
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	sw $t0 chd($0)
	li $t0 3
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -24($fp)
	li $t0 -1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -20($fp)
	li $v0 5
	syscall
	sw $v0 -48($fp)
	lw $t1 -48($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	li $t1 0
	bne $t0 $t1 label15
	la $a0 STRING0
	li $v0 4
	syscall
	li $t0 8
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	li $t0 3
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal line

label15:
	lw $t0 -76($fp)
	li $t1 1
	bne $t0 $t1 label16
	la $a0 STRING1
	li $v0 4
	syscall
	lw $t1 0($fp)
	sw $t1 -80($fp)
	lw $t0 -80($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal fib
	move $t1 $s1
	move $t0 $s1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -16($fp)
	lw $t1 -16($fp)
	sw $t1 -76($fp)
	la $a0 STRING2
	li $v0 4
	syscall
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label16:
	lw $t0 -76($fp)
	li $t1 2
	bne $t0 $t1 label17

label18:
	lw $t1 -24($fp)
	sw $t1 -76($fp)
	li $t0 97
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -24($fp)
	sw $t1 -76($fp)
	lw $t1 -24($fp)
	sw $t1 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -24($fp)
	sw $t1 -76($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	add $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -24($fp)
	lw $t1 -24($fp)
	sw $t1 -76($fp)
	li $t0 5
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	bltz $t0 label18
	li $v0 5
	syscall
	sw $v0 -20($fp)
	li $v0 5
	syscall
	sw $v0 -4($fp)
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	li $t0 3
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	bgez $t0 label19
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t1 -8($fp)
	sw $t1 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	add $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -4($fp)
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label19:
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	li $t0 3
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	bgtz $t0 label20
	lw $t1 -8($fp)
	sw $t1 -76($fp)
	lw $t1 -4($fp)
	sw $t1 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -8($fp)
	li $t0 0
	sw $t0 -76($fp)
	li $t0 0
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -8($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	li $t0 0
	sw $t0 -76($fp)
	li $t0 0
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -8($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 0
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 0
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label20:
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	li $t0 6
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	blez $t0 label21
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	lw $t1 -8($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -12($fp)
	li $t0 1
	sw $t0 -76($fp)
	li $t0 1
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -12($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	li $t0 1
	sw $t0 -76($fp)
	li $t0 1
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -12($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label21:
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	li $t0 6
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	bltz $t0 label22
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	lw $t1 -8($fp)
	div $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -16($fp)
	li $t0 2
	sw $t0 -76($fp)
	li $t0 2
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -16($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	li $t0 2
	sw $t0 -76($fp)
	li $t0 2
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -16($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 2
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 2
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label22:
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	li $t0 4
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	beqz $t0 label23
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	lw $t1 0($fp)
	div $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -4($fp)
	li $t0 3
	sw $t0 -76($fp)
	li $t0 3
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -4($fp)
	sw $t1 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 99
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	li $t0 3
	sw $t0 -76($fp)
	li $t0 3
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 3
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 3
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label23:
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	li $t0 4
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	bnez $t0 label24
	li $t0 -1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	lw $t1 -4($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	li $t0 2
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	add $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t1 -76($fp)
	sw $t1 -4($fp)
	li $t0 4
	sw $t0 -76($fp)
	li $t0 4
	sw $t0 -84($fp)
	li $t0 1
	sw $t0 -80($fp)
	lw $t0 -84($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -80($fp)
	mul $t0 $t0 $t1
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -52
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall
	li $t0 4
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -52
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 4
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label24:
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	beq $t0 $0 label25
	lw $t1 -4($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label25:

label17:
	lw $t0 -76($fp)
	li $t1 3
	bne $t0 $t1 label26
	la $a0 STRING3
	li $v0 4
	syscall
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	beq $t0 $0 label27
	li $t0 4
	sw $t0 -76($fp)
	li $t0 -1
	sw $t0 -84($fp)
	lw $t0 -84($fp)
	li $t1 2
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t0 -84($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	li $t0 3
	sw $t0 -84($fp)
	lw $t0 -84($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal f
	move $t1 $s1
	move $t0 $s1
	sw $t0 -80($fp)
	li $t0 5
	sw $t0 -88($fp)
	li $t0 1
	sw $t0 -92($fp)
	lw $t0 -88($fp)
	lw $t1 -92($fp)
	add $t0 $t0 $t1
	sw $t0 -88($fp)
	lw $t0 -88($fp)
	sw $t0 -84($fp)
	lw $t0 -84($fp)
	lw $t1 0($fp)
	mul $t0 $t0 $t1
	sw $t0 -84($fp)
	lw $t0 -80($fp)
	lw $t1 -84($fp)
	add $t0 $t0 $t1
	sw $t0 -80($fp)
	lw $t1 -76($fp)
	mul $t1 $t1 4
	li $t0 -28
	sub $t0 $t0 $t1
	add $t0 $t0 $fp
	lw $t1 -80($fp)
	sw $t1 0($t0)

label27:
	lw $t1 conb($0)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal t
	li $t0 97
	sw $t0 -80($fp)
	lw $t0 -80($fp)
	sw $t0 0($sp)
	subi $sp $sp 4
	jal f2
	move $t1 $s1
	move $t0 $s1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 11
	syscall
	li $t0 4
	sw $t0 -80($fp)
	li $t0 1
	sw $t0 -76($fp)
	lw $t0 -80($fp)
	mul $t0 $t0 4
	li $t1 -28
	sub $t1 $t1 $t0
	add $t1 $t1 $fp
	lw $t1 0($t1)
	lw $t0 -76($fp)
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label26:
	lw $t0 -76($fp)
	li $t1 4
	bne $t0 $t1 label28
	la $a0 STRING4
	li $v0 4
	syscall
	li $v0 5
	syscall
	sw $v0 -20($fp)
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	li $t1 1
	mul $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	li $t1 0
	bne $t0 $t1 label29
	la $a0 STRING5
	li $v0 4
	syscall

label29:
	lw $t0 -76($fp)
	li $t1 1
	bne $t0 $t1 label30
	lw $t1 -20($fp)
	sw $t1 -76($fp)
	la $a0 STRING6
	li $v0 4
	syscall
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label30:
	lw $t0 -76($fp)
	li $t1 2
	bne $t0 $t1 label31
	la $a0 STRING7
	li $v0 4
	syscall

label31:
	li $v0 12
	syscall
	sw $v0 -72($fp)
	lw $t1 -72($fp)
	sw $t1 -76($fp)
	lw $t0 -76($fp)
	li $t1 97
	bne $t0 $t1 label32
	li $t0 2
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label32:
	lw $t0 -76($fp)
	li $t1 98
	bne $t0 $t1 label33
	li $t0 2
	sw $t0 -76($fp)
	li $t0 2
	sw $t0 -80($fp)
	lw $t0 -76($fp)
	lw $t1 -80($fp)
	sub $t0 $t0 $t1
	sw $t0 -76($fp)
	lw $t0 -76($fp)
	move $a0 $t0
	li $v0 1
	syscall

label33:

label28:
	jal nest
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
