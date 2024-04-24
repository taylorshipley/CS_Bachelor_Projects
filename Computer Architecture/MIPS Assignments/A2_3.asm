# Assembly starter file for Assignment 2.3

.data 
  num1:		.word 
  num2:		.word 
  num3:		.word 
  sum:		.word 
  small:		.word
  big:		.word
  
  
  num1Prompt:	   .asciiz "Enter the first number: \n"
  num2Prompt:	   .asciiz "Enter the second number: \n"
  num3Prompt:	   .asciiz "Enter the third number: \n"
  sumMessage:	   .asciiz "The sum of the entered numbers is: "
  leastMessage:    .asciiz "The smallest number is: "
  greatestMessage: .asciiz "The largest number is: "
  repeatMessage:   .asciiz "Would you like to try again? (Enter any number for no and 0 for yes)\n"
  newline:	   .asciiz "\n"
  

.text 

main:
  
  loop:
				# Print the prompt for the first number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, num1Prompt 			# address of num1Prompt is in $a0
  syscall           			# print the string

				# Read the first number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$8, $0, $v0			# copy num1 into $8

				# Print the prompt for the second number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, num2Prompt 		# address of num2Prompt is in $a0
  syscall           			# print the string
  
				# Read the second number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$9, $0, $v0			# copy the num2 into $9
  
				# Print the prompt for the third number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, num3Prompt 			# address of num3Prompt is in $a0
  syscall           			# print the string
    
				# Read the third number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$10, $0, $v0			# copy the num3 into $10
  
  				# Calculates the sum
  add $11, $8, $9			# Adds num1 + num2 sets it equal to $11
  add $11, $11, $10			# Adds $11 + num3 sets it equal to $11
  
  				# Print the message for the sum.
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, sumMessage 			# address of sumMessage is in $a0
  syscall           			# print the string
  
    				# Print the value of the sum.
  addi 	$v0, $0, 1  			# system call 1 is for printing a interger
  add 	$a0,$0, $11 			# address of sumMessage is in $a0
  syscall           			# print the interger
  
  				# Print a newline
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of areaIs string is in $a0
  syscall           			# print the string
  
  				#Tests for least number
  slt  	$5, $8, $9    			# test f < s
  beq 	$5, $0, Else 			# if false goto Else;
  addu  $12, $0, $8  			# least = f;
  j     Endif                 		# goto Endif;
  Else:
  addu 	$12, $0, $9 			# least = s;
  Endif:
  
  slt   $5, $12, $10    		# test least < t
  beq 	$5, $0, Else2 			# if false goto Else2;
  j   Endif2                 		# goto Endif2;
  Else2:
  addu $12, $0, $10 			# least = t;
  Endif2:

  				# Print the message for the least.
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, leastMessage 		# address of leastMessage is in $a0
  syscall           			# print the string
  
      				# Print the value of the least.
  addi 	$v0, $0, 1  			# system call 1 is for printing a interger
  add 	$a0,$0, $12 			# address of leastMessage is in $a0
  syscall           			# print the interger
  
  				# Print a newline
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of areaIs string is in $a0
  syscall           			# print the string
  
  				#Tests for largest number
  slt  	$5, $8, $9    			# test f < s
  beq 	$5, $0, Else3 			# if false goto Else3;
  addu  $13, $0, $9  			# greatest = f;
  j     Endif3                 		# goto Endif;
  Else3:
  addu 	$13, $0, $8 			# greatest = s;
  Endif3:
  
  slt   $5, $13, $10    		# test greatest < $10
  beq 	$5, $0, Endif4 			# if false goto Else4;
  addu	$13, $0, $10			# greatest = $10
  Endif4:

  				# Print the message for the greatest.
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, greatestMessage 		# address of greatestMessage is in $a0
  syscall           			# print the string
  
      				# Print the value of the greatest.
  addi 	$v0, $0, 1  			# system call 1 is for printing a interger
  add 	$a0,$0, $13 			# address of greatestMessage is in $a0
  syscall           			# print the interger
  
  				# Print a newline
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of newline string is in $a0
  syscall           			# print the string
  
				# Print the message for the repeat.
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, repeatMessage 		# address of repeatMessage string is in $a0
  syscall           			# print the string
  
  				# Read the repeatAnswer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$14, $0, $v0			# copy repeatAnswer into $14
  
  beq 	$14, $0, loop		# Loops if answer is 0
  
				# Exit from the program
exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
