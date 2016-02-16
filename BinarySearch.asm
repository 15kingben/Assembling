.data
length: .word 6
nums: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
nums2: .word 1,3,5,6,21,56
target: .word 21
fail: .asciiz "Target not found"


.text
li $t0, 0      #start
lw $t1, length #end
lw $t2, target #target
la $t5, nums2



#addi $t5, $t5, 32

#lw $s0, ($t5)



li $v0, 1 # set up print string syscall


LOOP:
beq $t0, $t1, FAIL
add $t3, $t0, $t1
srl $t3, $t3, 1

add $s0, $t3, 0

sll $t3, $t3, 3#
add $t6, $t3, $t5
addi $t6, $t6, -8
lw $t3, ($t6)

beq $t2, $t3, SUCCESS

blt $t3, $t2, LESS
bgt $t3, $t2, GREATER


GREATER: 
move $t0, $s0
addi $t1, $t1, 1
j LOOP



LESS: 
move $t1, $s0
subi $t1, $t1, 1
j LOOP



SUCCESS: 
move $a0, $t3
syscall
j END

FAIL:li $v0, 4
la $a0, fail
syscall



END: 