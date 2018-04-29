.data

# prompt = "Enter the size of the list: "
prompt: .asciiz "Enter the size of the list: "

# size = 0
size:   .word   0

# tempPrompt = "Enter the temperatures: "
tempPrompt: .asciiz "Enter the temperature: "

# appears = " appears "
appears:    .asciiz " appears "

# times = " times"
times:  .asciiz " times\n"

# my_list = [0] * 100
.align  4
my_list:    .space  400

# i = 0
i:  .word   0

# j = 0
j:  .word   0

# k = 0
k:  .word   0

# temp = 0
temp:   .word   0
# count = 0
count:  .word   0
.text

# print(prompt)
li  $v0 4
la  $a0 prompt
syscall

# size = int(input())
li $v0, 5
syscall
sw $v0, size

# # Read input
# print(tempPrompt)
li  $v0 4
la  $a0 tempPrompt
syscall

# i = 0
li $t0, 0
sw $t0, i

# call the getList procedure
jal getList

# Call the sort procedure
jal sort

# Call the countFrequency procedure
jal countFrequency

# Exit
li $v0, 10
syscall

# getList procedure:
# agruments $a0: Size of the list
# This procedure asks the user to input 'size' number of numbers and store them in the my_list array

getList:
# Prologue. Store the 's' register onto the stack
addi $sp, $sp, -32
sw $s0, ($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $s3, 12($sp)
sw $s4, 16($sp)
sw $s5, 20($sp)

# while i < size:
while:
lw $t0, i
lw $t1, size
# If i < size ($t0 < $t1), set $t2 to True
slt $t2, $t0, $t1
# If $t2 is False (i.e., the i < size condition is False), then break the loop
beq $t2, $zero, endWhile

# Loop body:

#   my_list[i] = int(input())
    # Accept the user input
    li $v0,  5
    syscall
    # Calculate the offset (4*i)
    move $t3, $t0
    sll $t3, $t3, 2
    # Store the user input into list at the offset
    sw $v0, my_list($t3)
    # Update the value of 'i'    
#   i += 1
    lw $t0, i
    addi $t0, $t0, 1
    sw $t0, i
# Loop back
j while

endWhile:

# Epilogue: Restoring the stack and registers before returning
lw $s0, ($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
lw $s4, 16($sp)
lw $s5, 20($sp)

addi $sp, $sp, 32
# Return from the procedure
jr $ra

# Sort procedure: Sorts the my_list in place

sort:
addi $sp, $sp, -32
sw $s0, ($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $s3, 12($sp)
sw $s4, 16($sp)
sw $s5, 20($sp)

# # Sort
# i = 0
li $t0, 0
sw $t0, i

# while i < size:
sortWhile:
lw $t0, i
lw $t1, size
# if i < size, set $t2 to True(1)
slt $t2, $t0, $t1
# if $t2 is False (0) i.e., the condition is false, stop the loop
beq $t2, $zero, sortWhileEnd
# Outer_loop body
#   Initializing the loop conditions
#   j = 0
    li $t1, 0
    sw $t1, j
    
#   k = size - i - 1
    lw  $t0, size
    lw  $t1, i
    sub $t2, $t0, $t1
    subi $t3, $t2, 1
    sw $t3, k
    
#   while j < k:
    while1:
        lw $t0, j
        lw $t1, k
        slt $t2, $t0, $t1
        beq $t2, $zero, endWhile1
        
#       if my_list[j] > my_list[j + 1]:
	  # calculate the offset of j i.e.,(4j)
        move $t3, $t0
        sll $t3, $t3, 2
	   # load my_list[i] into $t3
        lw $t3, my_list($t3)
        
	  # calculate j+1
        addi $t4, $t0, 1
	  # calculate offset of j+1
        sll $t4, $t4, 2
	  # load my_list[j+1] into $t4
        lw $t4, my_list($t4)
        # If my_list[j] > my_list[j+1] ($t3 > $t4), set $t5 to True(1)
        sgt $t5, $t3, $t4
        # If $t5 is False (0), go to end the of the if block
        beq $t5, $zero, end_if

        
#           temp = my_list[j]
		 # move j into $t0
            lw $t0, j
		 # Calculate the offset of j (4*j)
            sll $t0, $t0, 2
		 # Now, load my_list[j] into $t1
            lw $t1, my_list($t0)
            
			
#           my_list[j] = my_list[j+1]
            lw $t2, j
            addi $t2, $t2, 1
            sll $t2, $t2, 2
            # Load my_list[j+1] into $t3
            lw $t3, my_list($t2)
		 # Save my_list[j+1] (present in $t3) into my_list[j]
            sw $t3, my_list($t0)
            
#           my_list[j+1] = temp
            sw $t1, my_list($t2)
            
#       j += 1
        end_if:
            lw $t0, j
            addi $t0, $t0, 1
            sw $t0, j
                j while1
        endWhile1:
        
#   i += 1
        lw $t0, i
        addi $t0, $t0, 1
        sw $t0, i
            j sortWhile

sortWhileEnd:

lw $s0, ($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
lw $s4, 16($sp)
lw $s5, 20($sp)

addi $sp, $sp, 32

jr $ra

# countFrequency procedure counts the number of times a word occurs in a sorted array and prints it

countFrequency:

addi $sp, $sp, -32
sw $s0, ($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $s3, 12($sp)
sw $s4, 16($sp)
sw $s5, 20($sp)

# i = 0
li $t0, 0
sw $t0, i

# while i < size:
while2:
lw $t0, i
lw $t1, size
slt $t2, $t0, $t1
beq $t2, $zero, endWhile2

#     count = 0
      li $t0, 0
      sw $t0, count

#     j = i
      lw $t0, i
      sw $t0, j
      
#     while j < size:
      while3:
      lw $t0, j
      lw $t1, size
      slt $t2, $t0, $t1
      beq $t2, $zero, endWhile3
      
#         if j == size - 1:
          lw $t0, j
          lw $t1, size
          sub $t2, $t1, 1
          seq $t2, $t0, $t2
          beq $t2, $zero, end_if_2
          
#             if my_list[i] == my_list[j]:
              lw $t0, i
              sll $t0, $t0, 2
              lw $t0, my_list($t0)
              lw $t1, j
              sll $t1, $t1, 2
              lw $t1, my_list($t1)
              seq $t2, $t0, $t1
              beq $t2, $zero, end_if_3
#                 count += 1
                  lw $t2, count
                  addi $t2, $t2, 1
                  sw $t2, count
end_if_3:
#             print(str(my_list[i]) + appears + str(count) + times)
              li $v0, 1
              move $a0, $t0
              syscall
              
              li $v0, 4
              la $a0, appears
              syscall
              
              li $v0, 1
              lw $a0, count
              syscall
              
              li $v0, 4
              la $a0, times
              syscall
              
              
#             if my_list[i] == my_list[j]:
              lw $t0, i
              sll $t0, $t0, 2
              lw $t0, my_list($t0)
              
              lw $t1, j
              sll $t1, $t1, 2
              lw $t1, my_list($t1)
              
              seq $t2, $t0, $t1
              beq $t2, $zero, else
#                 i = j
              lw $t0, j
              sw $t0, i
              j end_if_4
              
              else:
#             else:
                  
#                 i = j-1
                  lw $t0, j
                  addi $t0, $t0, -1
                  sw $t0, i
                 
            end_if_4:
#             j += 1
              lw $t0, j
              addi $t0, $t0, 1
              sw $t0, j
#             break
              j endWhile3

          end_if_2:
#         if my_list[j] == my_list[i]:
          lw $t0, i
          sll $t0, $t0, 2
          lw $t0, my_list($t0)
          
          lw $t1, j
          sll $t1, $t1, 2
          lw $t1, my_list($t1)
          
          seq $t2, $t0, $t1
          beq $t2, $zero, else_2
#             count += 1
              lw $t0, count
              addi $t0, $t0, 1
              sw $t0, count
#             j += 1
              lw $t0, j
              addi $t0, $t0, 1
              sw $t0, j
#             continue
              j while3
#         else:
          else_2:
#             print(str(my_list[i]) + appears + str(count) + times)
              lw $t0,i
              sll $t0, $t0, 2
              lw $t0, my_list($t0)
              
              move $a0, $t0
              li $v0, 1
              syscall
              
              la $a0, appears
              li $v0, 4
              syscall
              
              lw $a0, count
              li $v0, 1
              syscall
              
              la $a0, times
              li $v0, 4
              syscall
              

#             i = j - 1
              lw $t0, j
              addi $t0, $t0, -1
              sw $t0, i
#             j += 1
              lw $t0, j
              addi $t0, $t0, 1
              sw $t0, j

#             break
              j endWhile3
        
        end_if_5:
        
        j while3
        

endWhile3:

#     i += 1
      lw $t0, i
      addi $t0, $t0, 1
      sw $t0, i
      
      j while2
      
endWhile2:

lw $s0, ($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
lw $s4, 16($sp)
lw $s5, 20($sp)

addi $sp, $sp, 32

jr $ra
