# Assembly file for Assignment 2.4

.data 

  
  
  gPrompt:	   .asciiz "Enter g = \n"
  hPrompt:	   .asciiz "Enter h = \n"
  iPrompt:	   .asciiz "Enter i = \n"
  jPrompt:	   .asciiz "Enter j = \n"
  fMessage: 	   .asciiz "f = "
  newline:	   .asciiz "\n"
  formulaMessage:   .asciiz "leaf_example(int g, int h, int i, int j) returns f\nf = 		  (g + h) - (i + j)"
  

.text 

				# Print the prompt for the first number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, gPrompt 			# address of gPrompt is in $a0
  syscall           			# print the string

				# Read the first number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$8, $0, $v0			# copy num1 into $8

				# Print the prompt for the second number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, hPrompt 			# address of num2Prompt is in $a0
  syscall           			# print the string
  
				# Read the second number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$9, $0, $v0			# copy the num2 into $9

				# Print the prompt for the third number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, iPrompt 			# address of num3Prompt is in $a0
  syscall           			# print the string
    
				# Read the third number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$10, $0, $v0			# copy the num3 into $10
  
				# Print the prompt for the third number
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, jPrompt 			# address of num3Prompt is in $a0
  syscall           			# print the string
    
				# Read the third number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$11, $0, $v0			# copy the num3 into $10

				# Setting up the formula
  add	$12, $8, $9			# Add G + H
  add	$13, $11, $10 			# Add I + J
  sub	$14, $12, $13			# Subtract $12 from $13 and set it to F

   				# Print the value of F.
  addi 	$v0, $0, 1  			# system call 1 is for printing a integer
  add 	$a0,$0, $14 			# address of sumMessage is in $a0
  syscall           			# print the integer
  
				# Exit from the program
  exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
