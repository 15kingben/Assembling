.data
nums: .word 10,9,8,7,6,5,4,3,2,1
sorted: .word 0:10
#sorted##: .word 0:10
length: .word 10


.text
	main:
		add $a0, $zero, $zero
		lw $a1, length

		subi $a1, $a1, 1
		
		la $s2, nums
		la $s3, sorted
		

		jal mergeSort
		nop
		

	li $v0, 10  #terminates the program
	syscall
	
	
#	Merge Sort PseudoCode:
#  Merge-Sort(A,p,r)
#	if(p<r)
#		q = floor((p+r)/2)
#		MergeSort(A,p,q)
#		Mergesort(A, q+1,r)
#		Merge(A,p,q,r)

# a0 = p
# s1 = q
# a1 = r

	mergeSort:
		addi $sp, $sp, -16
		sw $ra, ($sp)
		
		
		beq  $a0, $a1, baseCase
		lw $ra, ($sp)
		sw $a1, 8($sp) #nop
		
		
		
		sw $a0, 4($sp)
		
		add $t0, $a0, $a1
		srl $s1, $t0, 1
		
		sw $s1, 12($sp)
		
		
		
		jal mergeSort
		move $a1, $s1 #nop
		
		lw $a1, 8($sp)
		lw $s1, 12($sp)
		

		jal mergeSort
		add $a0, $s1, 1 #nop
		
		lw $a0, 4($sp)

		j merge
		lw $s1, 12($sp) #nop
		endMerge:
		
		
		
		
		baseCase:
			#lw $ra, ($sp)

			jr $ra
			addi $sp, $sp, 16 # nop
		
		
		merge:			
			add $t0, $a0, $zero  #start  incremented
			add $t4, $a1, $zero  #end  check
			addi $t4, $t4, 1
			add $t2, $s1, $zero  #mid  check
			addi $t2, $t2, 1
			add $t3, $s1, $zero
			addi $t3, $t3, 1  #mid + 1  incremented
			
			add $t5, $t0, $zero
			loop:
				beq $t5, $t4, endLoop
				nop
				
				
				
				
				beq $t0, $t2, cpTop
				nop#sll $t6, $t3, 2				
				
				beq $t3, $t4, cpBottom
									sll $t6, $t0, 2				
				
				sll $t6, $t0, 2				
				add $s7, $s2, $t6 
				lw $s7, ($s7)
				
				sll $t6, $t3, 2				
				add $s6, $s2, $t6 
				lw $s6, ($s6)
				
				
				
				
				blt $s7, $s6, cpBottom
									sll $t6, $t0, 2				
				#bgt fallThrough
				cpTop:
					sll $t6, $t3, 2
					add $s7, $s2, $t6 
					lw $s7, ($s7)#top array
					
					sll $t6, $t5, 2				
					add $s6, $s3, $t6 
					sw $s7, ($s6) #sorted array
					
					addi $t5, $t5, 1

					j loop
					addi $t3, $t3, 1#nop
					
				cpBottom:

					add $s7, $s2, $t6 
					lw $s7, ($s7)#top array
					
					sll $t6, $t5, 2				
					add $s6, $s3, $t6 
					sw $s7, ($s6)#sorted array
					
					addi $t5, $t5, 1
					j loop
					addi $t0, $t0, 1#nop
				
				endLoop:
					add $t5, $a0, $zero
					sll $t5, $t5, 2
					sll $t4, $a1, 2
					addi $t4, $t4, 4
					cpLoop:  #loop from t0 to t4, cp sorted## to nums
						add $t7, $t5, $s3
						lw $t7, ($t7)
						
						add $t8, $t5, $s2

						
						addi $t5, $t5, 4
						beq $t5, $t4, endCpLoop
						sw $t7, ($t8)#nop
						j cpLoop
						nop
					endCpLoop:			
					
					
					j endMerge
					lw $ra, ($sp)#nop
					
				
				
				
				
				
				
			
			
			
				
				
				
				
				
				
				
			
			
			
			
			
			
			
		
			
			
			
		
		
		
		
		
		
