               .data
prompt:        .asciiz "Enter a year:"
isLeapMsg:     .asciiz "Is leap year!!"
notLeapMsg:    .asciiz "Is not a leap year!!"
year:          .word 0

            .text
            
            #Print the prompt
            # print(prompt)
            
            li $v0,4
            la $a0,prompt
            syscall
            
            # year = int(input())
            li $v0,5
            syscall
            
            sw $v0, year
            lw $a0, year
            
            # if is_leap_year(year) == 0:
            jal is_leap_year
            
            # if the procedure returned 0 in $v0, then it's not leap
            
            seq $t0, $v0, $zero
            beq $t0, $zero, else
            
                # print(notLeapMsg)
                la $a0, notLeapMsg
                li $v0, 4
                syscall
                j end_if
            
            # else:
            else:
                # Otherwise, it's leap
                # print(isLeapMsg)
                la $a0, isLeapMsg
                li $v0, 4
                syscall
                
            end_if:
            
            li $v0,10
            syscall
            
# is_leap_year procedure:
# arguments : $a0 - year
# return    : $v0 - 0 if the year is not leap and 1 if the year is leap

is_leap_year:
            # Prologue
            # Save the registers
            addi $sp, $sp, -32
            sw $s0, ($sp)
            sw $s1, 4($sp)
            sw $s2, 8($sp)
            sw $s3, 12($sp)
            sw $s4, 16($sp)
            sw $s5, 20($sp)
            sw $s6, 24($sp)
            sw $s7, 28($sp)
            
            # First check if divisible by 400
            # if year%400 == 0:
            rem $t1, $a0, 400
            seq $t2, $t1, $zero
            beq $t2, $zero, elif_1
                # If a year is divisible by 400, then it is leap
                # return  1
                li $v0, 1
                j return
            
            elif_1:
            
            # If not divisible by 400, check divisibility by 100
            # elif year%100 == 0:
            rem $t1, $a0, 100
            seq $t2, $t1, $zero
            beq $t2, $zero, elif_2
                # If they year is not divisible by 400, but divisible by 100,
                # then it is NOT a leap year. So, return False
                # return 0
                li $v0, 0
                j return
            
            elif_2:
            # elif year%4 == 0:
            rem $t1, $a0, 4
            seq $t2, $t1, $zero
            beq $t2, $zero, else_2
                # If they year is neither divisible by 400, nor by 100,
                # then check if divisible by 4. If yes, return True
                # return 1
                li $v0, 1
                j return
            # All the other cases are not leap years
            # else:
            else_2:
                # return 0
                li $v0, 0
            
            return:
            #Epilogue. Load the registers
            lw $s0, ($sp)
            lw $s1, 4($sp)
            lw $s2, 8($sp)
            lw $s3, 12($sp)
            lw $s4, 16($sp)
            lw $s5, 20($sp)
            lw $s6, 24($sp)
            lw $s7, 28($sp)
            addi $sp, $sp, 32
            
            jr $ra
