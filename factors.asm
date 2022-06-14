.data
str1:   .asciiz"Enter the number of which you want to find factor: "
str2:   .asciiz"Factor of the number are: "
str3:   .asciiz"    "
.text
main:

#Shwoing string on the console
    li $v0,4
#Loading adress of that string in a0
    la $a0,str1
    syscall

#Now for the input storing 5 in v0
    li $v0,5
    syscall
#Moving the recived number from the user to t0 register
    move $t0,$v0

#For finding the factors of a number we have to use loop because we do not to what range user will enter number
#For the implementaion of the for loop we will initialize the register first

    #stroing 1 in t1 register for initializing it because it will be use in loop
    li $t1,1

#Shwoing string on the console
    li $v0,4
#Loading adress of that string in a0
    la $a0,str2
    syscall


#for implementation of for loop after initialzation we used keyword "loop"
#then we used if condition that means t1 >= t0 go to end loop which means run loop till t1<=t0 
loop:   bgt $t1,$t0,endloop
        div		$t0, $t1			# $t0 / $t1
        mfhi	$t3					# $t3 = $t0 mod $t1 
        
       
#If t3 will be equal 0, that will be a factor of that number because if num1 % num2 ==0 then 
#num 2 is the factor of that number
        beqz $t3,label

		j exit	#Making it jump to exit so that it do not execute the goexe code when executin line by line code

        #so if the condition will be true it will jump to label where we will simply dispaly that number
        label:
            #to show the result on conosole	  
	        li $v0,1
            #moving result to a0 register because when system call will be made a0 will be checked		
	        move $a0,$t1		
	        syscall	

            #Shwoing string on the console just to print space between two factors
            li $v0,4
            #Loading adress of that string in a0
            la $a0,str3
            syscall	

        exit:

#Now it is time to increment the loop register that stores the initial value 1
    add	$t1, $t1, 1		# $t1 = $t1 + 1
#Above statement will add 1 in t1 and will store result in t1

    #After increment we will make the control of loop to jump again to start for the further iterations
    j loop

endloop:
#now we will exit the program
li $v0,10
syscall
