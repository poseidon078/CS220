# Print first 10 Fibonacci numbers

main:

  # print description

  li $v0, 4               
  la $a0, description
  syscall

  # loop from $t0 = 0 until 10

  move $t0, $0     
  loop: beq $t0, 15, exit

    jal fibonacci
    jal print_output

  addi $t0, $t0, 1
  j loop

exit:
li $v0, 10
syscall

# fibonacci and print_output go here

print_output:
  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 4
  la $a0, delim
  syscall
jr $31

fibonacci:

  move $t1, $0
  move $t2, $sp
  li $t3, 1
    addi $sp, $sp, -4           # push initial $t0 on stack
  sw $t0, 0($sp)

  recursive_call:
    beq $sp, $t2, fib_exit       # if stack is empty, exit

    lw $t4, 0($sp)               # pop next $t4 off stack
    addi $sp, $sp, 4

    bleu $t4, $t3, early_return

      sub $t4, $t4, 1            # push $t4 - 1 on stack
      addi $sp, $sp, -4
      sw $t4, 0($sp)

      sub $t4, $t4, 1            # push $t4 - 2 on stack
      addi $sp, $sp, -4
      sw $t4, 0($sp)

      j recursive_call

    early_return:

      add $t1, $t1, $t4
      j recursive_call

  fib_exit:
jr $31

.data
description: .asciiz "First Fibonacci numbers less than 500:\n"
delim: .asciiz ", "