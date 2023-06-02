.data
        message2: .asciiz "Enter array elements line by line: "
        message3: .asciiz "No: "
        message4: .asciiz "Yes: "
        A: .space 48

.text
.globl main

        main:
                la $s0, A # Array A
                li $s1, 6 # Length of A
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
        
        arrin:         
                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($s3)

                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($s4)

                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($t0)

                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($t1)

                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($t2)

                # read element of A and store it
                li $v0, 5
                syscall 
                sw $v0, 0($t3)


        comp:

                li.s $f0, 0.0
                li.s $f1, 0.0
                li.s $f9, 0.0
                lwc1 $f3, 0($s3)
                lwc1 $f4, 0($s4)
                lwc1 $f5, 0($t0)
                lwc1 $f6, 0($t1)
                lwc1 $f7, 0($t2)
                lwc1 $f8, 0($t3)
                add.s $f0, $f0, $f3
                sub.s $f0, $f0, $f6
                mul.s $f0, $f0, $f0
                add.s $f1, $f1, $f4
                sub.s $f1, $f1, $f7
                mul.s $f1, $f1, $f1
                add.s $f0, $f0, $f1
                add.s $f9, $f5, $f8
                mul.s $f9, $f9, $f9
                sub.s $f0, $f0, $f9
                c.gt.s $f0, label1
                j label2


        label1:
                # message requesting A as input
                li $v0, 4
                la $a0, message3
                syscall

        label2:
                # message requesting A as input
                li $v0, 4
                la $a0, message4
                syscall
