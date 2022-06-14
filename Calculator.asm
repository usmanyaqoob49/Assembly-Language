.data
Name:	.asciiz"\nName: Usman Yaqoob:\n"
Reg:	.asciiz"\nReg: 19PWCSE1754:\n"
str0:	.asciiz"\nEnter symbol:\n"
str1:	.asciiz"\nEnter first digit:\n"
str2:	.asciiz"\nEnter second digit:\n"
str3:	.asciiz"\nAddition is:\n"
str4:	.asciiz"\nSubtraction is:\n"
str5:	.asciiz"\nMultiplication  is:\n"
str6:	.asciiz"\nDivision is:\n"
str7:	.asciiz"\nLow is:\n"
str8:	.asciiz"\nHigh is:\n"
.text
main:
	
	li $v0,4
	la $a0,Name
	syscall

	li $v0,4
	la $a0,Reg
	syscall
	start:
	
	li $v0,4
	la $a0,str1
	syscall

#Getting first number from the user
	li $v0,5
	syscall
	move $t1, $v0
	
	
	li $v0,4
	la $a0,str2
	syscall

#Getting Second number from the user
	li $v0,5
	syscall
	move $t2, $v0
	
	
	li $v0,4
	la $a0,str0
	syscall

#Getting the character from user and storing its assci
	li $v0,12
	syscall
	move $t0,$v0
	
#Storing 43 in s1 that is ascii of addition 
	li $s1,43

#Comparing ascii entered by the user with ascii of addition
	beq $t0,$s1	label
		j exit
	
	label:	
		li $v0,4
		la $a0,str3
		syscall
		
		add $t3,$t1,$t2
		move $a0,$t3
		li $v0,1
		syscall
		
		

	exit:
	
#Storing ascii of subtraction key in s2 for comparison
	li $s2,45
	
	beq $t0,$s2	label1
		j exit1
	
	label1:	
		li $v0,4
		la $a0,str4
		syscall
		
		sub $t4,$t1,$t2
		move $a0,$t4
		li $v0,1
		syscall
		

	exit1:
#storing subtraction ascii in s3 for comparison
	li $s3,42
	
	beq $t0,$s3	label2
		j exit2
	
	label2:	
		li $v0,4
		la $a0,str5
		syscall
		
		mul $t5,$t1,$t2
		move $a0,$t5
		li $v0,1
		syscall
		

	exit2:

#Storing ascii of divide key for comparison
	li $s4,47
	
	beq $t0,$s4	label3
		j exit3
	
	label3:	
		
		
		div $t1,$t2
		

#Moving remainder in t7
		mfhi $t7

#Moving quotient in t8
		mflo $t8
		
		li $v0,4
		la $a0,str8
		syscall
		
		move $a0,$t7
		li $v0,1
		syscall

		li $v0,4
		la $a0,str7
		syscall
		
		move $a0,$t8
		li $v0,1
		syscall

		
		

	exit3:
	
	j start
	
	li $v0,10
	syscall
	