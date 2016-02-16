#.data
#length: .word 10
#nums: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
#target: .word 11

#.text
#li $v0, 1
#addi $a0, $zero, 7
#syscall 

.data # add this stuff to the data segment
# load the hello string into data memory
hello: .asciiz "Hello, world!"


.text # now we’re in the text segment
li $v0, 4 # set up print string syscall
la $a0, hello # argument to print string
syscall # tell the OS to do the syscall
li $v0, 10 # set up exit syscall
syscall 