#Name: Victor Martelle
	
      .data
coeff: .word 2, 2, 2
degree: .word 2
x: .word 3

	.text
	.globl main
main:	
	#loads degree number
	la $a0, degree
	lw $t1, 0($a0)
	
	#loads degree+1 for counter comparison to know when to exit
	add $s1, $t1, 1
	#loads number of coeff increment counter for counter comparison to know when to exit
	li $s0, 1
	
	#loads x
	la $a0, x
	lw $t2, 0($a0)
	
	#loads first coeff into register
	la $a0, coeff
	lw $t0, 0($a0)
	
	#jump to loop
	j loop
		
	loop:
	#multiples coeff * x and gives you a sum
	mul $t4, $t0, $t2
	
	#branch to exit to print the sum at this time if current number of coeff = degree + 1 else increment 
	beq $s0, $s1, exit  
	
	#increments number of coeff counter
	add $s0, $s0, 1
	
	#increment coeff and load into register
	add $a0, $a0, 4
	lw $t0, 0($a0)
	
	#adds coeff to sum
	add $t0, $t0, $t4 
	
	#branch to exit that prints the sum at this time if current number of coeff = degree + 1 
	beq $s0, $s1, exit2  
	
	j loop
	
	exit:
	#prints sum
	li $v0, 1
	move $a0, $t4
	syscall
	
	#exits
	li $v0, 10
	syscall	 

	exit2:
	#prints sum
	li $v0, 1
	move $a0, $t0
	syscall
	
	#exits
	li $v0, 10
	syscall	 
