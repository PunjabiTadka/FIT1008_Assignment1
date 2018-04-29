# Data segment. Declaring the strings and variables
.data
# prompt = 'Enter a year:'
prompt:     .asciiz "Enter a year:"

# isLeap = 'Is leap year!'
isLeap:     .asciiz "Is leap year!"

# notLeap = 'Is not a leap year'
notLeap:    .asciiz "Is not a leap year"

# year = 0
year:       .word 0

.text
# Print the prompt asking the user to enter the year
# print(prompt)
la $a0, prompt
li $v0, 4
syscall


# Accept the user input integer
# year = int(input())
li $v0, 5
syscall

# Store the user input (which is in $v0) into the varibale 'year'
sw $v0, year

# Check if the year is divisible by 400
# if year%400 == 0:
# load the year into $t0
lw $t0, year
# Divide this by 400 and store the remainder in $t0
rem $t0, $t0, 400
# If the remainder equals zero, then set $t0 to 1. Otherwise, set
# $t0 t0 0
seq $t0, $t0, $zero
# Now, if $t0 is 0, then it means that the if condition has failed. So, we need to branch to the elif_1 condition
beq $t0, $zero, elif_1
# 	If we didn't branch, it means that we are in the if condition. So, print isLeap
#     print(isLeap)
li $v0, 4
la $a0, isLeap
syscall

# After printing isLeap, we shouldn't enter the elif part. 
# So, jump to the end of if-elif ladder
j exit

# elif year%100 == 0:
# elif_1 part
elif_1:
# Load the year into $t0
lw $t0, year
# Divide year by 100 and store the remainder in $t0
rem $t0, $t0, 100
# Check if the reaminder (in $t0) equals zero
# If yes, set the $t0 to 1. Otherwise set it to 0 (setting true or false)

seq $t0, $t0, $zero
# If $t0 == zero, then it means the condition has failed. So branch to elif_2
beq $t0, $zero, elif_2
# 	If didn't branch, the condition is true. So, print notLeap
#     print(notLeap)
li $v0, 4
la $a0, notLeap
syscall
# Jump to the end of if-elif ladder so that you don't execute the other cases
j exit

elif_2:
# elif year%4 == 0:
# Similarly, load year in $t0
lw $t0, year
# Set $t0 to remainder on division by 4
rem $t0, $t0, 4
# Check if the remainder is 0 (i.e., check if divisible by 4)
seq $t0, $t0, $zero
# If false, branch to else
beq $t0, $zero, else
# If true, the previous line will be ignored and isLeap will be printed
#print(isLeap)
li $v0, 4
la $a0, isLeap
syscall
j exit
# Jump to the end of if-elif ladder so that you don't execute the other cases

# else:
else:
# print(notLeap)
li $v0, 4
la $a0, notLeap
syscall

exit:
li $v0, 10
syscall

