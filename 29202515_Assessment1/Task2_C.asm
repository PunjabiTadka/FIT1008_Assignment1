
.data
# prompt = "Enter the size of the list: "
prompt:     .asciiz "Enter the size of the list: "
# itemPrompt = "Enter the item: "
itemPrompt: .asciiz "Enter the item: "
# resultMsg = "The range is: "
resultMsg:  .asciiz "The range is: "
# the_list = [0]*100
.align 4                #allocated this memory to store words (4 bytes)
the_list:   .space 400
# n = 0
n:          .word 0
# maxItem = 0
maxItem:    .word 0
# minItem = 0
minItem:    .word 0
# i = 0
i:          .word 0

.text
# Print the prompt
# print(prompt)
li $v0, 4
la $a0, prompt
syscall

# Accept the user input
# n = int(input())
li $v0, 5
syscall
# Save the user input into the variable 'n'
sw $v0, n


# Set i = 0 for counter
# i = 0
li $t0, 0
sw $t0, i

# while i < n:
while:
# load i into $t0
lw $t0, i
# load n into $t1
lw $t1, n
# If i < n ($t0 < $t1), set the $t2 to 1 (True)
slt $t2, $t0, $t1
# If $t2 == 0 (i.e., i < n is False), then branch to after_while
# i.e., skip the loop
beq $t2, $zero, after_while

# 	Inside the loop, 
# 	print the prompt asking the user ot input the item
#     print(itemPrompt)
li $v0, 4
la $a0, itemPrompt
syscall

#the_list[i] = int(input())
# Read the user input
li $v0, 5
syscall

# Calculating the memory offset of the 'i' where the input should be stored
# copy i into $t3
move $t3, $t0
# multiply i with 4 to get 4*i
# This is the offset
sll $t3, $t3, 2
# Store the user input at the address obtained by offsetting the my_list with offset 4*i (in $t3)
sw $v0, the_list($t3)
# 	Increment the value of i
#     i += 1
lw $t0, i
addi $t0, $t0, 1
sw $t0, i
# Loop back to while
    j while
# label to indicate the end of the while loop
# This lable is required because we'll have to branch here after the condition in while loop fails
after_while:


# maxItem = the_list[0]
# Load the first word of the array into $t0
lw $t0, the_list
# initialize the maxItem to this value
sw $t0, maxItem
# minItem = the_list[0]
# Also, set the minItem to this value
sw $t0, minItem

## for item in the_list:
# i = 0
li $t0, 0
sw $t0, i

# while i < n:

while_2:
    lw $t1, n
    lw $t0, i
    # After loading i in $t0 and n in $t1,
    # if i < n (ie., $t0 < $t1), set $t2 to 1 (True)
    slt $t2, $t0, $t1
    # Now, check if $t2 is 0 (if condition is False)
    # If false, branch to the end of the loop (exit the loop when condition fails).
    beq $t2, $zero, after_while2
    # Otherwise, the condition is successful, and this is the body of the loop
    
    # item = the_list[i]
    # calculate the offset of index 'i' by multipyling i with 4
    move $t3, $t0
    sll $t3, $t3, 2
    # Load word at this offset of the list into $t3
    lw $t3, the_list($t3)
    
    # if item >  maxItem:
    # Load maxItem into $t4
    lw $t4, maxItem
    # if item > maxItem ($t3 > $t4), set $t5 to True(1)
    sgt $t5, $t3, $t4
    # If $t5 is False(0), the if condition failed, so go to elif
    beq $t5, $zero, elif
    
    # If didn't go to elif, then if condition succeeded
    #maxItem = item
    # save the item (in $t3) into the variable maxItem
    sw $t3, maxItem
    # Jump to the end of if-elif ladder so that you don't execute the other cases
    j end_if
    
    # elif item < minItem:
    elif:
 
    lw $t4, minItem
    # If $t3 < $t4 (item < minItem), set $t5 to True
    slt $t5, $t3, $t4
    # If $t5 == 0 (i.e., $t5 is False), then the elif condition failed. So, go to the end of the if-else ladder
    beq $t5, $zero, end_if
    
    #minItem = item
    # Otherwise, the condition is True.
    # Body of the elif block
 
    # save the item into the minItem variable
    sw $t3, minItem
    end_if:
 
    # i+=1
    # Update i
    lw $t0, i
    addi $t0, $t0, 1
    sw $t0, i
    # Loop back
    j while_2

after_while2:
# print(resultMsg, str(maxItem - minItem))
li $v0, 4
la $a0, resultMsg
syscall

lw $t0, maxItem
lw $t1, minItem
sub $a0, $t0, $t1
li $v0, 1
syscall

