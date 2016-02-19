.data
nums: .word 10,9,8,7,6,5,4,3,2,1
sorted: .word 0:10
temp: .word 0:10
length: .word 10


.text
	main:
		li $a0, 0
		lw $a1, length
		
		jal mergeSort
		
		li $v0, 1
		addi $a0, $v1, 0
		syscall
		

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
		sw $a0, 4($sp)
		sw $a1, 8($sp)
		
		beq  $a0, $a1, baseCase
		
		add $t0, $a0, $a1
		div $s1, $t0, 2
		
		sw $s1, 12($sp)
		
		
		move $a1, $s1
		jal mergeSort
		lw $a1, 8($sp)
		lw $s1, 12($sp)
		add $a0, $s1, 1
		jal mergeSort
		lw $a0, 4($sp)
		
		j merge
		endMerge:
		
		
		
		
		baseCase:
			lw $ra, ($sp)
			addi $sp, $sp, 16
			jr $ra
		
		
		merge:			
			move $t0, $a0  #start  incremented
			move $t4, $a1  #end  check
			add $t4, $t4, 1
			move $t2, $s1  #mid  check
			addi $t2, $t2, 1
			move $t3, $s1
			addi $t3, $t3, 1  #mid + 1  incremented
			
			move $t5, $t0
			loop:
				beq $t5, $t4, endLoop
				
				sll $t6, $t0, 2				
				la $s7, nums
				add $s7, $s7, $t6 
				lw $s7, ($s7)
				
				sll $t6, $t2, 2				
				la $s6, nums
				add $s6, $s6, $t6 
				lw $s6, ($s6)
				
				
				beq $s6, $s7, cpTop
				
				sll $t6, $t3, 2				
				la $s7, nums
				add $s7, $s7, $t6 
				lw $s7, ($s7)
				
				sll $t6, $t4, 2				
				la $s6, nums
				add $s6, $s6, $t6 
				lw $s6, ($s6)
				
				beq $s6, $s7, cpBottom
				
				
				sll $t6, $t0, 2				
				la $s7, nums
				add $s7, $s7, $t6 
				lw $s7, ($s7)
				
				sll $t6, $t3, 2				
				la $s6, nums
				add $s6, $s6, $t6 
				lw $s6, ($s6)
				
				
				
				
				blt $s7, $s6, cpBottom
				#bgt fallThrough
				cpTop:
					sll $t6, $t3, 2				
					la $s7, nums
					add $s7, $s7, $t6 
					lw $s7, ($s7)#top array
					
					sll $t6, $t5, 2				
					la $s6, temp
					add $s6, $s6, $t6 
					sw $s7, ($s6) #sorted array
					
					addi $t5, $t5, 1
					addi $t3, $t3, 1
					j loop
					
				cpBottom:
					sll $t6, $t0, 2				
					la $s7, nums
					add $s7, $s7, $t6 
					lw $s7, ($s7)#top array
					
					sll $t6, $t5, 2				
					la $s6, temp
					add $s6, $s6, $t6 
					sw $s7, ($s6)#sorted array
					
					addi $t5, $t5, 1
					addi $t0, $t0, 1
					j loop
				
				endLoop:
					move $t5, $t0
					sll $t5, $t5, 2
					sll $t4, $t4, 2
					cpLoop:  #loop from t0 to t4, cp temp to nums
						la $t6, temp
						add $t7, $t5, $t6
						lw $t7, ($t7)
						
						la $t6, nums
						add $t8, $t5, $t6
						sw $t7, ($t8)
						
						addi $t5, $t5, 4
						beq $t5, $t4, endCpLoop
						j cpLoop
					endCpLoop:			
					
					
					j endMerge
					
					
				
				
				
				
				
				
			
			
			
				
				
				
				
				
				
				
			
			
			
			
			
			
			
		
			
			
			j baseCase
		
		
		
		
		
		
		
