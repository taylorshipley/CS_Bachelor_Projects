.text
main:
# Print the prompt for the first number
  addi 	$v0, $0, 4  		# system call 4 is for printing a string
  la 	$a0, prompt 		# address of num1Prompt is in $a0
  syscall           		# print the string
  
# Read the first number
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$t2, $0, $v0			# copy N into $8

# Call function to get fibonnacci #n
move $a0,$t2
move $v0,$t2
jal fib     	#call fib (n)
move $t3,$v0    #result is in $t3

# Output message and n
la $a0,result   #Print F_
li $v0,4
syscall

move $a0,$t2    #Print n
li $v0,1
syscall

la $a0,result2  #Print =
li $v0,4
syscall

move $a0,$t3    #Print the answer
li $v0,1
syscall

la $a0,endl #Print '\n'
li $v0,4
syscall

# End program
li $v0,10
syscall

fib:
# Compute and return fibonacci number
beqz $a0,zero   #if n=0 return 0
beq $a0,1,one   #if n=1 return 1

#Calling fib(n-1)
sub $sp,$sp,4   #storing return address on stack
sw $ra,0($sp)

sub $a0,$a0,1   #n-1
jal fib     #fib(n-1)
add $a0,$a0,1

lw $ra,0($sp)   #restoring return address from stack
add $sp,$sp,4


sub $sp,$sp,4   #Push return value to stack
sw $v0,0($sp)
#Calling fib(n-2)
sub $sp,$sp,4   #storing return address on stack
sw $ra,0($sp)

sub $a0,$a0,2   #n-2
jal fib     #fib(n-2)
add $a0,$a0,2

lw $ra,0($sp)   #restoring return address from stack
add $sp,$sp,4
#---------------
lw $s7,0($sp)   #Pop return value from stack
add $sp,$sp,4

add $v0,$v0,$s7 # f(n - 2)+fib(n-1)
jr $ra # decrement/next in stack

zero:
li $v0,0
jr $ra
one:
li $v0,1
jr $ra

.data
prompt: .asciiz "Enter a non-negative number: "
result: .asciiz "F_"
result2: .asciiz " = "
endl: .asciiz "\n"