.data

# prompt = "Enter the size of the list: "
prompt: .asciiz "Enter the size of the list: "

# tempPrompt = "Enter the temperatures: "
tempPrompt: .asciiz "Enter the temperatures: "

# baseTempPrompt = "Enter the base temperature: "
baseTempPrompt: .asciiz "Enter the base temperature: "

# countMsg = "The count is: "
countMsg:   .asciiz "The count is: "

# n = 0
n:  .word   0

# i = 0
i:  .word   0

# my_list = [0]*100
.align  4
my_list:    .space  400

# # Set the count to 0
# count  = 0
count:  .word 0

# baseTemp = 0
baseTemp:   .word 0 

.text
# Print the prompt
# print(prompt)
li  $v0 4
la  $a0 prompt
syscall

# Accept user input
# n = int(input())
li $v0, 5
syscall

# Store it in the variable 'n'
sw $v0, n
 

# i = 0
li $t0, 0
# Set i to 0
sw $t0, i

# while i < n:
while:
lw $t0, i
lw $t1, n
# If i < n ($t0 < $t1), set $t2 to True (1)
slt $t2, $t0, $t1
# After setting, branch to endWhile (end the loop) if $t2 is False (0)
beq $t2, $zero, endWhile
    # Prompt the user to input the temperature
    # print(tempPrompt)
      li  $v0 4
      la  $a0 tempPrompt
      syscall

#     my_list[i] = int(input())
	# Accept the user input integer
      li $v0, 5
      syscall
      # Calculate the offset (4i)
      move $t3, $t0
      sll $t3, $t3, 2
      # Store the user input in the my_list, at the specified offset
      sw $v0 my_list($t3)
      
#     i += 1
      # Increment the value of 'i' by 1
      lw $t0, i
      addi $t0, $t0, 1
      sw $t0, i
	 # Loop back to the while loop
        j while

# Label to branch if the loop condition fails        
endWhile:


# # Read in the base temp
# print(baseTempPrompt)
li  $v0 4
la  $a0 baseTempPrompt
syscall

# baseTemp = int(input())
li $v0, 5
syscall
# Store the input in the baseTemp variable
sw $v0, baseTemp

# Initialize i to 0 (counter)
# i = 0
li $t0, 0
sw $t0, i

# while i < n:
while2:
lw $t0, i
lw $t1, n
# Set $t2 to True(1) if i < n ($t0 < $t1)
slt $t2, $t0, $t1
# If $t2 is False (0), end the loop
beq $t2, $zero, endWhile2

# loop body
#     if my_list[i] > baseTemp:
      lw $t4, baseTemp
	 # Calculate offset of i (4i)
      move $t3, $t0
      sll $t3, $t3, 2
      # Load the word from my_list at the offset 4i into $t3
      lw $t3, my_list($t3)
      # Set $t5 to True if $t3 > $t4 (my_list[i] > baseTemp)
      sgt $t5, $t3, $t4
      # After setting $t5, check if it's false (0)
      # If $t5 is False, the if condition has failed. So, skip
	 # the if part
      beq $t5, $zero, end_if
#         count += 1
          lw $t0, count
          addi $t0, $t0, 1
          sw $t0, count
          
#     i += 1
      end_if:
      lw $t0, i
      addi $t0, $t0, 1
      sw $t0, i
	 # Loop back
        j while2

endWhile2:
# print(countMsg+str(count))
li $v0, 4
la $a0, countMsg
syscall

lw $a0, count
li $v0, 1
syscall

