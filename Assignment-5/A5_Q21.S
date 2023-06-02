.data
        message2: .asciiz "Enter array elements line by line: "
        A: .space 48

.text
.globl main

        main:
                la $s0, A # Array A
                li $s1, 10 # Length of A
                li $s2, 1 # i
                li $s3, 0 # j
                li $s4, 0 # v
                li $t0, 0 # Address of A[i]
                li $t1, 0 # Address of A[j]
                li $t2, 0 # Value of A[i]
                li $t3, 0 # Value of A[j]

                # setup counter in $s5
                li $s5, 0

                # message requesting A as input
                li $v0, 4
                la $a0, message2
                syscall
        
        arr_in:         
                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($s0)

                # move pointer to A ahead
                addi $s0, $s0, 4

                # increment counter and check for loop ending
                addi $s5, $s5, 1
                bne $s5, $s1, arr_in 

                # reset counter in $s0 if loop is done
                li $s5, 0
                
                # reset pointer to A
                la $s0, A 

        Loop1: 
                sll $t0, $s2, 2 # Convert i to memory access
                add $t0, $t0, $s0 # Add offset i to base A
                lw $s4, 0($t0) # v = A[i]
                addi $s3, $s2, -1 # j = i - 1
                sll $t1, $s3, 2 # Convert j to memory access
                add $t1, $t1, $s0 # Add offset j to base A
        
        Loop2:
                lw $t3, 0($t1) # load A[j]
                blt $t3, $s4, Break # Continue looping if A[j] >= v
                sw $t3, 4($t1) # A[j+1] = A[j]
                addi $s3, $s3, -1 # --j
                addi $t1, $t1, -4 # Keep memory access consistent with j
                bge $s3, $0, Loop2 # Loop if j >= 0
        
        Break:
                sw $s4, 4($t1) # A[j+1] = v
                addi $s2, $s2, 1 # ++i
                blt $s2, $s1, Loop1 # Loop while i < 10

        loop3:
                bge     $t5, 10, exit

                # load word from addrs and goes to the next addrs
                lw      $t6, 0($s0)
                addi    $s0, $s0, 4

                # syscall to print value
                li      $v0, 1      
                move    $a0, $t6
                syscall
                # optional - syscall number for printing character (space)
                li      $a0, 32
                li      $v0, 11  
                syscall


                #increment counter
                addi    $t5, $t5, 1
                j      loop3



        exit: 
                li $v0, 10 # Load exit operation
                syscall # Exit