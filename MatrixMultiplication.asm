.data
matrixA: .word 1,2,3,4,5,6
matrixB: .word 5,6,7,8,9,10
sizeA: .word 3,2
sizeB: .word 2,3
result: .word 0:9


.text
lw $s0, sizeA
lw $s1, sizeB
la $t3, sizeB
lw $s2, 4($t3)

li $v0, 1
li $t5, 0


#s3 = A Rows
#s4 = B Cols
#S5 = A Cols/ B Rows position
#result counter = s6
#s7 = sum
li $s3, 0
li $s4, 0
li  $s5, 0
li $s6 , 0
li $s7, 0

loop1:
	beq $s3, $s0, endLoop1
	
	
	
	loop2:
		beq $s4, $s2, endLoop2
		loop3:
			#t0 = matrix A pos
			#t1 = matrix B pos
			li $t0, 0
			li $t1, 0
			
			beq $s5, $s1, endLoop3
			# a = aRows * ColSize + s5   b = bCols * BRoSize + s5
		
			mul $t0, $s3, $s1 #skip to row start position
			add $t0, $t0, $s5 #add on counter 
		
			add $t1, $s4, $zero #skip to start of correct column
			mul $t2, $s2, $s5   # skip over counter*rows   
			add $t1, $t2, $t1   # add this number to column start
			
			la $t9, matrixA
			sll $t0, $t0, 2
			add $t9, $t9, $t0
			lw $t8, ($t9)
			move $t7, $t8
			
			la $t9, matrixB
			sll $t1, $t1, 2
			add $t9, $t9, $t1
			lw $t8, ($t9)
			mul $t7, $t7, $t8
			
			add $s7, $s7, $t7
			addi $s5, $s5, 1
			
			j loop3
			endLoop3:
			li $s5, 0
			
			la $t6, result
			sll $t0, $t5, 2
			add $t6, $t6, $t0
			addi $t5, $t5, 1
			sw $s7, ($t6)
			li $s7, 0
	
	addi $s4, $s4, 1
	j loop2	
	endLoop2:
	li $s4, 0

addi $s3, $s3, 1		
j loop1

endLoop1:








