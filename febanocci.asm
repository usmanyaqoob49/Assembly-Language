.data
str1:   .asciiz"Enter the value of n: "
str2:   .asciiz"Febanocci series till the nth term is: "
str3:   .asciiz"    "
.text
main:
#Shwoing string on the console to get the n
    li $v0,4
#Loading adress of that string in a0
    la $a0,str1
    syscall

#Now for the input storing 5 in v0 to get the n that we will use
    li $v0,5
    syscall
#Moving the recived number from the user to t0 register
    move $t0,$v0

#Now lets initialize first and second terms of the series first
    #Let the first term is stored in t1 and it will be o obviously
    li $t1,0

    #Initializing the second term that will be 1
    li $t2,1

    #Now we can make next term from above 2 so
    add $t3,$t1,$t2         #t3 = t1 + t2
#Lets show the first 2 terms on consolehere and then we will general loop code for all other

#Shwoing string 
    li $v0,4
#Loading adress of that string in a0
    la $a0,str2
    syscall
    
    #Lets show the first term
    li $v0,1
    move $a0,$t1
    syscall

    #Now for printing space between two terms
    li $v0,4
    la $a0,str3
    syscall

    #Lets show the second term
    li $v0,1
    move $a0,$t2
    syscall

    #It is time to write the loop code for finding further terms till n

    #firstly initialize loop register with 3 because we have printed first 2 terms
    li $t4,3
#loop will be executed till t3 <= t0(n) so if t3>t0 end loop
loop:   bgt $t4,$t0,endloop

        #printing space between terms
        li $v0,4
        la $a0,str3
        syscall

        #If condition is true firstly print next term
        li $v0,1
        move $a0,$t3
        syscall

        
        #After printing next term second term will become first and next term will become second term so
        abs $t1,$t2
        abs $t2,$t3
        #Then add previous two values in next value
        add $t3,$t1,$t2

        #Now lets increment our loop register
        add $t4,$t4,1  #t4 = t3+1
        #after this time to jump again to loop
        j loop


endloop:
#now we will exit the program
li $v0,10
syscall