.data
str1:   .asciiz"Enter the number: "
str2:   .asciiz"Factorial of the number is: "
str3:   .asciiz"Sorry you entered negative number"
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

#Now making a check point for negative numberes 
    blt $t0,0,exit

    #means if value is less than 0 mean negative go to exit

#For finding the factorial of a number we have to use loop 
#For the implementaion of the for loop we will initialize the register first

    #stroing 1 in t1 register for initializing it because it will be use in loop
    li $t1,1
    #Value of factorial will be stored in t2 so firstly initialize it 1
    li $t2,1

#Shwoing string on the console
    li $v0,4
#Loading adress of that string in a0
    la $a0,str2
    syscall


#for implementation of for loop after initialzation we used keyword "loop"
#then we used if condition that means t1 >= t0 go to end loop which means run loop till t1<=t0 
loop:   bgt $t1,$t0,endloop
        mul		$t2, $t1,$t2			# $t2 =  $t1 * t2        

#Now it is time to increment the loop register that stores the initial value 1
    add	$t1, $t1, 1		# $t1 = $t1 + 1
#Above statement will add 1 in t1 and will store result in t1

    #After increment we will make the control of loop to jump again to start for the further iterations
    j loop

endloop:
    #to show the result on conosole	  
	li $v0,1
    #moving result to a0 register because when system call will be made a0 will be checked		
	move $a0,$t2		
    syscall	

    j end   #To get rid of sequential execution of "exit"
exit:
    li $v0,4
    la $a0,str3
    syscall

end:
#now we will exit the program
li $v0,10
syscall
