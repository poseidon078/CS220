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
                lwc1 $f22, 0($s3)
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

        loop1:
                lwc1 $f0, 0($s3)
                lwc1 $f1, 0($s2)
                sll $t0, $s2, 2 # Convert i to memory access
                add $t0, $t0, $s0 # Add offset i to base A
                lwc1 $f2, 0($t0)
                div.s $f0, $f1, $f2
                add.s $f22, $f22, $f0
                addi $s2, $s2, 1 # ++i
                blt $s2, $s1, loop1 # Loop while i < 10

        hm:
                lwc1 $f23, 0($s3)
                lwc1 $f24, 0($s1)
                div.s $f23, $f24, $f22


                mov.s $f12, $f22

                li $v0, 2
                syscall

        exit: 
                li $v0, 10 # Load exit operation
                syscall # Exit


