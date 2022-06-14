.data
str1:   .asciiz"Enter the starting interval: "
str2:   .asciiz"Enter the endinf interval: "
str3:  .asciiz"    "
.text
main:
    #Shwoing string to get the starting interval
    li $v0,4
    la $a0,str1
    syscall

    #Now for the input of the starting interval storing 5 in v0
    li $v0,5
    syscall
    #Moving the recived number from the user to t0 register
    move $t0,$v0

    #Shwoing string to get the ending interval
    li $v0,4
    la $a0,str1
    syscall

    #Now for the input of ending interval storing 5 in v0
    li $v0,5
    syscall
    #Moving the recived number from the user to t1 register
    move $t1,$v0

    #We have to make a loop to from starting interval to ending interval
    #because we want to print prime number in between that interval
    #So if low >= high leave the loop

    li $t5,2
    div $t0,$t5
    mflo $t3
   
    
loop:   bge $t0,$t1,endloop
        li $t6,0    #Using t6 register as flag with initial value 0 
        #Now using another loop to find non prime number measn number that has factor other than themselves
        #We will start from 2
        li $t2,2
        loop1:   bgt $t2,$t3,endloop1
        #above means if t2>=t0/2(t3) end the loop otherwise keep on executing
                div $t0,$t2
                mfhi $t4
                #we did: t4 = t0%t2
                #Now of t4 == 0 means we got a non prime number that has a factor
                beqz $t4,label
                add $t2,$t2,1
                j loop1
                label:
                    li $t6,1    #making flag value 1
                    j end
endloop1:
end:
#If we get flag value 0 it means we have a prime number because we did not find a factor of it
    beqz $t6,label1
    label1:
        #print those numbers
        li $v0,1
        move $a0,$t0
        syscall

#Shwoing string to print the space
        li $v0,4
        la $a0,str3
        syscall
        j loop


endloop:
#now we will exit the program
li $v0,10
syscall

