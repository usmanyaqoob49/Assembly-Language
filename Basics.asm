.data
str1:	.asciiz"Enter Your First number: "
str2:	.asciiz"Enter Your Second number: "
str3:	.asciiz"Your Result is: "
str4:	.asciiz"Added Number is less than 10.Shukria:)"
str5:	.asciiz"Subtraction after success of bgt is: "
str6:	.asciiz"\n"	#For printing the newline means getting a line gap
str7:	.asciiz"The Two numbers are not equal.Shukria:)"
str8:	.asciiz"The multiplication of two numbers as they are equal: )"
.text
main:



#I have to add the str 1 here to get the message for the first number
	
	li $v0,4		#Storing 4 in v0 register because to show the string on the console	

#Loading adress of str1 in a0 because a0 will be checked when system call will be made for the string
	la $a0,str1	
	syscall

	
	li $v0,5		#asking user for the input of the first number
	syscall
	move $t4,$v0
	

#I have to add the second string over here to ask for the second number
	
	li $v0,4
	la $a0,str2
	syscall

	li $v0,5		#asking user for the input of the second number
	syscall			#Making system call so that user can enter number
	move $t5,$v0		#Sending that input in the register t5 that is stored in v0
	

	add $t6,$t4,$t5		#calculating the multiplication

#For the result string we will add that over here before making call for showing the result
	
	li $v0,4
	la $a0,str3
	syscall
	
	
	li $v0,1		#to show the result on conosole	
	move $a0,$t6		#moving result to a0 register because when system call will be made a0 will be checked
	syscall		
	



#Now I want to make a condition that if the addition is greater than 10 than perform subtraction

	li $t0,10		#Loaded 10 in t0 register so that we can compare with it

	#Adding the new line string here
	li $v0,4
	la $a0,str6
	syscall
	
#For the above purposed we will use "bgt"


#If the condition become true means t6>t0 than goexe block will be executed. goexe just a name otherwise normal line by line #execution

	bgt $t6,$t0	goexe	
		
		li $v0,4
		la $a0,str4
		syscall

		j exit	#Making it jump to exit so that it do not execute the goexe code when executin line by line code

		goexe:
			li $v0,4
			la $a0,str5
			syscall
			sub $t1,$t6,$t0
			
			li $v0,1
			move $a0,$t1
			syscall

		exit:

#Now using the condition called "beq" means if the values in the two registers are equal so do the job
#If the values of t6 and t0 are equal go to label or execute label
	
	beq $t6,$t0	label
		li $v0,4
		la $a0,str7
		syscall
		
		j exit1


		label:
			mul $t7,$t6,$t0
			li $v0,4
			la $a0,str8
			syscall

			li $v0,1
			move $a0,$t7
			syscall
		exit1:

	

		
	li $v0,10
	syscall
